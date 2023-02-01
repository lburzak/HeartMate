import 'dart:math';

import 'package:apkainzynierka/feature/therapy_report/model/journal_entry.dart';
import 'package:apkainzynierka/feature/therapy_report/model/therapy_report.dart';
import 'package:apkainzynierka/util/lang.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class PdfReportBuilder {
  final TherapyReport model;

  PdfReportBuilder(this.model);

  Future<Document> build() async {
    final doc = Document(version: PdfVersion.pdf_1_5, compress: true);

    doc.addPage(
      MultiPage(
        theme: await _buildTheme(),
        pageFormat: PdfPageFormat.a4,
        footer: (context) => _GeneratedWithFooter(),
        build: (context) {
          return [
            Row(children: [
              Expanded(
                  child: SizedBox(height: 100, child: _InrChart(model: model))),
              SizedBox(width: 20),
              _ProfileTable(model: model)
            ]),
            SizedBox(height: 20),
            _JournalTable(model: model),
          ];
        },
      ),
    );

    return doc;
  }

  Future<ThemeData> _buildTheme() async {
    final lightFont = await PdfGoogleFonts.poppinsRegular();
    final boldFont = await PdfGoogleFonts.poppinsBold();
    final icons = await PdfGoogleFonts.materialIcons();
    final base = ThemeData.withFont(base: lightFont, bold: boldFont);
    return base.copyWith(
        header0: base.header0.copyWith(fontWeight: FontWeight.bold),
        defaultTextStyle: base.defaultTextStyle.copyWith(fontSize: 10),
        iconTheme: IconThemeData(font: icons, color: PdfColors.black));
  }
}

class _InrChart extends StatelessWidget {
  final TherapyReport model;

  _InrChart({required this.model});

  @override
  Widget build(Context context) {
    return Chart(
        grid: CartesianGrid(
            xAxis: FixedAxis(
              model.inrMeasurements.keys
                  .map((e) => e.millisecondsSinceEpoch)
                  .toList(),
              marginStart: 10,
              buildLabel: (value) => Text(
                  DateFormat("dd.MM").format(
                      DateTime.fromMillisecondsSinceEpoch(value.toInt())),
                  style: const TextStyle(fontSize: 8)),
            ),
            yAxis: FixedAxis([
              ...List.generate(
                  model.inrMeasurements.values.reduce(max).ceil() + 1,
                  (index) => index)
            ])),
        datasets: [
          LineDataSet(data: [
            ...model.inrMeasurements.entries.map((e) => PointChartValue(
                e.key.millisecondsSinceEpoch.toDouble(), e.value))
          ], isCurved: true)
        ]);
  }
}

class _ProfileTable extends StatelessWidget {
  final TherapyReport model;

  _ProfileTable({required this.model});

  @override
  Widget build(Context context) {
    final headerStyle = Theme.of(context)
        .defaultTextStyle
        .copyWith(fontWeight: FontWeight.bold, color: PdfColors.grey700);

    final propertiesTable =
        Table(defaultColumnWidth: const FixedColumnWidth(70), children: [
      TableRow(children: [
        Text("Płeć", style: headerStyle),
        Text(model.gender.readable)
      ]),
      TableRow(children: [
        Text("Wzrost", style: headerStyle),
        Text("${model.height} cm")
      ]),
      TableRow(children: [
        Text("Waga", style: headerStyle),
        Text("${model.weight} kg")
      ]),
      TableRow(children: [
        Text("Wiek", style: headerStyle),
        Text("${model.age} lat")
      ]),
      TableRow(children: [
        Text("Schorzenie", style: headerStyle),
        Text(model.illness.readable)
      ]),
    ]);

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${model.firstName} ${model.lastName}",
              style: Theme.of(context).header3),
          propertiesTable
        ]);
  }
}

class _GeneratedWithFooter extends StatelessWidget {
  final DateFormat _reportDateFormat =
      DateFormat("dd.MM.yyyy o HH:mm", 'pl_PL');

  @override
  Widget build(Context context) {
    return Footer(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(border: Border(top: BorderSide())),
        title: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Row(children: [
              Text(
                  "Wygenerowano z HeartMate dnia ${_reportDateFormat.format(DateTime.now())}")
            ])));
  }
}

class _JournalTable extends StatelessWidget {
  final TherapyReport model;
  final _journalDateFormat = DateFormat('dd.MM.yyyy', 'pl_PL');

  _JournalTable({required this.model});

  @override
  Widget build(Context context) {
    return Table(border: TableBorder.all(), children: [
      _buildHeader(),
      ...model.journalEntries
          .map((e) => _buildDataRow(context: context, entry: e))
    ]);
  }

  TableRow _buildHeader() {
    return TableRow(children: [
      Text("Data"),
      Text("Antykoagulant"),
      Text("Planowana dawka"),
      Text("Przyjęta dawka"),
      Text("Inne leki")
    ]);
  }

  TableRow _buildDataRow(
      {required Context context, required JournalEntry entry}) {
    return TableRow(children: [
      Text(_journalDateFormat.format(entry.date),
          style: Theme.of(context).tableHeader),
      Text(entry.anticoagulant?.readable ?? "-"),
      Text(entry.scheduledDose?.toString() ?? "-"),
      Text(entry.takenDose?.toString() ?? "-"),
      Text(entry.otherMedicines.join(", ")),
    ]);
  }
}
