

abstract class APIState {}

class ApiCompleted extends APIState {
  // final dynamic data;
  final dynamic data;

  ApiCompleted({required this.data});
}

class APILoading extends APIState {}

class ApiError extends APIState {
  final String error;

  ApiError({required this.error});
}



