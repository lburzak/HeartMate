import 'package:flutter/material.dart';

class TodayNoteView extends StatelessWidget {
  final void Function(String text) onChanged;
  final String content;

  const TodayNoteView(
      {super.key, required this.onChanged, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.note,
                    size: 22,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Notatka",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Scrollbar(
                child: TextFormField(
                  initialValue: content,
                  maxLines: 2,
                  onChanged: onChanged,
                  maxLength: 256,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration.collapsed(
                      hintText: "Twoje dzisiejsze spostrzeżenia..."),
                  buildCounter: (context,
                          {required currentLength,
                          required isFocused,
                          maxLength}) =>
                      Text("$currentLength / $maxLength"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
