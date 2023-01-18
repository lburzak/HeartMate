import 'package:apkainzynierka/feature/journal/model/day_summary.dart';
import 'package:flutter/material.dart';

class DaySummaryView extends StatelessWidget {
  final DaySummary model;

  const DaySummaryView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRowDose(),
        _buildRowAnticoagulant(),
        const SizedBox(
          height: 15,
        ),
        _buildRowOtherMedicine(),
        _buildRowINR(),
        _buildRowNote(),
      ],
    );
  }

  Row _buildRowNote() {
    return Row(
      children: const [
        SizedBox(
          width: 20,
        ),
        Text("Notatka"),
      ],
    );
  }

  Row _buildRowOtherMedicine() {
    return Row(children: [
      const SizedBox(
        width: 20,
      ),
      const Text("Inne leki"),
      const SizedBox(
        width: 48,
      ),
      Text(model.otherMedicines
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')),
    ]);
  }

  Row _buildRowAnticoagulant() {
    return Row(children: [
      const SizedBox(
        width: 20,
      ),
      const Text("Antykoagulant"),
      const SizedBox(
        width: 10,
      ),
      Text(model.anticoagulant.toString().substring(14)),
    ]);
  }

  Row _buildRowDose() {
    if (model.taken == true) {
      return Row(children: [
        const SizedBox(
          width: 20,
        ),
        const Text("Dawka"),
        const SizedBox(
          width: 57,
        ),
        Text("${model.dosage.toString()} mg"),
        const SizedBox(
          width: 80,
        ),
        const Chip(
          avatar: CircleAvatar(
            backgroundColor: Color(0xFF255500),
            child: Icon(
              Icons.done,
              color: Color(0xFF62DF00),
            ),
          ),
          label: Text('Przyjęta', style: TextStyle(color: Color(0xFF62DF00))),
          backgroundColor: Color(0xFF255500),
        )
      ]);
    } else {
      return Row(children: [
        const SizedBox(
          width: 20,
        ),
        const Text("Dawka"),
        const SizedBox(
          width: 57,
        ),
        Text("${model.dosage.toString()} mg"),
        const SizedBox(
          width: 80,
        ),
        const Chip(
          avatar: CircleAvatar(
            backgroundColor: Color(0xFF554200),
            child: Icon(
              Icons.warning,
              color: Color(0xFFDFA100),
            ),
          ),
          label:
              Text('Nieprzyjęta', style: TextStyle(color: Color(0xFFDFA100))),
          backgroundColor: Color(0xFF554200),
        )
      ]);
    }
  }

  RenderObjectWidget _buildRowINR() {
    if (model.inrRating.toString() == 'InrRating.balanced') {
      return Row(children: [
        const SizedBox(
          width: 20,
        ),
        const Text("INR"),
        const SizedBox(
          width: 77,
        ),
        Text(model.inr.toString()),
        const SizedBox(
          width: 111,
        ),
        const Chip(
          avatar: CircleAvatar(
            backgroundColor: Color(0xFF255500),
            child: Icon(
              Icons.done,
              color: Color(0xFF62DF00),
            ),
          ),
          label: Text('W normie', style: TextStyle(color: Color(0xFF62DF00))),
          backgroundColor: Color(0xFF255500),
        )
      ]);
    } else if (model.inrRating.toString() == 'InrRating.tooLow') {
      return Row(children: [
        const SizedBox(
          width: 20,
        ),
        const Text("INR"),
        const SizedBox(
          width: 77,
        ),
        Text(model.inr.toString()),
        const SizedBox(
          width: 111,
        ),
        const Chip(
          avatar: CircleAvatar(
            backgroundColor: Color(0xFF554200),
            child: Icon(
              Icons.warning,
              color: Color(0xFFDFA100),
            ),
          ),
          label: Text('Za niski', style: TextStyle(color: Color(0xFFDFA100))),
          backgroundColor: Color(0xFF554200),
        )
      ]);
    } else if (model.inrRating.toString() == 'InrRating.tooHigh') {
      return Row(children: [
        const SizedBox(
          width: 20,
        ),
        const Text("INR"),
        const SizedBox(
          width: 77,
        ),
        Text(model.inr.toString()),
        const SizedBox(
          width: 111,
        ),
        const Chip(
          avatar: CircleAvatar(
            backgroundColor: Color(0xFF554200),
            child: Icon(
              Icons.warning,
              color: Color(0xFFDFA100),
            ),
          ),
          label: Text('Za wysoki', style: TextStyle(color: Color(0xFFDFA100))),
          backgroundColor: Color(0xFF554200),
        )
      ]);
    } else {
      return const SizedBox(
        height: 15,
      );
    }
  }
}
