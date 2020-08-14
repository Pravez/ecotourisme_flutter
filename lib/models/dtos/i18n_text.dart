import 'package:json_annotation/json_annotation.dart';
part 'i18n_text.g.dart';


@JsonSerializable()
class I18nText {
  final String fr;
  final String en;

  I18nText(this.fr, this.en);

  factory I18nText.fromJson(Map<String, dynamic> json) => _$I18nTextFromJson(json);
    Map<String, dynamic> toJson() => _$I18nTextToJson(this);
}