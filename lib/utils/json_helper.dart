import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:galaxy_planets/screen/home/model/home_model.dart';

class galaxyJsonHelper {
  Future<List<HomeModel>> postJsonParsing() async {
    String? jsonlist =
    await rootBundle.loadString("assets/json/galaxy.json");
    List json = jsonDecode(jsonlist);

    List<HomeModel> m1 = json.map((e) => HomeModel.mapToModel(e)).toList();
    return m1;
  }}