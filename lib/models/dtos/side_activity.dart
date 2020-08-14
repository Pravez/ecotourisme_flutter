import 'i18n_text.dart';
import 'package:json_annotation/json_annotation.dart';
part 'side_activity.g.dart';


@JsonSerializable()
class SideActivity {
  final I18nText description;
  final dynamic position;
  final String title;
  final String type;
  final String url;

  SideActivity(this.description, this.position, this.title, this.type, this.url);

  factory SideActivity.fromJson(Map<String, dynamic> json) => _$SideActivityFromJson(json);
    Map<String, dynamic> toJson() => _$SideActivityToJson(this);
}