import 'package:json_annotation/json_annotation.dart';
part 'imageEntity.g.dart';

@JsonSerializable()
class PixelFordImage {
  String id;
  String filename;
  String? title;
  @JsonKey(name: 'url_full_size')
  String urlFullSize;
  @JsonKey(name: 'url_small_size')
  String urlSmallSize;

  PixelFordImage({required this.id, required this.filename, this.title, required this.urlFullSize, required this.urlSmallSize});

  factory PixelFordImage.fromJson(Map<String, dynamic> json) => _$PixelFordImageFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PixelFordImageToJson(this);
}