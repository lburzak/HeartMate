import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final IconData icon;

  const ActionButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 72,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: onPressed,
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          icon,
                          size: 28,
                        )),
                    Center(
                      child: Text(
                        label.toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
