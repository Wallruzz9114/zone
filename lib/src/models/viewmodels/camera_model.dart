import 'package:camera/camera.dart';

class CameraViewModel {
  Future<CameraDescription> getCamera() async {
    final List<CameraDescription> descriptions = await availableCameras();
    return descriptions.first;
  }
}
