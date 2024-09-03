abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);

  @override
  String toString() => errMessage;
}
