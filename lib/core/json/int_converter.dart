import 'package:freezed_annotation/freezed_annotation.dart';

class IntConverter extends JsonConverter<int?, dynamic> {
  const IntConverter();

  @override
  int? fromJson(dynamic json) {
    if (json is int) {
      return json;
    } else if (json is String) {
      return int.tryParse(json);
    } else {
      throw FormatException('Cannot convert $json to int');
    }
  }

  @override
  dynamic toJson(int? object) {
    return object;
  }
}
