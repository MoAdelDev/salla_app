// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromoCodeResponse _$PromoCodeResponseFromJson(Map<String, dynamic> json) =>
    PromoCodeResponse(
      json['message'] as String,
      json['status'] as bool,
    );

Map<String, dynamic> _$PromoCodeResponseToJson(PromoCodeResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
