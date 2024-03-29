import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final IconData icon;

  const ActionButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 64,
        child: ElevatedButton(
            onPressed: onPressed,
            child: _ActionButtonBody(
              label: label,
              icon: icon,
            )));
  }
}

class OutlinedActionButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final IconData icon;

  const OutlinedActionButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 64,
        child: OutlinedButton(
            onPressed: onPressed,
            child: _ActionButtonBody(
              label: label,
              icon: icon,
            )));
  }
}

class _ActionButtonBody extends StatelessWidget {
  final String label;
  final IconData icon;

  const _ActionButtonBody({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              style: GoogleFonts.balooDa2(
                  fontWeight: FontWeight.w700, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
