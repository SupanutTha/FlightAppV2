// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flight_booking_app/models/save_flight.dart';
// import 'package:flight_booking_app/models/flight.dart';
// import 'package:flight_booking_app/models/selected_flights.dart';
// import 'package:flight_booking_app/screens/home_screen/home_screen.dart';
// import 'package:flight_booking_app/screens/trip_summary_extre.dart';
// import 'package:flight_booking_app/utilities/database_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';


// class TripScreen extends StatefulWidget{

//   @override
//   _TripScreenState createState() => _TripScreenState();
  
// }

// class _TripScreenState extends State<TripScreen>{
//   int _selectedIndex = 1;
//   @override
//   void initState()   {
//     super.initState();
//   }

//    void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       if (index == 0) {
//         // Navigate to the home page
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (context) => HomePage(),
//           ),
//         );
//       }
//     });
//   }
//   final dbHelper = DatabaseHelper.instance;
//   String formatDate(String inputDate) {
//     final dateTime = DateTime.parse(inputDate);
//     final formatter = DateFormat('E, d MMM');
//     return formatter.format(dateTime);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           automaticallyImplyLeading: false,
//           elevation: 0.0, 
//           backgroundColor: Colors.white,
//           title: Text("Save Trips",style: TextStyle(color: Colors.black),),
//                     iconTheme: IconThemeData(
//                       color: Colors.black
//                     ),
//         ),
//       body: Center(
  
//                 child: ListView.builder(
//                 itemCount: SaveFlights.saveFlights.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final flight = SaveFlights.saveFlights[index];
//                   int connectingFlight =flight[0].itineraries[0]['segments'].length;String formatDate(String inputDate) {
//                       final dateTime = DateTime.parse(inputDate);
//                       final formatter = DateFormat('E, d MMM');
//                       return formatter.format(dateTime);
//                 }
//                  return GestureDetector(
//                 onTap: () {
//                   // Navigate to the flight detail page when a list item is tapped
//                  for (Flight singleFlight in flight) {
//                           SelectedFlights.selectedFlights.add(singleFlight);
//                         } 
//                   Navigator.of(context).push(             
//                     MaterialPageRoute(
//                       builder: (context) => SummaryFlightExtra(),
//                     ),
//                   );
//                 },
//                  child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       height: 100,
//                       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.black26
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(12)),
//       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             Row( // desination
//                         children: [
//                           Expanded(
//                             flex: 1,
//                             child: Column(
//                               children: [
//                                 FutureBuilder<String>(
//                                   future: dbHelper.findCityAndCountry(flight[0].itineraries[0]['segments'][0]['departure']['iataCode']),
//                                   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//                                     if (snapshot.connectionState == ConnectionState.waiting) {
//                                       return CircularProgressIndicator();
//                                     } else if (snapshot.hasError) {
//                                       return Text('Error: ${snapshot.error}');
//                                     } else {
//                                       return Column(
//                                         children: [
//                                           Text(
//                                             '${snapshot.data}',
//                                             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color:Color(0xFFEC441E)),
//                                           ),
//                                         ],
//                                       );
//                                     }
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             flex: 1,
//                             child: Icon (Icons.arrow_forward_rounded, size: 40,),
//                           ),
//                           Expanded(
//                                   flex: 1,
//                                   child: Column(
//                                     children: [
//                                       FutureBuilder<String>(
//                                         future: dbHelper.findCityAndCountry(flight[0].itineraries[0]['segments'][connectingFlight-1]['arrival']['iataCode'] ),
//                                         builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//                                           if (snapshot.connectionState == ConnectionState.waiting) {
//                                             return CircularProgressIndicator();
//                                           } else if (snapshot.hasError) {
//                                             return Text('Error: ${snapshot.error}');
//                                           } else {
//                                             return Text(
//                                               '${snapshot.data}',
//                                               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color(0xFFEC441E)),
//                                             );
//                                           }
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                         ],
//                                           ),
//                                           SizedBox(height: 10,),
//                                           Row(
//                         children: [
//                           Text(formatDate(flight[0].itineraries[0]['segments'][0]['departure']['at'])),
//                           Text(" - "),
//                           Text(formatDate(
//                            flight.length == 1
//                                 ? flight[0].itineraries[0]['segments'][0]['arrival']['at']
//                                 : flight[1].itineraries[0]['segments'][0]['arrival']['at']),
//                           ),
//                         ],
//                                           ),
//                           ],
//                         ),
//                       ),
//                     ),
//                  )
//                   );
//                 },
//               ),
              
//         ),
//        bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.airplane_ticket),
//             label: 'Trips',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color(0xFFEC441E),
//         onTap: _onItemTapped,
//       ),
//     );
//   }


// }