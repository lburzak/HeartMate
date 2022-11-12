import 'package:apkainzynierka/common/validation/validation_error.dart';

class ValidationPipeline<T> {
  T? value;
  ValidationError? error;

  ValidationPipeline.of(this.value);

  ValidationPipeline({this.value, this.error});

  void when(
      {void Function(T value)? valid,
      void Function(ValidationError error)? invalid}) {
    final value = this.value;
    final error = this.error;

    if (error != null) {
      invalid?.call(error);
    } else if (value != null) {
      valid?.call(value);
    } else {
      throw StateError("Both value and error are not null");
    }
  }
}
