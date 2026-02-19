import 'package:freezed_annotation/freezed_annotation.dart';

part 'featured_store_model.freezed.dart';
part 'featured_store_model.g.dart';

@freezed
class FeaturedStoreModel with _$FeaturedStoreModel {
  const FeaturedStoreModel._(); // <-- REQUIRED when adding methods/getters

  const factory FeaturedStoreModel({
    @Default('') String name,
    @Default('') String image,
  }) = _FeaturedStoreModel;

  factory FeaturedStoreModel.fromJson(Map<String, dynamic> json) =>
      _$FeaturedStoreModelFromJson(json);

  
  factory FeaturedStoreModel.fromMap(Map<String, dynamic> map) =>
      FeaturedStoreModel.fromJson(map);

  Map<String, dynamic> toMap() => toJson();
}
