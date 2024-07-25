class CustomResponse<T> {
  CustomResponse.completed(this.data, this.statusCode)
      : status = Status.completed;

  CustomResponse.error(this.message) : status = Status.error;
  CustomResponse.loading(this.message) : status = Status.loading;

  T? data;
  int? statusCode;
  String? message;
  Status? status;

  @override
  String toString() {
    return 'Status : $status with StatusCode $statusCode \n \n Message : $message \n Data : $data';
  }
}

enum Status { loading, completed, error }
