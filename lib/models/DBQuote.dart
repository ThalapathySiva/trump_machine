/// ClientModel.dart
import 'dart:convert';

DBQuote dBQuoteFromJson(json) {
  final map = {
    "title": json["value"],
  };
  return DBQuote.fromJson(map);
}

String dBQuoteToJson(DBQuote data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class DBQuote {
  int id;
  bool blocked = true;
  final String value;

  DBQuote({this.id, this.value});

  factory DBQuote.fromJson(json) => new DBQuote(
        value: json["value"],
      );

  factory DBQuote.fromApi(json) => new DBQuote(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "blocked": blocked,
      };
}
