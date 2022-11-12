import 'package:apkainzynierka/common/validation/validation_error.dart';
import 'package:apkainzynierka/common/validation/validation_pipeline.dart';

extension StringValidation on ValidationPipeline<String> {
  ValidationPipeline<num> number() {
    final temp = value;

    if (temp == null) {
      return ValidationPipeline(error: ValidationError.invalid);
    }

    int? height = int.tryParse(temp);

    if (height == null) {
      return ValidationPipeline(error: ValidationError.invalid);
    }

    return ValidationPipeline(value: height);
  }
}
