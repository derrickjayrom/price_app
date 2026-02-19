import 'package:freezed_annotation/freezed_annotation.dart';
part 'tab_item_model.freezed.dart';
part 'tab_item_model.g.dart';

@freezed
class TabItemModel with _$TabItemModel {
  const TabItemModel._();

  const factory TabItemModel({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'category_name') @Default('') String title,
    @JsonKey(name: 'sub_name') @Default('') String subTitle,
    @JsonKey(name: 'category') List<TabItemModel>? category,
    @JsonKey(name: 'item_category') List<TabItemModel>? itemCategory,
  }) = _TabItemModel;

  factory TabItemModel.fromJson(Map<String, dynamic> json) =>
      _$TabItemModelFromJson(json);

  factory TabItemModel.fromMap(Map<String, dynamic> map) =>
      TabItemModel.fromJson(map);

  Map<String, dynamic> toMap() => toJson();
}
