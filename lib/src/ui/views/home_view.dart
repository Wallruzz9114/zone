import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacked/stacked.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:zone/src/models/viewmodels/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ViewModelBuilder<HomeViewModel> build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (HomeViewModel model) => model.listenToPosts(),
      builder: (BuildContext context, HomeViewModel model, Widget? child) =>
          Scaffold(
        body: Container(
          margin: const EdgeInsets.all(12),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            itemCount: model.posts.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: model.posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            staggeredTileBuilder: (int index) {
              return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
            },
          ),
        ),
      ),
    );
  }
}
