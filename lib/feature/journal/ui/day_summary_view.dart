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
        // model.taken ? Text("data") : Text("data2"),
        Row(children: [
          const SizedBox(width: 20,),
          const Text("Dawka"),
          const SizedBox(width: 57,),
          Text("${model.dosage.toString()} mg"),
          const SizedBox(width: 80,),
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
        ]),
        //Text(model.taken.toString()),
        Row(children: [
          const SizedBox(width: 20,),
          const Text("Antykoagulant"),
          const SizedBox(width: 10,),
          Text(model.anticoagulant.toString().substring(14)),
        ]),
        //Text("Antykoagulant ${model.anticoagulant.toString().substring(14)}"),
        const SizedBox(height: 15,),
        Row(children: [
          const SizedBox(width: 20,),
          const Text("Inne leki"),
          const SizedBox(width: 48,),
          Text(model.otherMedicines
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')),
        ]),
        //Text("Inne leki ${model.otherMedicines.toString().replaceAll('[', '').replaceAll(']', '')}"),
        Row(children: [
          const SizedBox(width: 20,),
          const Text("INR"),
          const SizedBox(width: 77,),
          Text(model.inr.toString()),
          const SizedBox(width: 111,),
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
        ]),
        //Text(model.inrRating.toString()),
        Row(children: const [
          SizedBox(width: 20,),
          Text("Notatka"),
        ],),
      ],
    );
  }
}
