import 'package:flutter/material.dart';

class BusyOverlay extends StatelessWidget {
  const BusyOverlay({
    required this.child,
    this.title = 'Please wait...',
    this.show = false,
  });

  final Widget child;
  final String title;
  final bool show;

  @override
  Material build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Material(
      child: Stack(
        children: <Widget>[
          child,
          IgnorePointer(
            child: Opacity(
              opacity: show ? 1.0 : 0.0,
              child: Container(
                width: screenSize.width,
                height: screenSize.height,
                alignment: Alignment.center,
                color: const Color.fromARGB(100, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const CircularProgressIndicator(),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
