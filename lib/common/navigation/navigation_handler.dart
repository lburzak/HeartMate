import 'package:apkainzynierka/common/navigation/router.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:provider/provider.dart';

mixin NavigationHandler<R extends Router, T extends StatefulWidget>
    on State<T> {
  R get router => context.read<R>();

  @override
  void initState() {
    router.startRouting();
    super.initState();
  }

  @override
  void dispose() {
    router.dispose();
    super.dispose();
  }
}
