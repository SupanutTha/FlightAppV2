class HomeScreenState {
  List<bool>? typeTrip;
  int typeToggleIndex;
  String? departure;
  List suggestion;
  String? selectAirport;
  String? arrival;
  // int adultCount;
  // int kidCount;
  // int babyCount;
  List<DateTime?> selectDate; 
  //List<DateTime?> selectDateRound;

  // DateTime? departureDate;
  // DateTime? returnDate;
  // String cabinClass;

  HomeScreenState({
    List<bool>? typeTrip,
    this.typeToggleIndex = 0,
    this.departure,
    this.arrival,
    this.suggestion = const [],
    this.selectAirport,
    List<DateTime?>? selectDate,
    //List<DateTime?>? selectDateRound,
    // this.adultCount = 0,
    // this.kidCount = 0,
    // this.babyCount = 0,
    // this.departureDate,
    // this.returnDate,
    // this.cabinClass = "Economy",
  }): selectDate = selectDate ?? [DateTime.now(),null],
  typeTrip = typeTrip ?? [true,false];
  //selectDateRound =  selectDateRound ?? [DateTime.now(),null];

   HomeScreenState copyWith({
    int? typeToggleIndex,
    String? departure,
    String? arrival,
    List<bool>? typeTrip,
  //   // int? adultCount,
  //   // int? kidCount,
  //   // int? babyCount,
    List<DateTime?>? selectDate, //   // DateTime? returnDate,
    //List<DateTime?>? selectDateRound,
  //   // String? cabinClass,
   }){
    return HomeScreenState(
      typeToggleIndex:typeToggleIndex??this.typeToggleIndex,
      departure: departure??this.departure,
      arrival: arrival??this.arrival,
      typeTrip : typeTrip??this.typeTrip,
      selectDate: selectDate??this.selectDate,
      //selectDateRound: selectDateRound??this.selectDateRound
  //     // adultCount: adultCount??this.adultCount,
  //     // kidCount: kidCount??this.kidCount,
  //     // babyCount: babyCount??this.babyCount,
      //departureDate: departureDate??this.departureDate,
  //     // returnDate: returnDate??this.returnDate,
  //     // cabinClass: cabinClass??this.cabinClass
    );
  }
}



