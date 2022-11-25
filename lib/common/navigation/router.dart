import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'navigation_event.dart';

abstract class Router<T extends NavigationEvent> {
  final Logger _logger;
  final Stream<T> _navigationEvents;

  StreamSubscription<T>? _subscription;
  @protected
  final BuildContext _context;

  Router(this._logger, this._navigationEvents, this._context);

  void startRouting() {
    _subscription = _navigationEvents.listen((event) {
      _logger.i("$runtimeType routes ${event.runtimeType}");
      route(event, _context);
    });
  }

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
  }

  @protected
  void route(T event, BuildContext context);
}
