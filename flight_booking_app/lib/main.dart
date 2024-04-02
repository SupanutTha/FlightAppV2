import 'package:flight_booking_app/screens/home_screen/home_screen.dart';
import 'package:flight_booking_app/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home_screen/bloc/home_screen_bloc.dart';
import 'screens/home_screen/home_screen_edit.dart';

main() async {
  // final createDb = CreateDb();
  // await createDb.createAirplaneAirlineDb();
  
  return runApp(
    FlightApp()
  );
} //ef

class FlightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeScreenBloc>(
          create:  (context) => HomeScreenBloc()
          ),
      ],
      child: MaterialApp(
        theme: ThemeData( 
          primaryColor: Color(0xFFEC441E),
          appBarTheme: AppBarTheme(
            iconTheme:  IconThemeData(color:  Colors.black),
          )
        ),
        title: 'Loading App',
        initialRoute: '/main', // Set the initial route to the LoadingScreen
        routes: {
          //'/loading': (context) => LoadingScreen(), // Route for the loading screen
          '/main': (context) => HomePageEdit(), // Route for the main page
        },
      ),
    );
  }
}