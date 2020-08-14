

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev/models/dtos/journey.dart';

class FirestoreService {
  static final _firestore = Firestore.instance;
  static final _journeysQuery = _firestore.collection("journeys").where("status", isEqualTo: "public");

  static Future<List<Journey>> getJourneys() async {
    final result = await _journeysQuery.getDocuments();
    return result.documents.map((e) => Journey.fromJson(e.data)).toList();
  }

}