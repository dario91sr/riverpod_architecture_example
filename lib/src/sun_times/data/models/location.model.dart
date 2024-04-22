import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/json.dart';

part 'location.model.freezed.dart';
part 'location.model.g.dart';

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    @JsonKey(name: 'localtime') required String localTime,
    String? name,
    String? country,
    int? id,
    String? region,
    double? lat,
    double? lon,
    String? url,
  }) = _LocationModel;
  factory LocationModel.fromJson(Json json) => _$LocationModelFromJson(json);
}
