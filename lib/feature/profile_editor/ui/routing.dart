import 'package:apkainzynierka/feature/profile_editor/service/routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MaterialProfileEditorRouting extends ProfileEditorRouting {
  final BuildContext _context;

  MaterialProfileEditorRouting(this._context);

  @override
  void finish() {
    _context.pop();
  }
}
