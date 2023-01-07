import 'dart:async';

import 'package:apkainzynierka/domain/event/profile_updated_event.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class WelcomeRouter {
  final EventBus _eventBus;
  final BuildContext _context;
  StreamSubscription? _subscription;

  WelcomeRouter(this._eventBus, this._context) {
    attach();
  }

  void _toMainPage() {
    _context.go("/");
  }

  void attach() {
    _subscription =
        _eventBus.on<ProfileUpdatedEvent>().listen((_) => _toMainPage());
  }

  void detach() {
    _subscription?.cancel();
  }
}
