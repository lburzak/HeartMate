import 'package:apkainzynierka/common/navigation/navigation_handler.dart';
import 'package:apkainzynierka/today_dosage/state/today_dosage_state.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_cubit.dart';
import 'package:apkainzynierka/today_dosage/today_dosage_router.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TodayDosageView extends StatefulWidget {
  final TodayDosageState state;

  const TodayDosageView(this.state, {super.key});

  @override
  State<TodayDosageView> createState() => _TodayDosageViewState();
}

class _TodayDosageViewState extends State<TodayDosageView>
    with NavigationHandler<TodayDosageRouter, TodayDosageView> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TodayDosageCubit>();
    const state = TodayDosageState(
        taken: true, potency: 2, custom: false, scheduleUndefined: true);
    //const state = widget.state;
    return Column(
      children: [
        SizedBox(
          height: 90,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DottedBorder(
              color: state.taken ? Colors.transparent : Colors.white,
              strokeCap: StrokeCap.round,
              dashPattern: const [8, 8],
              strokeWidth: state.taken ? 0 : 4,
              child: SizedBox.expand(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: getBackgroundColor(), elevation: 0),
                    onLongPress: () => cubit.showCustomDosageScreen(),
                    onPressed: () => cubit.toggleTaken(),
                    child: Text(
                      "Dzisiejsza dawka\n\n"
                      " ${state.taken ? "Przyjęto dawkę" : "Przyjmij dawkę"}"
                      " ${state.potency}"
                      " mg",
                      // style: const TextStyle(
                      //   fontSize: 16.0,
                      //   fontStyle: FontStyle.italic,
                      // ),
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
          ),
        ),
        SizedBox(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  7,
                  (index) => Column(children: const [
                        Text("Pn"),
                        SizedBox(
                          height: 5,
                        ),
                        DailyDosageCircle()
                      ]))),
        )),
        SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox.expand(
                child: ElevatedButton(
                    onPressed: () => context.push('/schedules/current'),
                    child: const Text("Dostosuj harmonogram"))),
          ),
        ),
        SizedBox(
            height: 150,
            child: SfCartesianChart(
                // Initialize category axis
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(minimum: 0, maximum: 5, interval: 1),
                series: <ChartSeries<_ChartData, String>>[
                  ColumnSeries<_ChartData, String>(
                      dataSource: [
                        _ChartData('10.09', 2),
                        _ChartData('24.09', 2.4),
                        _ChartData('10.10', 3.1),
                        _ChartData('24.10', 2.8),
                        _ChartData('10.11', 3),
                        _ChartData('10.11', 2),
                        _ChartData('24.13', 2.4),
                        _ChartData('10.15', 3.1),
                        _ChartData('24.16', 2.8),
                        _ChartData('10.17', 3.7),
                        _ChartData('10.18', 2.5),
                        _ChartData('24.19', 2.41),
                        _ChartData('10.20', 3.13),
                        _ChartData('24.21', 2.65),
                        _ChartData('10.22', 3.3)
                      ],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      name: 'Wykres pomiarów INR',
                      color: Colors.amber)
                ])),
        SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox.expand(
                child: ElevatedButton(
                    onPressed: () => cubit.toString(),
                    child: const Text("Dodaj pomiar INR"))),
          ),
        ),
      ],
    );
  }

  Color getBackgroundColor() {
    if (widget.state.scheduleUndefined) {
      return Colors.amber;
    }

    if (widget.state.taken) {
      return Colors.green;
    }
    return Colors.transparent;
  }
}

class DailyDosageCircle extends StatelessWidget {
  const DailyDosageCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      width: 50,
      child: Material(
        shape: CircleBorder(
            side: BorderSide(
          color: Colors.green,
          width: 2,
        )),
        child: Center(child: Text('1.5')),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
