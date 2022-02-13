class Failure {
  const Failure(this.message, [this.statusCode]);
  final int? statusCode;
  final String message;
  @override
  String toString() {
    return message;
  }
}
