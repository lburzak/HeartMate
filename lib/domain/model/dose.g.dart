// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$Dose _$$$DoseFromJson(Map<String, dynamic> json) => _$$Dose(
      potency: (json['potency'] as num).toDouble(),
      custom: json['custom'] as bool,
      dateTaken: DateTime.parse(json['dateTaken'] as String),
    );

Map<String, dynamic> _$$$DoseToJson(_$$Dose instance) => <String, dynamic>{
      'potency': instance.potency,
      'custom': instance.custom,
      'dateTaken': instance.dateTaken.toIso8601String(),
    };
