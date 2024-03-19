// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _StripeApiService implements StripeApiService {
  _StripeApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.stripe.com/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentRequestBody paymentIntentRequestBody,
    String contentType,
    String token,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Authorization': token,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(paymentIntentRequestBody.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PaymentIntentModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'payment_intents',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PaymentIntentModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CustomerResponseBody> createCustomerId(
    String contentType,
    String token,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': contentType,
      r'Authorization': token,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CustomerResponseBody>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'customers',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = CustomerResponseBody.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EphemeralKeyModel> createEphemeralKey(
    EphemeralKeyRequestBody ephemeralKeyRequestBody,
    String token,
    String contentType,
    String stripeVersion,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': token,
      r'Content-Type': contentType,
      r'Stripe-Version': stripeVersion,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(ephemeralKeyRequestBody.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<EphemeralKeyModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: contentType,
    )
            .compose(
              _dio.options,
              'ephemeral_keys',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = EphemeralKeyModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
