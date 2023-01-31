import 'package:apkainzynierka/domain/model/gender.dart';
import 'package:apkainzynierka/domain/model/illness.dart';
import 'package:apkainzynierka/feature/therapy_report/model/state.dart';
import 'package:apkainzynierka/util/lang.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Document> generate() async {
  initializeDateFormatting("pl_PL", null);
  final pdf = Document(version: PdfVersion.pdf_1_5, compress: true);
  final lightFont = await PdfGoogleFonts.poppinsRegular();
  final boldFont = await PdfGoogleFonts.poppinsBold();
  final icons = await PdfGoogleFonts.materialIcons();
  const model = TherapyReportState(
    age: 24,
    firstName: "Łukasz",
    lastName: "Burzak",
    gender: Gender.male,
    height: 177,
    illness: Illness.other,
    weight: 65,
  );
  final base = ThemeData.withFont(base: lightFont, bold: boldFont);
  final theme = base.copyWith(
      header0: base.header0.copyWith(fontWeight: FontWeight.bold),
      defaultTextStyle: base.defaultTextStyle.copyWith(fontSize: 10),
      iconTheme: IconThemeData(font: icons, color: PdfColors.black));

  final icon = Icon(const IconData(0xe7fd), size: 10);

  pdf.addPage(
    Page(
      theme: theme,
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Expanded(
                child: SizedBox(
                    height: 100,
                    child: Chart(
                        grid: CartesianGrid(
                            xAxis: FixedAxis(
                              marginStart: 10,
                              List.generate(30, (index) => index + 1),
                              buildLabel: (value) => Text(value.toString(),
                                  style: TextStyle(fontSize: 8)),
                            ),
                            yAxis: FixedAxis([1, 2, 3])),
                        datasets: [
                          LineDataSet(data: [
                            const PointChartValue(1, 2),
                            const PointChartValue(2, 3),
                            const PointChartValue(3, 3)
                          ])
                        ]))),
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
          buildMonthTable(context),
          Spacer(),
          Footer(
              decoration: BoxDecoration(border: Border(top: BorderSide())),
              title: Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Row(children: [
                    Text("Wygenerowano z HeartMate dnia ${DateTime.now()}")
                  ]))),
        ]);
      },
    ),
  );

  return pdf;

  // final output = await getTemporaryDirectory();
  // final file = File('${output.path}/example.pdf');
  // await file.writeAsBytes(await pdf.save());
}

Widget buildMonthTable(Context context) {
  final format = DateFormat.yMd('pl_PL');

  return Table(border: TableBorder.all(), children: [
    buildMonthTableHeader(context),
    ...List.generate(
        31,
        (index) => TableRow(children: [
              Text(
                  format.format(DateTime.now().subtract(Duration(days: index))),
                  style: Theme.of(context).tableHeader),
              Text("$index"),
              Text("$index"),
              Text("$index"),
              Text("$index"),
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
