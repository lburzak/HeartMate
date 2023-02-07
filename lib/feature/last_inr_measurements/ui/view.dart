import 'package:apkainzynierka/feature/last_inr_measurements/model/measurement.dart';
import 'package:apkainzynierka/feature/last_inr_measurements/model/state.dart';
import 'package:apkainzynierka/feature/last_inr_measurements/service/cubit.dart';
import 'package:apkainzynierka/theme/brand_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InrChart extends StatelessWidget {
  final LastInrMeasurementsState state;
  final LastInrMeasurementsCubit cubit;

  const InrChart({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: DateTimeAxis(
            majorGridLines: const MajorGridLines(width: 0),
            dateFormat: DateFormat("d", "pl_PL"),
            interval: 1,
            intervalType: DateTimeIntervalType.days,
            minimum: DateTime.now().subtract(const Duration(days: 31)),
            maximum: DateTime.now().add(const Duration(days: 1)),
            edgeLabelPlacement: EdgeLabelPlacement.shift),
        primaryYAxis: NumericAxis(
            interval: 0.5,
            plotBands: [
              _createLineBand(state.therapeuticInrBottom),
              _createLineBand(state.therapeuticInrTop),
            ],
            maximumLabelWidth: 10,
            majorTickLines: const MajorTickLines(width: 1),
            majorGridLines: const MajorGridLines(width: 0)),
        series: <ChartSeries<Measurement, DateTime>>[
          ColumnSeries<Measurement, DateTime>(
            dataSource: state.measurements,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            xValueMapper: (datum, index) => datum.reportedAt,
            yValueMapper: (datum, index) => datum.value,
            pointColorMapper: (datum, index) => _getBarColor(context, datum),
          )
        ]);
  }

  Color? _getBarColor(BuildContext context, Measurement measurement) {
    if (measurement.isSelected) {
      return Colors.orange;
    }

    if (measurement.isOutsideTherapeuticRange) {
      return BrandTheme.of(context).badColor;
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
