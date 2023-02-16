import 'package:hive/hive.dart';

abstract class RegistrableAdapter<T> extends TypeAdapter<T> {
  void safeRegister() {
    if (Hive.isAdapterRegistered(typeId)) {
      return;
    }

    Hive.registerAdapter<T>(this);
  }
}
