// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inr_measurement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InrMeasurement _$$_InrMeasurementFromJson(Map<String, dynamic> json) =>
    _$_InrMeasurement(
      reportDate: DateTime.parse(json['reportDate'] as String),
      inr: (json['inr'] as num).toDouble(),
    );

Map<String, dynamic> _$$_InrMeasurementToJson(_$_InrMeasurement instance) =>
    <String, dynamic>{
      'reportDate': instance.reportDate.toIso8601String(),
      'inr': instance.inr,
    };
