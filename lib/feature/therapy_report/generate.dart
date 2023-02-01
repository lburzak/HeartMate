import 'dart:math';

import 'package:apkainzynierka/domain/model/anticoagulant.dart';
import 'package:apkainzynierka/domain/model/gender.dart';
import 'package:apkainzynierka/domain/model/illness.dart';
import 'package:apkainzynierka/feature/therapy_report/model/journal_entry.dart';
import 'package:apkainzynierka/feature/therapy_report/model/state.dart';
import 'package:apkainzynierka/util/lang.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Document> generate() async {
  initializeDateFormatting("pl_PL", null);
  final reportDateFormat = DateFormat("dd.MM.yyyy o HH:mm", 'pl_PL');
  final pdf = Document(version: PdfVersion.pdf_1_5, compress: true);
  final lightFont = await PdfGoogleFonts.poppinsRegular();
  final boldFont = await PdfGoogleFonts.poppinsBold();
  final icons = await PdfGoogleFonts.materialIcons();
  final now = DateTime.now();
  final oneDay = Duration(days: 1);
  final model = TherapyReportState(
      reportDate: now,
      age: 24,
      firstName: "Łukasz",
      lastName: "Burzak",
      gender: Gender.male,
      height: 177,
      illness: Illness.other,
      weight: 65,
      journalEntries: List.generate(
          120,
          (index) => JournalEntry(
              date: now.subtract(oneDay),
              scheduledDose: index.isEven ? index % 10 : null,
              takenDose: index.isOdd ? index % 10 : null,
              otherMedicines: ["Metmin", "Clatra"],
              anticoagulant: Anticoagulant.warfin)),
      inrMeasurements: {
        now.subtract(Duration(days: 80)): 1.5,
        now.subtract(Duration(days: 70)): 2,
        now.subtract(Duration(days: 60)): 2.5,
        now.subtract(Duration(days: 50)): 7,
        now.subtract(Duration(days: 40)): 3.5,
        now.subtract(Duration(days: 30)): 3.5,
        now.subtract(Duration(days: 20)): 4.5,
        now.subtract(Duration(days: 10)): 1.5,
      });
  final base = ThemeData.withFont(base: lightFont, bold: boldFont);
  final theme = base.copyWith(
      header0: base.header0.copyWith(fontWeight: FontWeight.bold),
      defaultTextStyle: base.defaultTextStyle.copyWith(fontSize: 10),
      iconTheme: IconThemeData(font: icons, color: PdfColors.black));

  final icon = Icon(const IconData(0xe7fd), size: 10);

  pdf.addPage(
    MultiPage(
      theme: theme,
      pageFormat: PdfPageFormat.a4,
      footer: (context) => Footer(
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(border: Border(top: BorderSide())),
          title: Padding(
              padding: EdgeInsets.only(top: 6),
              child: Row(children: [
                Text(
                    "Wygenerowano z HeartMate dnia ${reportDateFormat.format(DateTime.now())}")
              ]))),
      build: (context) {
        return [
          Row(children: [
            Expanded(
                child: SizedBox(
                    height: 100,
                    child: buildInrChart(context, model))),
            SizedBox(width: 20),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Łukasz Burzak', style: Theme.of(context).header3),
                  buildProfile(context, model)
                ])
          ]),
          SizedBox(height: 20),
          buildMonthTable(context, model),
        ];
      },
    ),
  );

  return pdf;

  // final output = await getTemporaryDirectory();
  // final file = File('${output.path}/example.pdf');
  // await file.writeAsBytes(await pdf.save());
}

Widget buildInrChart(Context context, TherapyReportState model) {
  return Chart(
      grid: CartesianGrid(
          xAxis: FixedAxis(
            model.inrMeasurements.keys.map((e) => e.millisecondsSinceEpoch).toList(),
            marginStart: 10,
            buildLabel: (value) => Text(DateFormat("dd.MM").format(DateTime.fromMillisecondsSinceEpoch(value.toInt())),
                style: TextStyle(fontSize: 8)),
          ),
          yAxis: FixedAxis([...List.generate(model.inrMeasurements.values.reduce(max).ceil() + 1, (index) => index)])),
      datasets: [
        LineDataSet(data: [
          ...model.inrMeasurements.entries.map((e) => PointChartValue(e.key.millisecondsSinceEpoch.toDouble(), e.value))
        ], isCurved: true)
      ]);
}

Widget buildMonthTable(Context context, TherapyReportState model) {
  final journalDateFormat = DateFormat('dd.MM.yyyy', 'pl_PL');

  return Table(border: TableBorder.all(), children: [
    buildMonthTableHeader(context),
    ...model.journalEntries.map((e) => TableRow(children: [
          Text(journalDateFormat.format(e.date), style: Theme.of(context).tableHeader),
          Text(e.anticoagulant?.readable ?? "-"),
          Text(e.scheduledDose?.toString() ?? "-"),
          Text(e.takenDose?.toString() ?? "-"),
          Text(e.otherMedicines.join(", ")),
        ]))
  ]);
}

TableRow buildMonthTableHeader(Context context) {
  return TableRow(children: [
    Text("Data"),
    Text("Antykoagulant"),
    Text("Planowana dawka"),
    Text("Przyjęta dawka"),
    Text("Inne leki")
  ]);
}

Widget buildProfile(Context context, TherapyReportState model) {
  final headerStyle = Theme.of(context)
      .defaultTextStyle
      .copyWith(fontWeight: FontWeight.bold, color: PdfColors.grey700);
  return Table(defaultColumnWidth: const FixedColumnWidth(70), children: [
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
    TableRow(
        children: [Text("Wiek", style: headerStyle), Text("${model.age} lat")]),
    TableRow(children: [
      Text("Schorzenie", style: headerStyle),
      Text(model.illness.readable)
    ]),
  ]);
}
