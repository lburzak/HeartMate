import 'package:apkainzynierka/common/navigation/router.dart';
import 'package:apkainzynierka/custom_dosage/custom_dosage_view.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_navigation_event.dart';
import 'package:flutter/material.dart' hide Router;

class TodayDosageRouter extends Router<TodayDosageNavigationEvent> {
  TodayDosageRouter(super.logger, super.navigationEvents, super.context);

  @override
  void route(TodayDosageNavigationEvent event, BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (_) => const CustomDosageView());
  }
}
