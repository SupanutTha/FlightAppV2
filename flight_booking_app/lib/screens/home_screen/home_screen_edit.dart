// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flight_booking_app/common/design/style.dart';
import 'package:flight_booking_app/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flight_booking_app/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flight_booking_app/screens/home_screen/bloc/home_screen_state.dart';
import 'package:flight_booking_app/screens/home_screen/widgets/home_screen_widgets.dart';
import 'package:flight_booking_app/screens/trip_screen.dart';
import 'package:flight_booking_app/common/widgets/toggle_button.dart';
import 'package:flight_booking_app/common/widgets/pop_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flight_booking_app/common/widgets/dynamic_text_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../common/models/flight_search_data.dart';
import 'package:flight_booking_app/screens/search_result_screen.dart';

class HomePageEdit extends StatelessWidget {

//   String sumTraveller = '1';
//   int _selectedIndex = 0;
//   bool isRoundTrip = false; 
//   TextEditingController _departureController = TextEditingController();
//   TextEditingController _arrivalController = TextEditingController();
//   TextEditingController _adultCountController = TextEditingController(text: '1');
//   TextEditingController _kidCountController = TextEditingController(text: '0');
//   TextEditingController _babyCountController = TextEditingController(text: '0');
//   DateTime? _departureDateController ;
//   DateTime? _returnDateController ;
//   TextEditingController _classController = TextEditingController(text: 'Economy');
 
//   void _navigateToResultPage() { // send data to class flight_search_data
//   // ?? = defualt value
//   String departure = _departureController.text ;
//   String arrival = _arrivalController.text;
//   String adultCount = _adultCountController.text;
//   String kidCount = _kidCountController.text;
//   String babyCount = _babyCountController.text;
//   String cabinClass = _classController.text;
//   DateTime? departureDate = _departureDateController;
//   // if (_departureDateController  == null) {
//   //   departureDate = DateTime.parse(_departureDateController);
//   // }

//   DateTime? returnDate = _returnDateController;
//   // if (_returnDateController.text.isNotEmpty) {
//   //   returnDate = DateTime.parse(_returnDateController.text);
//   // }

//   FlightSearchData searchData = FlightSearchData( // collect data  in flightSearchData
//     departure: departure.substring(departure.length- 3),
//     arrival: arrival.substring(arrival.length - 3),
//     adultCount: adultCount,
//     kidCount: kidCount,
//     babyCount: babyCount,
//     departureDate: departureDate,
//     returnDate: returnDate,
//     cabinClass: cabinClass.toUpperCase(),
//   );
  
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ResultPage(searchData: searchData), // send data to result page
//       ),
//     );
// }
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       if (index == 1) {
//         // Navigate to the home page
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (context) => TripScreen(), 
//           ),
//         );
//       }
//     });
//   }
//   void _onToggleChanged(int index) {
//   setState(() {
//     isRoundTrip = index == 1;
//     if (!isRoundTrip) {
//       _returnDateController = null; // Clear returnDate when One way is selected
//     }
//   });
// }

//   void updateTotalTravellers(String title, int value) {
//     // Parse the values from the controllers and calculate the total
//     var adultCount = int.tryParse(_adultCountController.text) ?? 0;
//     var kidCount = int.tryParse(_kidCountController.text) ?? 0;
//     var babyCount = int.tryParse(_babyCountController.text) ?? 0;
//     if (title == 'Adults' ){
//       adultCount +=1;
//     }
//     else if (title == 'Children'){
//       kidCount +=1;
//     }
//     else {
//       babyCount +=1;
//     }
//     var total = adultCount + kidCount + babyCount;
//     // Update the sumTraveller variable with the total
//     _adultCountController.text = adultCount.toString();
//     _kidCountController.text = kidCount.toString();
//    _babyCountController.text = babyCount.toString();
//     setState(() {
//       sumTraveller = total.toString();
//     });
//   }
//   void updatePage(){
//     setState(() {
      
//     });
//   }

  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      //appBar
      appBar: buildAppBar(),
      //body
      body: 
          BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (BuildContext context, state) {
              return Container( //all screen
                decoration: BoxDecoration( // orange header
                  color: AppStyles.primaryThemeColor,
                ),
                child: Stack(children: <Widget>[
                  Positioned( // big white box
                      top: 150,
                      child: Container( // white box
                        width: 430,
                        height: 667,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // single / round toggle chip
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: TransactionToggle(
                                children: [Text("One Way"),Text("Round")],
                              //initialSelection: [true, false],
                              initialSelection: state.typeTrip,
                              onToggleChanged: (index){
                                print(index);
                                context.read<HomeScreenBloc>().add(TypeToggleIndexEvent (index,state.typeTrip));
                                //context.read<HomeScreenBloc>().add(ChipTypeToggleEvent (state.typeTrip));
                                //BlocProvider.of<HomeScreenBloc>(context).add(TypeToggleIndexEvent(index));
                                print("${state.typeToggleIndex} ${state.typeTrip}");
                                },
                              ),
                            ),
                            // Departure and arrival text field
                            Column(
                              children: [
                                //Form text
                                reuseTextRow("From"),
                                //search Departure button
                                Padding( 
                                  padding: const EdgeInsets.only(
                                      left: 35, top: 10, right: 35),
                                      child: DynamicTextButton(
                                        textController: state.departure, 
                                        buttonText: 'Departure', 
                                        icon: Icons.flight_takeoff, 
                                        buttonAction: SearchFlightPopUp(type:"departure")
                                  ),
                                ),
                                SizedBox(height: 10,),
                                reuseTextRow("To"),
                                //search Departure button
                                Padding( 
                                  padding: const EdgeInsets.only(
                                      left: 35, top: 10, right: 35),
                                      child: DynamicTextButton(
                                        textController: state.arrival, 
                                        buttonText: 'Arrival', 
                                        icon: Icons.flight_takeoff, 
                                        buttonAction: SearchFlightPopUp(type:"arrival")
                                  ),
                                ),
                                Row( // text Departure and Return date
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:10,left: 35),
                                      child: Text(
                                        "Departure",
                                        style: AppStyles.primaryTextColor,
                                      ),
                                    ),
                                    Visibility(
                                      visible: state.typeToggleIndex == 1 ,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:10,left: 120),
                                        child: Text(
                                          "Return",
                                          style: AppStyles.primaryTextColor,
                                        ),
                                      ),
                                    ),
                                  ]
                                ),
                                Row( // button select departure Date and Return date
                                  children: [
                                    Row( // button select departure Date and Return date
                                      children: [
                                      // one way date select
                                      Visibility(
                                        visible: state.typeToggleIndex == 0 , // Show "Departure date" button when not round trip
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 35, top: 10, right: 25),
                                          child: DynamicTextButton(
                                            textController: state.selectDate != null
                                              ? DateFormat('E, d MMM yy').format(state.selectDate[0]!)
                                              : 'Departure date',
                                              // : 'test',
                                            buttonText: 'Departure date',
                                            icon: Icons.calendar_month,
                                            buttonAction: SingleDatePickPopUp(),
                                          ),
                                        ),
                                      ),
                                      // Round date select
                                      // departure date select
                                      Visibility(
                                        visible: state.typeToggleIndex == 1, // Show a departure different button for round trips
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 35, top: 10, right: 25),
                                          child: DynamicTextButton(
                                            textController: state.selectDate[0] != null
                                              ? DateFormat('E, d MMM yy').format(state.selectDate[0]!)
                                              : 'Departure date',
                                            buttonText: 'Departure date',
                                            icon: Icons.calendar_month,
                                            buttonAction: RangeDatePickPopUp(type: "departure",),
                                          ),
                                        ),
                                      ),
                                      Visibility( // return date
                                        visible: state.typeToggleIndex == 1 && state.selectDate[0] != null ,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 3, top: 10),
                                          child: DynamicTextButton(
                                            textController: state.selectDate[1] != null
                                              ? DateFormat('E, d MMM yy').format(state.selectDate[1]!)
                                              : 'Return date',
                                            buttonText: 'Return date',
                                            icon: Icons.calendar_month,
                                            buttonAction: RangeDatePickPopUp(type : "return"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )

                                  ],
                                ),
                              ],
                            )
                          ]
                        )
                      )
                  ),
                  
                ]
                )
            );
            }
          )
    );
  }
}//ec