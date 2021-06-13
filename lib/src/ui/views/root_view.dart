import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zone/src/models/viewmodels/root_view_model.dart';
import 'package:zone/src/ui/views/camera_view.dart';
import 'package:zone/src/ui/views/home_view.dart';

class RootView extends StatelessWidget {
  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return CameraView();
      default:
        return const HomeView();
    }
  }

  @override
  ViewModelBuilder<RootViewModel> build(BuildContext context) {
    return ViewModelBuilder<RootViewModel>.reactive(
      viewModelBuilder: () => RootViewModel(),
      builder: (BuildContext context, RootViewModel model, Widget? child) =>
          Scaffold(
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: model.reverse,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          ),
          child: getViewForIndex(model.currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[800],
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Todos',
              icon: Icon(Icons.art_track),
            ),
            BottomNavigationBarItem(label: 'Create', icon: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
