
import 'package:UIKit/customapps/estate/models/category.dart';
import 'package:UIKit/customapps/estate/models/house.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutx/core/state_management/controller.dart';

class EstateHomeController extends FxController {

  bool showLoading = true, uiLoading=true;

  List<Category>? categories ;
  List<House>? houses;
  List selectedBedRooms = [];
  List selectedBathRooms = [];
  var selectedRange=RangeValues(200,800);


  @override
  initState(){
    super.save = false;
    super.initState();
    fetchData();

  }



  void fetchData() async{

    await Future.delayed(Duration(seconds: 1));

    categories = Category.categoryList();
    houses = House.houseList();

    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "estate_home_controller";
  }

}