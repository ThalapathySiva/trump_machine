/// ClientModel.dart
import 'dart:convert';

DBQuote clientFromJson(String str) {
  final jsonData = json.decode(str);
  return DBQuote.fromJson(jsonData);
}

String clientToJson(DBQuote data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class DBQuote {
  int id;
  String title;
  String content;
  bool blocked;

  DBQuote({this.id, this.title, this.content, this.blocked});

  factory DBQuote.fromJson(Map<String, dynamic> json) => new DBQuote(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        blocked: json["blocked"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "blocked": blocked,
      };
}
