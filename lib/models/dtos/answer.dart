import 'package:json_annotation/json_annotation.dart';

import 'i18n_text.dart';
part 'answer.g.dart';


@JsonSerializable()
class Answer {
  final bool correct;
  final I18nText content;

  Answer(this.correct, this.content);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}