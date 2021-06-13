class Post {
  Post({
    required this.userId,
    required this.title,
    required this.postion,
    required this.documentId,
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;
  final String userId;
  final Map<dynamic, dynamic> postion;
  final String documentId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'title': title,
      'position': postion,
      'imageUrl': imageUrl,
    };
  }

  static Post fromMap(Map<String, dynamic> map, String documentId,
      Map<dynamic, dynamic> position) {
    if (map == null) {
      return map as Post;
    }

    return Post(
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      userId: map['userId'] as String,
      documentId: documentId,
      postion: position,
    );
  }
}
