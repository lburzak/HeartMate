import 'package:apkainzynierka/domain/repository/resource_error.dart';

class ScheduleError extends ResourceError {
  ScheduleError(super.message);
}

class DayOutsideScheduleError extends ScheduleError {
  DayOutsideScheduleError(super.message);
}
