// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:flight_booking_app/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flight_booking_app/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flight_booking_app/screens/home_screen/bloc/home_screen_state.dart';

class RangeDatePickPopUp extends StatelessWidget {
  String type;
  RangeDatePickPopUp({
    Key? key,
    required this.type,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc,HomeScreenState>(
      builder: (context, state) {
        return Scaffold(
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
                      "Calendar",
                      style: TextStyle(color: Colors.black),
                    ),
                    iconTheme: IconThemeData(color: Colors.black),
                    bottom: AppBar(
                      elevation: 0.0,
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      title: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(1.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    "Departure date",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    // state.selectDateRound.length >= 1
                                    //     ? DateFormat('E, d MMM yy').format(
                                    //         selectedDateList[0] 
                                    //     ?? DateTime.now())
                                    //     : 'Select return date',
                                    "${DateFormat('E, d MMM yy').format(state.selectDate[0]!)}",
                                    style: TextStyle(
                                      color: Color(0xFFEC441E),
                                      fontSize: 14,
                                    ),
                                  )
                                  // Text(
                                  //   DateFormat('E, d MMM yy').format(selectedDateList[0]!),
                                  //   style: TextStyle(
                                  //     color: Color(0xFFEC441E),
                                  //     fontSize: 14,
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Return date",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    state.selectDate[1] != null
                                        ? DateFormat('E, d MMM yy').format(
                                            state.selectDate[1]!)
                                        : 'Select return date',
                                    style: TextStyle(
                                      color: Color(0xFFEC441E),
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
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
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 0),
                      child: CalendarDatePicker2(
                          config: CalendarDatePicker2Config(
                            calendarType: CalendarDatePicker2Type.range,
                            // currentDate: selectedDateList[0],
                            selectableDayPredicate: (day) => !day
                                .difference(DateTime.now()
                                    .subtract(const Duration(days: 1)))
                                .isNegative,
                          ),
                          value: state.selectDate,
                          onValueChanged: (dates) {
                            print("pick date : $dates");
                            //context.read<HomeScreenBloc>().add(SelectDateEvent(dates));
                            // if (dates.length == 1){
                            //   context.read<HomeScreenBloc>().add(SelectDepartureDateEvent(dates));
                            // } else if(dates.length == 2){
                            //    context.read<HomeScreenBloc>().add(SelectReturnDateEvent(dates));
                            //    Navigator.pop(context);
                            // }
                            // if (type == "departure"){
                            // context.read<HomeScreenBloc>().add(SelectDepartureDateEvent(dates));
                            // } else if (type == 'return'){
                            // context.read<HomeScreenBloc>().add(SelectReturnDateEvent(dates));
                            // }
                            // if (widget.isDepartureButton == false) {
                            //   dates[0] = widget.departureDateController;
                            // }
                            // print('select date :$dates');
                            // setState(() {
                            //   selectedDateList = dates;
                            // });
                            // print(selectedDateList);
                          }
                          // value: selectedDateList,
                          // onValueChanged: (dates) {
                          //   setState(() {
                          //     selectedDateList = List.from(dates);
                          //   });
                          // }
                          ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xFFEC441E),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                            height: 50,
                          ),
                          Text(
                            'Selected Date',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        context.read<HomeScreenBloc>().add(SelectDateEvent(dates));
                        // print(state.selectDateRound);
                        // if (selectedDateList.length == 2 &&
                        //     selectedDateList[0] != null &&
                        //     selectedDateList[1] != null) {
                        //   widget.departureDateController = selectedDateList[0]!;
                        //   widget.returnDateController = selectedDateList[1]!;
                        //   widget.callback(widget.departureDateController,
                        //       widget.returnDateController);
                        //   Navigator.pop(context);
                        // }
                      },
                    ),
                    // if (selectedDateList.isEmpty ||
                    //     selectedDateList[0] == null ||
                    //     selectedDateList.length < 2)
                    //   Text(
                    //     'Please select return dates',
                    //     style: TextStyle(
                    //       color: Colors.red,
                    //     ),
                    //   )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
