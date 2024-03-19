// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_code_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromoCodeResponseBody _$PromoCodeResponseBodyFromJson(
        Map<String, dynamic> json) =>
    PromoCodeResponseBody(
      json['message'] as String,
      json['status'] as bool,
    );

Map<String, dynamic> _$PromoCodeResponseBodyToJson(
        PromoCodeResponseBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
