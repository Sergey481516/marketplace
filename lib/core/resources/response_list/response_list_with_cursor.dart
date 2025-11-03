import 'package:json_annotation/json_annotation.dart';

import 'types.dart';

part 'response_list_with_cursor.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseListWithCursor<T> {
  final List<T> list;
  final String nextCursor;

  const ResponseListWithCursor({required this.list, required this.nextCursor});

  factory ResponseListWithCursor.fromJson(
    Map<String, dynamic> json,
    FromJsonTFunc<T> fromJsonT,
  ) => _$ResponseListWithCursorFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(ToJsonTFunc<T> toJson) =>
      _$ResponseListWithCursorToJson(this, toJson);
}
