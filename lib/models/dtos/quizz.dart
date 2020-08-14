import 'answer.dart';
import 'i18n_text.dart';

import 'package:json_annotation/json_annotation.dart';
part 'quizz.g.dart';


@JsonSerializable()
class Quizz {
  final I18nText question;
  final List<Answer> answers;
  final I18nText explanation;

  Quizz(this.question, this.answers, this.explanation);

  factory Quizz.fromJson(Map<String, dynamic> json) => _$QuizzFromJson(json);
    Map<String, dynamic> toJson() => _$QuizzToJson(this);
}