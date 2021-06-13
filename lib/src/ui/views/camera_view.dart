import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  CameraView({Key? key, this.controller}) : super(key: key);

  final PageController? controller;
  final double iconHeight = 30;
  final PageController bottomPageController =
      PageController(viewportFraction: .2);

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late CameraController _cameraController;
  late Future<void> _controllerInitializer;
  double cameraHorizontalPosition = 0;

  Future<CameraDescription> getCamera() async {
    final List<CameraDescription> descriptions = await availableCameras();
    return descriptions.first;
  }

  @override
  void initState() {
    super.initState();

    getCamera().then((CameraDescription camera) {
      if (camera == null) {
        return;
      }

      setState(() {
        _cameraController = CameraController(camera, ResolutionPreset.high);
        _controllerInitializer = _cameraController.initialize();
        _controllerInitializer.whenComplete(() {
          cameraHorizontalPosition = MediaQuery.of(context).size.width *
              _cameraController.value.aspectRatio /
              2;
        });
      });
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Stack build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned.fill(
          left: cameraHorizontalPosition,
          right: cameraHorizontalPosition,
          child: FutureBuilder<void>(
            future: _controllerInitializer,
            builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final Size size = MediaQuery.of(context).size;
                return ClipRect(
                  child: Transform.scale(
                    scale:
                        _cameraController.value.aspectRatio / size.aspectRatio,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: _cameraController.value.aspectRatio,
                        child: CameraPreview(_cameraController),
                      ),
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  bottom: 50,
                  right: 40,
                  left: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: widget.iconHeight,
                        child: const Icon(Icons.flash_on, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () async {
                          try {
                            await _controllerInitializer;
                            final XFile image =
                                await _cameraController.takePicture();
                            print(image);
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(35),
                            ),
                            border: Border.all(
                              width: 10,
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: widget.iconHeight,
                        child: const Icon(Icons.cached, color: Colors.white),
                      ),
                      Container(
                        height: widget.iconHeight,
                        child: const Icon(Icons.tag_faces, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: PageView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        'Item $index',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      );
                    },
                    itemCount: 20,
                  ),
                ),
                const Positioned(
                  child: Icon(Icons.arrow_drop_up, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
