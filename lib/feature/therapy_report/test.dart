import 'package:apkainzynierka/feature/therapy_report/pdf_report_builder.dart';
import 'package:apkainzynierka/feature/therapy_report/usecase/get_therapy_report.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() async {
  initializeDateFormatting("pl_PL", null);
  runApp(const MaterialApp(
    color: Color(0x000000ff),
    home: Preview(),
  ));
}

class Preview extends StatelessWidget {
  const Preview({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<pw.Document>(
      builder: (context, snapshot) => PdfPreview(
        build: (format) => PdfReportBuilder(GetTherapyReport()())
            .build()
            .then((value) => value.save()),
      ),
    );
  }
}
