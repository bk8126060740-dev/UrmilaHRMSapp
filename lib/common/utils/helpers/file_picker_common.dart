import 'dart:io';
import 'package:file_picker/file_picker.dart';

class CustomFilePicker {
  static Future<File?> pickFile({
    FileType fileType = FileType.custom,
    List<String>? allowedExtensions,
    bool allowCompression = true,
    int compressionQuality = 30,
  }) async {
    File? file;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      compressionQuality: compressionQuality,
      type: fileType,
      allowedExtensions: allowedExtensions,
    );
    if (result != null) {
      final filePath = result.files.first.path;
      if (filePath != null) {
        file = File(filePath);
      }
    }
    return file;
  }
}
