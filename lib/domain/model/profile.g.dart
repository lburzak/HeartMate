// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      age: json['age'] as int?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      illness: $enumDecodeNullable(_$IllnessEnumMap, json['illness']),
      anticoagulant: $enumDecode(_$AnticoagulantEnumMap, json['anticoagulant']),
      inrRange: InrRange.fromJson(json['inrRange'] as Map<String, dynamic>),
      otherMedicines: (json['otherMedicines'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'height': instance.height,
      'weight': instance.weight,
      'age': instance.age,
      'gender': _$GenderEnumMap[instance.gender],
      'illness': _$IllnessEnumMap[instance.illness],
      'anticoagulant': _$AnticoagulantEnumMap[instance.anticoagulant]!,
      'inrRange': instance.inrRange,
      'otherMedicines': instance.otherMedicines,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};

const _$IllnessEnumMap = {
  Illness.artificialValve: 'artificialValve',
  Illness.other: 'other',
};

const _$AnticoagulantEnumMap = {
  Anticoagulant.warfin: 'warfin',
  Anticoagulant.acenokumarol: 'acenokumarol',
  Anticoagulant.sintrom: 'sintrom',
};
