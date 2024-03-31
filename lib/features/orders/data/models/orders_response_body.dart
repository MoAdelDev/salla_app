import 'package:json_annotation/json_annotation.dart';

part 'orders_response_body.g.dart';

@JsonSerializable()
class OrdersResponseBody {
  final bool status;
  final String? message;
  final OrdersData? data;

  OrdersResponseBody(this.status, this.message, this.data);

  factory OrdersResponseBody.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseBodyFromJson(json);
}

@JsonSerializable()
class OrdersData {
  @JsonKey(name: 'data')
  final List<OrderModel> orders;

  OrdersData(this.orders);

  factory OrdersData.fromJson(Map<String, dynamic> json) =>
      _$OrdersDataFromJson(json);
}

@JsonSerializable()
class OrderModel {
  final int id;
  final dynamic total;
  final String date;
  String status;

  OrderModel(this.id, this.total, this.date, this.status);

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
