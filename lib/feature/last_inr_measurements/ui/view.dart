import 'package:apkainzynierka/feature/last_inr_measurements/model/measurement.dart';
import 'package:apkainzynierka/feature/last_inr_measurements/model/state.dart';
import 'package:apkainzynierka/feature/last_inr_measurements/service/cubit.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InrChart extends StatelessWidget {
  final LastInrMeasurementsState state;
  final LastInrMeasurementsCubit cubit;

  const InrChart({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis:
            DateTimeAxis(majorGridLines: const MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(
            interval: 0.2,
            plotBands: [
              _createLineBand(state.therapeuticInrBottom),
              _createLineBand(state.therapeuticInrTop),
            ],
            axisLabelFormatter: (axisLabelRenderArgs) =>
                ChartAxisLabel("", axisLabelRenderArgs.textStyle),
            majorTickLines: const MajorTickLines(width: 0),
            majorGridLines: const MajorGridLines(width: 0)),
        series: <ChartSeries<Measurement, DateTime>>[
          ColumnSeries<Measurement, DateTime>(
              dataSource: state.measurements,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              xValueMapper: (datum, index) => datum.reportedAt,
              yValueMapper: (datum, index) => datum.value,
              pointColorMapper: (datum, index) => _getBarColor(datum),
              onPointTap: _onPointTap,
              color: Colors.blue)
        ]);
  }

  void _onPointTap(ChartPointDetails details) {
    final index = details.pointIndex;

    if (index == null) {
      return;
    }

    cubit.selectMeasurement(index);
  }

  Color? _getBarColor(Measurement measurement) {
    if (measurement.isSelected) {
      return Colors.orange;
    }

    if (measurement.isOutsideTherapeuticRange) {
      return Colors.red;
    }

    return null;
  }

  PlotBand _createLineBand(double value) {
    return PlotBand(
        start: value,
        end: value,
        text: value.toString(),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        horizontalTextAlignment: TextAnchor.start,
        borderColor: Colors.white,
        borderWidth: 2,
        shouldRenderAboveSeries: true,
        dashArray: const [6, 6],
        color: Colors.transparent);
  }
}
