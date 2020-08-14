import 'package:json_annotation/json_annotation.dart';
part 'picture.g.dart';


@JsonSerializable()
class Picture {
  final String src;
  final String blurhash;
  final int width;
  final int height;

  Picture(this.src, this.blurhash, this.width, this.height);

  factory Picture.fromJson(Map<String, dynamic> json) => _$PictureFromJson(json);
    Map<String, dynamic> toJson() => _$PictureToJson(this);
}