abstract class ApiStatus {}

class SuccessStatus extends ApiStatus {
  final dynamic data;

  SuccessStatus({required this.data});
}

class FailedStatus extends ApiStatus {
  final String errore;

  FailedStatus({required this.errore});
}