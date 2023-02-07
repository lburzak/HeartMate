import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool visible;

  const SummaryRow(
      {super.key,
      required this.label,
      required this.value,
      this.visible = true});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Expanded(
            child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
        Expanded(
          child: Text(value),
        )
      ]),
    );
  }
}

class TriSummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final Widget? trailing;

  const TriSummaryRow(
      {super.key, required this.label, required this.value, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          Expanded(
            flex: trailing != null ? 1 : 2,
            child: Text(value),
          ),
          trailing != null
              ? Expanded(child: trailing!)
              : const SizedBox.shrink()
        ]);
  }
}
