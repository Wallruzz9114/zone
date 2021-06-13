import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:location/location.dart';
import 'package:zone/src/models/entities/post.dart';

class FirestoreService {
  final CollectionReference<Map<String, dynamic>> _postsCollectionReference =
      FirebaseFirestore.instance.collection('posts');
  final Location location = Location();
  final double radius = 100.0;
  final Geoflutterfire geo = Geoflutterfire();

  Future<dynamic> addPost(Post post) async {
    try {
      await _postsCollectionReference.add(post.toMap());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future<dynamic> getPostsOnceOff() async {
    final LocationData position = await location.getLocation();
    final CollectionReference<Map<String, dynamic>> ref =
        FirebaseFirestore.instance.collection('posts');
    final GeoFirePoint center =
        geo.point(latitude: position.latitude!, longitude: position.longitude!);

    try {
      print('Sub reached');

      final Stream<List<DocumentSnapshot<Map<String, dynamic>>>> stream = geo
          .collection(collectionRef: ref)
          .within(center: center, radius: radius, field: 'position');

      return stream;
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }
}
