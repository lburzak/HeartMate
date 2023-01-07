import 'dart:async';

import 'package:apkainzynierka/domain/event/profile_updated_event.dart';
import 'package:apkainzynierka/feature/welcome/service/router.dart';
import 'package:bloc/bloc.dart';
import 'package:event_bus/event_bus.dart';

class WelcomeCubit extends Cubit<void> {
  final EventBus _eventBus;
  final WelcomeRouter _router;
  StreamSubscription? _subscription;

  WelcomeCubit(this._eventBus, this._router) : super(null);

  void attach() {
    _subscription = _eventBus
        .on<ProfileUpdatedEvent>()
        .listen((_) => _router.goToMainPage());
  }

  void onNext() {
    _router.goToProfileEditor();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
