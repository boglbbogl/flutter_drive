import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required AddressModelMetaData meta,
    required List<AddressModelDocument> documents,
  }) = _AddressModel;
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

@freezed
class AddressModelDocument with _$AddressModelDocument {
  const factory AddressModelDocument({
    @JsonKey(name: 'place_name') required String placeName,
    // @JsonKey(name: 'place_url') required String placeUrl,
    // @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'address_name') required String addressName,
    @JsonKey(name: 'road_address_name') required String roadAddressName,
    required String id,
    // required String phone,
    @JsonKey(name: 'y') required String latitude,
    @JsonKey(name: 'x') required String longitude,
  }) = _AddressModelDocument;
  factory AddressModelDocument.fromJson(Map<String, dynamic> json) =>
      _$AddressModelDocumentFromJson(json);
}

@freezed
class AddressModelMetaData with _$AddressModelMetaData {
  const factory AddressModelMetaData({
    @JsonKey(name: 'pageable_count') required int pageableCount,
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'is_end') required bool isEnd,
  }) = _AddressModelMetaData;
  factory AddressModelMetaData.fromJson(Map<String, dynamic> json) =>
      _$AddressModelMetaDataFromJson(json);
}
