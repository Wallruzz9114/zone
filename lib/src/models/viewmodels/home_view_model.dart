import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zone/src/locator.dart';
import 'package:zone/src/models/entities/post.dart';
import 'package:zone/src/models/viewmodels/base_model.dart';
import 'package:zone/src/services/firestore_service.dart';

class HomeViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  final List<Post> _posts = <Post>[];
  List<Post> get posts => _posts;

  Future<void> listenToPosts() async {
    setBusy(true);
    final dynamic postResults = await _firestoreService.getPostsOnceOff();
    setBusy(false);

    await postResults
        .listen((List<DocumentSnapshot<Map<String, dynamic>>> documentList) {
      for (final DocumentSnapshot<Map<String, dynamic>> document
          in documentList) {
        final Map<String, dynamic>? data = document.data();
        final dynamic posturl = data!['url'];
        _posts.add(posturl as Post);
        notifyListeners();
      }
    });

    print(posts);
  }
}
