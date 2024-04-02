import 'package:bloc/bloc.dart';
import 'package:flight_booking_app/common/widgets/suggest_list/suggestion_list.dart';
import 'package:flight_booking_app/screens/home_screen/bloc/home_screen_event.dart';
import 'package:flight_booking_app/screens/home_screen/bloc/home_screen_state.dart';
import 'package:flutter/material.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenState()) {
    on<TypeToggleIndexEvent>(_tripTypeToggleIndexEvent);
    //on<ChipTypeToggleEvent>(_chipTypeToggleEvent);
    on<DepartureEvent>(_departureEvent);
    on<ArrivalEvent>(_arrivalEvent);
    on<SuggestionEvent>(_suggestionEvent);
    on<SelectSuggestionEvent>(_selectSuggestionEvent);
    on<SelectDateEvent>(_selectDateEvent);
    // on<SelectDepartureDateEvent>(_selectDepartureDateEvent);
    // on<SelectReturnDateEvent>(_selectReturnDateEvent);
  }
  // event toggle dosnt use
  Future <void> _tripTypeToggleIndexEvent (TypeToggleIndexEvent event, Emitter<HomeScreenState> emit) async{
      // _chipTypeToggleEvent(event.typeToggleIndex);
      print("index check ${event.typeToggleIndex}");
     if (event.typeToggleIndex == 0){
        state.typeTrip = [true,false];
      } else {
        state.typeTrip = [false,true];
      }
      print("toggle action ${state.typeTrip}");
      emit(state.copyWith(typeToggleIndex: event.typeToggleIndex));
      //emit(HomeScreenState( typeToggleIndex: event.typeToggleIndex , typeTrip: state.typeTrip));
  }

  // event departure search
  void _departureEvent(DepartureEvent event , Emitter<HomeScreenState> emit) {
    emit(state.copyWith(departure: event.departure));
  }

  // event arrival search
  void _arrivalEvent(ArrivalEvent event , Emitter<HomeScreenState> emit) {
    emit(state.copyWith(arrival: event.arrival));
  }

  // event suggestion list
   Future<void> _suggestionEvent(SuggestionEvent event , Emitter<HomeScreenState> emit) async {
    // print("${event.departure}");
     final updatedSuggestions = await SuggestionList(controller: event.departure)
        .suggestionsCallback(event.departure);
      state.suggestion = updatedSuggestions;
      state.copyWith(departure: event.departure);
    emit(HomeScreenState( suggestion: state.suggestion ,departure: state.departure));
  }

  // event select suggestion
  void _selectSuggestionEvent (SelectSuggestionEvent event, Emitter<HomeScreenState> emit){
    print(event.selectAirport);
    emit(state.copyWith(departure: event.selectAirport));
  }

  void _selectDateEvent( SelectDateEvent event , Emitter emit){
    if (event.pickDate.length == 1){
      state.selectDate[0] = event.pickDate[0];
    } else if (event.pickDate.length == 2){
      state.selectDate[1] = event.pickDate[1];
    }
    print(" select date : ${state.selectDate}");
    emit(state.copyWith(selectDate: state.selectDate));
  }
  // event departure date select
  // void _selectDepartureDateEvent ( SelectDepartureDateEvent event, Emitter<HomeScreenState> emit) {
  //   //emit(state.copyWith(departureDate:  event.departureDate));
  //   state.selectDate[0] = event.selectDate[0];
  //   //state.selectDateOneWay[1] = state.selectDateOneWay[1];
  //   state.copyWith(selectDate: state.selectDate);
  //   //emit(state.copyWith(selectDate : state.selectDate));
  //   emit(HomeScreenState(selectDate: state.selectDate));
  // }

  // //event return date select
  // void _selectReturnDateEvent ( SelectReturnDateEvent event , Emitter emit){
  //   if (event.selectDate.length ==1 ){
  //     //state.copyWith(se)
  //   }
  //   state.selectDate[1] = event.selectDate[1];
  //   emit(state.copyWith(selectDate: state.selectDate));
  // }

}