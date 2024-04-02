// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flight_booking_app/common/design/style.dart';
import 'package:flight_booking_app/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flight_booking_app/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flight_booking_app/screens/home_screen/bloc/home_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SingleDatePickPopUp extends StatelessWidget {
//   // DateTime? controller;
  //List<DateTime?> selectedDate =[DateTime.now()];
//   // final Function callback;
//   SingleDatePickPopUp ({
//     // Key? key ,
//     // required this.controller,
//     // //required this.selectedDate,
//     // required this.callback
//     });
//   @override
//   _SingleDatePickPopUpState createState() => _SingleDatePickPopUpState();

// }

// class  _SingleDatePickPopUpState extends State<SingleDatePickPopUp> {
   late List<DateTime?> selectedDateList =[];
//   @override
//   void initState() {
//     super.initState();
//     print(widget.controller);
//     selectedDateList.add(widget.controller);

//     selectedDateList[0] = widget.controller ?? DateTime.now();
//     print('selected date ${selectedDateList}');
//   }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
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
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(1.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Select date",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              Builder(builder: (context) {
                                final calendarText = state.selectDate[0] == null
                                    ? DateTime.now()
                                    : state.selectDate[0];
                                return Text(
                                  DateFormat('E, d MMM yy').format(calendarText!),
                                  style: TextStyle(
                                    color: Color(0xFFEC441E),
                                    fontSize: 14,
                                  ),
                                );
                              }
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Add other Sliver widgets here
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
                            selectedDayHighlightColor: AppStyles.primaryThemeColor,
                            currentDate: state.selectDate[0],
                            selectableDayPredicate: (day) => !day
                                .difference(DateTime.now()
                                    .subtract(const Duration(days: 1)))
                                .isNegative,
                          ),
                          value: state.selectDate,
                          onValueChanged: (dates) {
                            print("$dates");
                            print("round check ${state.selectDate[1]}");
                            context.read<HomeScreenBloc>().add(SelectDateEvent(dates));
                            Navigator.pop(context);
                          }),
                    ),
                    // OutlinedButton(
                    //   style: OutlinedButton.styleFrom(
                    //     foregroundColor: Colors.black,
                    //     backgroundColor: const Color(0xFFEC441E),
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       SizedBox(
                    //         width: 10,
                    //         height: 50,
                    //       ),
                    //       Text(
                    //         'Selected Date',
                    //         style: TextStyle(
                    //           color: Color.fromRGBO(255, 255, 255, 1),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    //   onPressed: () {
                    //     // context.read<HomeScreenBloc>().add(DepartureDateEvent(state.));
                    //     // if (selectedDateList.isNotEmpty &&
                    //     //     selectedDateList[0] != null) {
                    //     //   print('checkif');
                    //     //   widget.controller = selectedDateList[0]!;
                    //     //   print('controller :${widget.controller}');
                    //     //   widget.callback(widget.controller);
                    //     //   Navigator.pop(context, widget.controller);
                    //     // }
                    //   },
                    // ),
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
