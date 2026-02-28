import 'package:freezed_annotation/freezed_annotation.dart';

class DoubleConverter extends JsonConverter<double?, dynamic> {
  const DoubleConverter();

  @override
  double? fromJson(dynamic json) {
    if (json is double) {
      return json;
    } else if (json is String) {
      return double.tryParse(json);
    } else {
      throw FormatException('Cannot convert $json to double');
    }
  }

  @override
  dynamic toJson(double? object) {
    return object;
  }
}
