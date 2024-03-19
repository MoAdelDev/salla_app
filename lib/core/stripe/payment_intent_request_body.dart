import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_intent_request_body.g.dart';

@JsonSerializable()
class PaymentIntentRequestBody {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentRequestBody(this.amount, this.currency, this.customerId);

  Map<String, dynamic> toJson() => _$PaymentIntentRequestBodyToJson(this);
}
