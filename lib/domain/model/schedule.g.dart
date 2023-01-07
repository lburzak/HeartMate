// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Schedule _$$_ScheduleFromJson(Map<String, dynamic> json) => _$_Schedule(
      id: json['id'] as int,
      effectiveFrom: DateTime.parse(json['effectiveFrom'] as String),
      dosageScheme: (json['dosageScheme'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$_ScheduleToJson(_$_Schedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'effectiveFrom': instance.effectiveFrom.toIso8601String(),
      'dosageScheme': instance.dosageScheme,
    };
