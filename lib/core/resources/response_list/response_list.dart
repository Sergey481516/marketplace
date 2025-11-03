import 'package:json_annotation/json_annotation.dart';

import 'types.dart';

part 'response_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseList<T> {
  final int page;
  final int size;
  final int total;
  final List<T> list;

  const ResponseList({
    required this.page,
    required this.size,
    required this.total,
    required this.list,
  });

  factory ResponseList.fromJson(
    Map<String, dynamic> json,
    FromJsonTFunc<T> fromJsonT,
  ) => _$ResponseListFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(ToJsonTFunc<T> toJsonT) =>
      _$ResponseListToJson(this, toJsonT);
}
