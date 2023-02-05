import 'package:apkainzynierka/feature/custom_dosage/service/routing.dart';
import 'package:flutter/material.dart';

class MaterialCustomDosageRouting extends CustomDosageRouting {
  final BuildContext _context;

  const MaterialCustomDosageRouting(this._context);

  @override
  void close() {
    Navigator.pop(_context);
  }
}
