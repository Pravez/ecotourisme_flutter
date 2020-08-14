
import 'package:json_annotation/json_annotation.dart';

import 'i18n_text.dart';
part 'checkpoint.g.dart';


@JsonSerializable()
class Checkpoint {
  final I18nText route;
  final I18nText name;
  final I18nText description;
  final int positionIndex;
  final I18nText quizz;

  Checkpoint(this.route, this.name, this.description, this.positionIndex, this.quizz);

  factory Checkpoint.fromJson(Map<String, dynamic> json) => _$CheckpointFromJson(json);
    Map<String, dynamic> toJson() => _$CheckpointToJson(this);
}
