import 'package:apkainzynierka/feature/schedule_wizard/model/schedule_overlap_answer.dart';

abstract class ScheduleWizardRouter {
  Future<ScheduleOverlapAnswer> promptScheduleOverlap();
}
