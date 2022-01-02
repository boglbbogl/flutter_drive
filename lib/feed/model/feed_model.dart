import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_model.freezed.dart';

@freezed
class FeedModel with _$FeedModel {
  const factory FeedModel({
    required int index,
    required bool isShow,
  }) = _FeedModel;
}
