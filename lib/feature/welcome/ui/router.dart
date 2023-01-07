import 'package:apkainzynierka/feature/welcome/service/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MaterialWelcomeRouter extends WelcomeRouter {
  final BuildContext _context;

  MaterialWelcomeRouter(this._context);

  @override
  void goToProfileEditor() {
    _context.push("/profile/editor");
  }

  @override
  void goToMainPage() {
    _context.go("/");
  }
}
