import 'package:apkainzynierka/common/navigation/navigation_event.dart';

abstract class TodayDosageNavigationEvent extends NavigationEvent {}

class OpenCustomDosageScreen extends TodayDosageNavigationEvent {}

class OpenScheduleWizard extends TodayDosageNavigationEvent {}
