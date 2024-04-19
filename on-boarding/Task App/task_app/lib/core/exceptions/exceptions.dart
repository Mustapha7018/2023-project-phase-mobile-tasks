class ServerFailure implements Exception {
  final String message;
  ServerFailure({this.message = "Unexpected server error occurred."});

  @override
  String toString() => message;
}

class CacheFailure implements Exception {
  final String message;
  CacheFailure({this.message = "Failed to access or modify the local cache."});

  @override
  String toString() => message;
}
