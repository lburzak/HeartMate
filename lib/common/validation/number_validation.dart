import 'package:apkainzynierka/common/validation/validation_error.dart';
import 'package:apkainzynierka/common/validation/validation_pipeline.dart';
import 'package:apkainzynierka/profile/model/range.dart';

extension NumberValidation on ValidationPipeline<num> {
  ValidationPipeline<num> withinRange(Range range) {
    final value = this.value;

    if (value == null) {
      return ValidationPipeline(error: ValidationError.invalid);
    }

    if (range.includesInclusively(value)) {
      return ValidationPipeline(value: value);
    }

    return ValidationPipeline(error: ValidationError.outsideRange);
  }
}
