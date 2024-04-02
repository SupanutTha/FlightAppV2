// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flight_booking_app/common/widgets/suggest_list/suggestion_list.dart';
import 'package:flight_booking_app/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flight_booking_app/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flight_booking_app/screens/home_screen/bloc/home_screen_state.dart';

class SearchFlightPopUp extends StatelessWidget {
  String type;
  SearchFlightPopUp({
    Key? key,
    required this.type,
  }) : super(key: key);
  @override
  
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            // Reset the value of the TextField
            return true; // Allow the back navigation
          },
          child: Scaffold(
            body: Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 100,
                      floating: false,
                      pinned: true,
                      backgroundColor: Colors.white,
                      title: Text(
                        "Where?",
                        style: TextStyle(color: Colors.black),
                      ),
                      iconTheme: IconThemeData(color: Colors.black),
                      bottom: AppBar(
                        elevation: 0.0,
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.white,
                        title: Container(
                          width: double.infinity,
                          height: 40,
                          //color: Colors.white,
                          padding:
                              EdgeInsets.all(1.0), // Add padding for the border
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.grey), // Add border
                            borderRadius:
                                BorderRadius.circular(8.0), // Add border radius
                          ),
                          child: Center(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              controller: ScrollController(),
                              child: TextField(
                                onChanged: (value) {
                                  //context.read<HomeScreenBloc>().add(DepartureEvent(value));
                                  context.read<HomeScreenBloc>().add(SuggestionEvent(value));
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: 'Country, City or airport',
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder
                                      .none, // Remove the focused border
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 115,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ListView.builder(
                    itemCount: state.suggestion.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.suggestion[index]),
                        onTap: () {
                          print("${state.departure}");
                          print("tap ${state.suggestion[index]}");
                          if ( type == 'departure'){
                            context.read<HomeScreenBloc>().add(DepartureEvent(state.suggestion[index]));
                          }
                          else if(type =='arrival'){
                            context.read<HomeScreenBloc>().add(ArrivalEvent(state.suggestion[index]));
                          }
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
