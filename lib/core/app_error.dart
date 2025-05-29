// create an app error class that extends Exception
class AppError implements Exception {
  final String message;
  final StackTrace? stackTrace;

  AppError(
    this.message, {
    required this.stackTrace,
  });

  @override
  String toString() => 'AppError: $message';
}

class NetworkError extends AppError {
  NetworkError({StackTrace? stackTrace})
      : super(
          'Network error occurred',
          stackTrace: stackTrace,
        );
}

class NotFoundError extends AppError {
  NotFoundError(
    super.message, {
    super.stackTrace,
  });
}

class UnauthorizedError extends AppError {
  UnauthorizedError({
    StackTrace? stackTrace,
  }) : super(
          'Unauthorized access',
          stackTrace: stackTrace,
        );
}

class TypeError extends AppError {
  TypeError({
    StackTrace? stackTrace,
  }) : super(
          'Type error occurred',
          stackTrace: stackTrace,
        );
}

class BadRequestError extends AppError {
  BadRequestError({
    StackTrace? stackTrace,
  }) : super(
          'Bad request',
          stackTrace: stackTrace,
        );
}

class InternalServerError extends AppError {
  InternalServerError({
    StackTrace? stackTrace,
  }) : super(
          'Internal server error',
          stackTrace: stackTrace,
        );
}

class TimeoutError extends AppError {
  TimeoutError({
    StackTrace? stackTrace,
  }) : super(
          'Request timed out',
          stackTrace: stackTrace,
        );
}

class UnknownError extends AppError {
  UnknownError({
    StackTrace? stackTrace,
  }) : super(
          'An unknown error occurred',
          stackTrace: stackTrace,
        );
}
