class AppException {
  AppException(this.message);

  final String message;

  @override
  String toString() => message;
}
