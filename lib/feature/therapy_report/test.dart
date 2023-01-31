import 'package:apkainzynierka/feature/therapy_report/generate.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() async {
  runApp(MaterialApp(
    color: const Color(0x000000ff),
    home: Preview(),
  ));
}

class Preview extends StatefulWidget {
  const Preview({super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  void initState() {
    generate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<pw.Document>(
      builder: (context, snapshot) => PdfPreview(
        build: (format) => generate().then((value) => value.save()),
      ),
    );
  }
}
