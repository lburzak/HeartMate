import 'package:apkainzynierka/feature/last_inr_measurements/model/measurement.dart';
import 'package:apkainzynierka/feature/last_inr_measurements/model/state.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InrChart extends StatelessWidget {
  final LastInrMeasurementsState state;

  const InrChart({super.key, required this.state});

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
              pointColorMapper: (datum, index) {
                if (datum.isSelected) {
                  return Colors.orange;
                }

                if (datum.isOutsideTherapeuticRange) {
                  return Colors.red;
                }

                return null;
              },
              onPointTap: (pointInteractionDetails) {
                print(pointInteractionDetails.pointIndex);
              },
              color: Colors.blue)
        ]);
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
