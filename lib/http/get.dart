import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:room_track_flutter/const/env.dart';
import 'package:room_track_flutter/models/cards.dart';

Future<List<CardInfo>> httpRequestTaggedsLimit(int limit) async {
  String token = (await FirebaseAuth.instance.currentUser?.getIdToken())!;
  var url =
      Uri.http(EnvVariables.apiUrl, '/search/tagged', {'limit': '$limit'});
  var res = await http.get(url, headers: {
    'authorization': token,
  });
  if (res.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(res.body);
    return (data['array']! as List)
        .map((json) => CardInfo.fromJson(json, true))
        .toList();
  }
  return [];
}

Future<List<CardInfo>> httpRequestSearch(String query) async {
  String token = (await FirebaseAuth.instance.currentUser?.getIdToken())!;
  var url =
      Uri.http(EnvVariables.apiUrl, '/search', {'name': query.toUpperCase()});
  var res = await http.get(url, headers: {
    'authorization': token,
  });
  if (res.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(res.body);
    return (data['array']! as List)
        .map((json) => CardInfo.fromJson(json, false))
        .toList();
  }
  return [];
}

void httpRequestTag(String name, bool toTagged) async {
  String token = (await FirebaseAuth.instance.currentUser?.getIdToken())!;
  var url = Uri.http(EnvVariables.apiUrl, '/update/tag', {
    'name': name.toUpperCase(),
    'toTagged': toTagged ? 'true' : 'false',
  });
  await http.put(url, headers: {
    'authorization': token,
  });
}

Future<List<CardInfo>> httpRequestCard(String name) async {
  String token = (await FirebaseAuth.instance.currentUser?.getIdToken())!;
  var url = Uri.http(EnvVariables.apiUrl, '/search/card', {'name': name});
  var res = await http.get(url, headers: {
    'authorization': token,
  });

  Map<String, dynamic> data = jsonDecode(res.body);
  return (data['array']! as List)
      .map((json) => CardInfo.fromJson(json, data['tagged']))
      .toList();
}
