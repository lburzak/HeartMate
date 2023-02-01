import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final IconData icon;
  final EdgeInsets padding;

  const ActionButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 72,
        child: Padding(
          padding: padding,
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
