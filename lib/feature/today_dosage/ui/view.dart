import 'package:apkainzynierka/feature/today_dosage/model/state.dart';
import 'package:apkainzynierka/feature/today_dosage/service/cubit.dart';
import 'package:apkainzynierka/theme/brand_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart' hide Router;

class TodayDosageView extends StatelessWidget {
  final TodayDosageState state;
  final TodayDosageCubit cubit;

  const TodayDosageView({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      child: SizedBox(
        key: UniqueKey(),
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DottedBorder(
            color: getBorderColor(context),
            borderPadding: const EdgeInsets.all(2),
            strokeCap: StrokeCap.round,
            borderType: BorderType.RRect,
            radius: const Radius.circular(6),
            dashPattern: const [6, 10],
            strokeWidth: state.taken ? 0 : 3,
            child: SizedBox.expand(
              child: Stack(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: getBackgroundColor(context),
                          elevation: 0),
                      onLongPress: () => cubit.showCustomDosageScreen(),
                      onPressed: () => cubit.toggleTaken(),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Dzisiejsza dawka"),
                            Text(
                              hintText,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Visibility(
                              visible: !state.taken,
                              child: const Text(
                                "Przytrzymaj, aby dodać niestandardową dawkę",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Icon(
                        icon,
                        size: 36,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String get hintText {
    if (state.taken) {
      return "Przyjęto dawkę ${state.potency} mg";
    }

    if (state.scheduleUndefined) {
      return "Brak harmonogramu!";
    }

    return "Przyjmij dawkę ${state.potency} mg";
  }

  Color? getBackgroundColor(BuildContext context) {
    if (state.taken) {
      return BrandTheme
          .of(context)
          .goodColor;
    }

    if (state.scheduleUndefined) {
      return BrandTheme
          .of(context)
          .warningColor;
    }

    return BrandTheme
        .of(context)
        .badColor;
  }

  Color getBorderColor(BuildContext context) {
    return Colors.transparent;
  }

  IconData get icon {
    if (state.taken) {
      return Icons.done;
    }

    if (state.scheduleUndefined) {
      return Icons.warning;
    }

    return Icons.medication;
  }
}
