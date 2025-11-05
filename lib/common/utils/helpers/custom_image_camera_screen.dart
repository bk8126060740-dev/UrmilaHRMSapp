import 'dart:io';
import 'dart:math' as math;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/button/custom_button.dart';

class CustomImageCameraScreen extends StatefulWidget {
  const CustomImageCameraScreen({
    super.key,
    this.preferredDevice = CameraDevice.front,
  });

  final CameraDevice preferredDevice;

  @override
  State<CustomImageCameraScreen> createState() =>
      _CustomImageCameraScreenState();
}

class _CustomImageCameraScreenState extends State<CustomImageCameraScreen> {
  CameraController? _controller;
  Future<void>? _initFuture;
  XFile? _captured;

  @override
  void initState() {
    super.initState();
    _initFuture = _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final desired = widget.preferredDevice == CameraDevice.front
        ? CameraLensDirection.front
        : CameraLensDirection.back;

    final description = cameras.firstWhere(
      (c) => c.lensDirection == desired,
      orElse: () => cameras.isNotEmpty
          ? cameras.first
          : (throw StateError('No cameras found')),
    );

    final controller = CameraController(
      description,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    await controller.initialize();
    if (!mounted) return;
    setState(() => _controller = controller);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) return;
    final file = await _controller!.takePicture();
    if (!mounted) return;
    setState(() => _captured = file);
  }

  void _retake() {
    setState(() => _captured = null);
  }

  void _usePhoto() {
    Navigator.of(context).pop<XFile?>(_captured);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder<void>(
          future: _initFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (_controller == null) {
              return const Center(
                child: Text(
                  'Camera unavailable',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            final preview = _captured == null
                ? CameraPreview(_controller!)
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Image.file(
                      File(_captured!.path),
                      fit: BoxFit.contain,
                    ),
                  );

            return Stack(
              children: [
                Positioned.fill(child: Center(child: preview)),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 24,
                  child: Center(
                    child: _captured == null
                        ? SizedBox(
                            height: 64,
                            child: ElevatedButton(
                              onPressed: _takePicture,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.surfaceContainer,
                                minimumSize: const Size(0, 0),
                                // avoid full-width themes
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(18),
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 28,
                                color: AppColors.surfaceTextIconColor,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min, // wrap content
                            children: [
                              SizedBox(
                                child: CustomButton(
                                  onTap: _retake,
                                  text: 'Retake',
                                  borderColor: AppColors.borderColor,
                                  backgroundColor: AppColors.secondaryColor,
                                  textColor: AppColors.primaryColor,
                                ),
                              ),
                              const SizedBox(width: 16),
                              SizedBox(
                                child: CustomButton(
                                  onTap: _usePhoto,
                                  text: 'Use Photo',
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 12,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop<XFile?>(null),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
