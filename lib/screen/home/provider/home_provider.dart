import 'package:flutter/cupertino.dart';
import 'package:galaxy_planets/screen/home/model/home_model.dart';
import 'package:galaxy_planets/utils/json_helper.dart';

class HomeProvider with ChangeNotifier{
  List<HomeModel> galaxyList=[];

  Future<void> getJsonData() async {
    galaxyJsonHelper helper = galaxyJsonHelper();
    galaxyList = await helper.postJsonParsing();
    notifyListeners();
  }
}
