import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:room_track_flutter/models/cards.dart';

Future<List<CardInfo>> httpReuestTaggeds() async {
  String token = (await FirebaseAuth.instance.currentUser?.getIdToken())!;
  var url = Uri.http('localhost:3000', '/search/tagged');
  var res = await http.get(url, headers: {
    'authorization': token,
  });
  if (res.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(res.body);
    return (data['array']! as List)
        .map((json) => CardInfo.fromJson(json))
        .toList();
  }
  return [];
}

Future<List<CardInfo>> httpReuestSearch(String query) async {
  String token = (await FirebaseAuth.instance.currentUser?.getIdToken())!;
  var url = Uri.http('localhost:3000', '/search', {'room': query});
  var res = await http.get(url, headers: {
    'authorization': token,
  });
  if (res.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(res.body);
    return (data['array']! as List)
        .map((json) => CardInfo.fromJson(json))
        .toList();
  }
  return [];
}
