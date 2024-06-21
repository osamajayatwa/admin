import 'dart:io';
import 'package:admin_fujika_ecommerce/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUpLoadCamera() async {
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 80);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

bool isFilePickerActive = false;

Future<File?> fileUploadGallery({bool issvg = false}) async {
  if (isFilePickerActive) {
    print('File picker is already active.');
    return null;
  }
  isFilePickerActive = true;

  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          issvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "JPG", "jpeg", "gif"],
    );

    if (result != null && result.files.isNotEmpty) {
      final filePath = result.files.single.path;
      if (filePath != null) {
        return File(filePath);
      } else {
        print("File path is null.");
        return null;
      }
    } else {
      return null;
    }
  } catch (e) {
    print("Error picking file: $e");
    return null;
  } finally {
    isFilePickerActive = false;
  }
}

Future<File?> fileUploadGalleryitem({bool issvg = false}) async {
  if (isFilePickerActive) {
    print('File picker is already active.');
    return null;
  }
  isFilePickerActive = true;

  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          issvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "JPG", "jpeg", "gif"],
    );

    if (result != null && result.files.isNotEmpty) {
      final filePath = result.files.single.path;
      if (filePath != null) {
        return File(filePath);
      } else {
        print("File path is null.");
        return null;
      }
    } else {
      return null;
    }
  } catch (e) {
    print("Error picking file: $e");
    return null;
  } finally {
    isFilePickerActive = false;
  }
}

showbottommenu(imageUpLoadCamera(), fileUploadGalleryitem()) {
  Get.bottomSheet(Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: AppColor.backgroundcolor,
        padding: const EdgeInsets.all(10),
        height: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: const Text(
                "Choose Image",
                style: TextStyle(
                    fontSize: 22,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              onTap: () {
                imageUpLoadCamera();
                Get.back();
              },
              leading: const Icon(
                Icons.camera_alt,
                size: 40,
              ),
              title: const Text(
                "Open Camera",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () {
                fileUploadGallery();
                Get.back();
              },
              leading: const Icon(
                Icons.camera,
                size: 40,
              ),
              title: const Text(
                "Open Gallery",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      )));
}
