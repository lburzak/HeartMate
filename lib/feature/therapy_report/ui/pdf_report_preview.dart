import 'package:apkainzynierka/feature/therapy_report/model/therapy_report.dart';
import 'package:apkainzynierka/feature/therapy_report/ui/pdf_report_builder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfReportPreview extends StatelessWidget {
  final TherapyReport report;

  const PdfReportPreview({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    final reportDateFormat = DateFormat("ddMMyy_HHMM");
    final fileName =
        "raport_terapii_${report.firstName}_${report.lastName}_${reportDateFormat.format(report.reportDate)}.pdf";

    return FutureBuilder<pw.Document>(
      builder: (context, snapshot) => PdfPreview(
        canChangePageFormat: false,
        canDebug: false,
        canChangeOrientation: false,
        pdfFileName: fileName,
        build: (format) =>
            PdfReportBuilder(report).build().then((value) => value.save()),
      ),
    );
  }
}
