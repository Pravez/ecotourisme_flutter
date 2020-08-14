import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

import 'checkpoint.dart';
import 'i18n_text.dart';
import 'side_activity.dart';
import 'picture.dart';

part 'journey.g.dart';


@JsonSerializable()
class Journey {

  //final Map<String, List<HashMap<String, String>>> access;
  final String updatedBy;
  final List shape;
  final bool isDraft;
  final double length;
  final List<Checkpoint> checkpoints;
  final I18nText description;
  final bool published;
  final I18nText title;
  final List<Picture> pictures;
  final List users;
  final dynamic capacity;
  final List<SideActivity> sideActivities;
  final List tags;
  final int duration;
  final int score;
  final dynamic lastupdate;
  final dynamic position;
  final String category;
  final List facilities;
  final String status;

  Journey(this.updatedBy, this.shape, this.isDraft, this.length, this.checkpoints, this.description, this.published, this.title, this.pictures, this.users, this.capacity, this.sideActivities, this.tags, this.duration, this.score, this.lastupdate, this.position, this.category, this.facilities, this.status);

  factory Journey.fromJson(Map<String, dynamic> json) => _$JourneyFromJson(json);
    Map<String, dynamic> toJson() => _$JourneyToJson(this);
}