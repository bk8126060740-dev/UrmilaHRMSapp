import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../navigation_service/navigation_service.dart';
import 'custom_image_camera_screen.dart';

class CustomImageFilePicker {
  final ImagePicker _imagePicker = ImagePicker();

  /// Picks an image from [source], optionally crops and compresses it.
  // Future<XFile?> pickImage(
  //   ImageSource source, {
  //   int? imageQuality,
  //   double? maxHeight,
  //   double? maxWidth,
  //   CameraDevice preferredDevice = CameraDevice.front,
  //   bool crop = false,
  //   bool isCompressed = true,
  //   int maxSizeKB = 100,
  //   VoidCallback? onCompressStart, // ✅ new
  // }) async {
  //   try {
  //     final XFile? pickedFile = await _imagePicker.pickImage(
  //       source: source,
  //       imageQuality: imageQuality,
  //       maxHeight: maxHeight,
  //       maxWidth: maxWidth,
  //       preferredCameraDevice: preferredDevice,
  //     );
  //
  //     if (pickedFile == null) return null;
  //
  //     XFile workingFile = pickedFile;
  //
  //     // ---------- CROPPING ----------
  //     if (crop) {
  //       final CroppedFile? croppedFile = await ImageCropper().cropImage(
  //         sourcePath: workingFile.path,
  //         uiSettings: [
  //           AndroidUiSettings(
  //             toolbarTitle: 'Crop Image',
  //             toolbarColor: AppColors.primaryColor,
  //             toolbarWidgetColor: Colors.white,
  //             initAspectRatio: CropAspectRatioPreset.original,
  //             lockAspectRatio: false,
  //           ),
  //           IOSUiSettings(title: 'Crop Image'),
  //         ],
  //       );
  //
  //       if (croppedFile != null) {
  //         workingFile = XFile(croppedFile.path);
  //       }
  //     }
  //
  //     // ---------- COMPRESSION ----------
  //     if (isCompressed) {
  //       // notify before compression starts
  //       onCompressStart?.call();
  //       final XFile? compressed = await _resizeImageIfNeeded(workingFile);
  //       return compressed;
  //     }
  //
  //     // If not compressed or compression failed
  //     return workingFile;
  //   } catch (e, stackTrace) {
  //     debugPrint("❌ Error picking/cropping/compressing image: $e\n$stackTrace");
  //     return null;
  //   }
  // }

  /// In-memory compression → returns XFile (no saving to disk)
  Future<XFile?> _resizeImageIfNeeded(XFile image) async {
    File file = File(image.path);
    int fileSize = await file.length();
    print('Original file size: ${fileSize / 1024} KB'); // in KB

    // If the file size is more than 100 KB, resize the image
    if (fileSize > 100 * 1024) {
      // Load the image
      img.Image? originalImage = img.decodeImage(file.readAsBytesSync());

      // If image loading was successful, resize it
      if (originalImage != null) {
        img.Image resizedImage = img.copyResize(
          originalImage,
          width: 600,
        ); // Resize the image (optional size)

        // Save the resized image to a new file
        List<int> resizedBytes = img.encodeJpg(
          resizedImage,
          quality: 80,
        ); // Lower quality to reduce size
        File resizedFile = await file.writeAsBytes(resizedBytes);
        int resizedFileSize = await resizedFile.length();

        print('Resized file size: ${resizedFileSize / 1024} KB'); // in KB

        // Return the resized image as a new XFile
        return XFile(resizedFile.path);
      }
    }

    // Return the original image if no resizing is needed
    return image;
  }

  Future<XFile?> pickImage(
    ImageSource source, {
    int? imageQuality,
    double? maxHeight,
    double? maxWidth,
    CameraDevice preferredDevice = CameraDevice.front,
    bool crop = false,
    bool isCompressed = true,
    int maxSizeKB = 100,
    VoidCallback? onCompressStart,
  }) async {
    BuildContext? context = NavigationService.navigatorKey.currentContext;

    try {
      XFile? workingFile;

      if (source == ImageSource.camera) {
        // Push camera screen with preview and confirmation
        workingFile = await Navigator.of(context!).push<XFile?>(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) =>
                CustomImageCameraScreen(preferredDevice: preferredDevice),
          ),
        );
        if (workingFile == null) return null;

        // Ensure selfies aren't mirrored on iOS front camera
        if (preferredDevice == CameraDevice.front) {
          workingFile = await ensureNotMirrored(
            workingFile,
            isFrontCamera: true,
          );
        }
      } else {
        // Gallery via image_picker (unchanged)
        final pickedFile = await _imagePicker.pickImage(
          source: ImageSource.gallery,
          imageQuality: imageQuality,
          maxHeight: maxHeight,
          maxWidth: maxWidth,
          preferredCameraDevice: preferredDevice,
        );
        if (pickedFile == null) return null;
        workingFile = pickedFile;
      }

      // ---------- CROPPING ----------
      if (crop) {
        final croppedFile = await ImageCropper().cropImage(
          sourcePath: workingFile.path,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: AppColors.primaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
            ),
            IOSUiSettings(title: 'Crop Image'),
          ],
        );
        if (croppedFile != null) {
          workingFile = XFile(croppedFile.path);
        }
      }

      // ---------- COMPRESSION ----------
      if (isCompressed) {
        onCompressStart?.call();
        final XFile? compressed = await _resizeImageIfNeeded(workingFile);
        return compressed ?? workingFile;
      }

      return workingFile;
    } catch (e, st) {
      debugPrint('❌ Error picking/cropping/compressing image: $e\n$st');
      return null;
    }
  }

  // Flip horizontally on iOS for front camera, writing back to the same file.
  // Skips on Android to avoid double flip.
  Future<XFile> ensureNotMirrored(
    XFile file, {
    required bool isFrontCamera,
  }) async {
    if (!isFrontCamera) return file; // never flip back camera

    try {
      final bytes = await File(file.path).readAsBytes();

      final decoded = img.decodeImage(bytes);
      if (decoded == null) return file;

      // Apply EXIF orientation so we flip the actual visual pixels correctly
      final oriented = img.bakeOrientation(decoded);

      // Un-mirror selfies
      final unMirrored = img.flipHorizontal(oriented);

      final encoded = img.encodeJpg(unMirrored, quality: 95);
      await File(file.path).writeAsBytes(encoded, flush: true);
      return XFile(file.path);
    } catch (_) {
      return file;
    }
  }
}
