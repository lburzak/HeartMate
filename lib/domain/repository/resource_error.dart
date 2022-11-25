class ResourceError extends Error {
  final String message;

  ResourceError(this.message);
}

class NoSuchResourceError extends ResourceError {
  NoSuchResourceError() : super("Resource not found");
}

class ResourceAlreadyExistsError extends ResourceError {
  ResourceAlreadyExistsError() : super("Resource already exists");
}
