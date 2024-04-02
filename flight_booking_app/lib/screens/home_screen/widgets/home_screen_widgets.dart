import 'package:flight_booking_app/common/design/style.dart';
import 'package:flight_booking_app/common/widgets/toggle_button.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(){ 
  return AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Search Flight" , style: AppStyles.headerTextColor,),
          backgroundColor:AppStyles.primaryThemeColor,
          bottomOpacity: 0.0,
          elevation: 0.0,
          actions: []);
}

Widget reuseTextRow(String text){
  return Row( 
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Padding(
      padding: EdgeInsets.only(left: 35),
      child: Text(
        text,
        style: AppStyles.primaryTextColor,
      ),
    ),
  ],
  );
}