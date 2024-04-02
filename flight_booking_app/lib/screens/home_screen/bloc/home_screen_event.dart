abstract class HomeScreenEvent {
  const HomeScreenEvent();
}

class TypeToggleIndexEvent extends HomeScreenEvent{
  final int typeToggleIndex;
  final List<bool>? typeTrip;
  const TypeToggleIndexEvent(this.typeToggleIndex, this.typeTrip);
}

// class ChipTypeToggleEvent extends HomeScreenEvent{
//   final List<bool>? typeTrip;
//   const ChipTypeToggleEvent( this.typeTrip);
// }

class DepartureEvent extends HomeScreenEvent{
  final String departure;
  const DepartureEvent(this.departure);
}

class ArrivalEvent extends HomeScreenEvent{
  final String arrival;
  const ArrivalEvent(this.arrival);
}

class SuggestionEvent extends HomeScreenEvent{
  final String departure;
  const SuggestionEvent(this.departure);
}

class SelectSuggestionEvent  extends HomeScreenEvent{
  final String selectAirport;
  const SelectSuggestionEvent(this.selectAirport);
}

class SelectDateEvent extends HomeScreenEvent{
  final List<DateTime?> pickDate;
  const SelectDateEvent(this.pickDate);
}

// class SelectDepartureDateEvent extends HomeScreenEvent{
//   final List<DateTime?> selectDate;
//   const SelectDepartureDateEvent(this.selectDate);
// }

// class SelectReturnDateEvent extends HomeScreenEvent{
//   final List<DateTime?> selectDate;
//   const SelectReturnDateEvent(this.selectDate);
// }