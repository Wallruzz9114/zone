import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:zone/src/helpers/app_exception.dart';
import 'package:zone/src/models/viewmodels/cloud_storage_result.dart';

class CloudStorageService {
  Future<CloudStorageResult> uploadImage({
    required File imageToUpload,
    required String title,
  }) async {
    final String imageFileName =
        title + DateTime.now().millisecondsSinceEpoch.toString();
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFileName);
    final UploadTask uploadTask = firebaseStorageRef.putFile(imageToUpload);
    final TaskSnapshot storageSnapshot = uploadTask.snapshot;
    final String downloadUrl = await storageSnapshot.ref.getDownloadURL();

    uploadTask.whenComplete(
      () => CloudStorageResult(
        imageUrl: downloadUrl.toString(),
        imageFileName: imageFileName,
      ),
    );

    throw AppException('Error while trying to upload image');
  }
}
