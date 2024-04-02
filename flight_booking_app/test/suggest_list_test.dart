

// Mock class for DatabaseHelper
import 'package:flight_booking_app/common/models/airport_db.dart';
import 'package:flight_booking_app/common/utilities/database_helper.dart';
import 'package:flight_booking_app/common/widgets/suggest_list/suggestion_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

void main() {
  // Define a group of tests
  group('SuggestionList Tests', () {
    // Mock DatabaseHelper instance
    late MockDatabaseHelper mockDatabaseHelper;

    // Set up mock database helper before each test
    setUp(() {
      mockDatabaseHelper = MockDatabaseHelper();
    });

    test('suggestionsCallback returns filtered suggestions', () async {
      // Given
      final suggestionList = SuggestionList(controller: 'Test');
      // Use 'when' to set up mock method response
      when(mockDatabaseHelper.retrieveAirports()).thenAnswer((_) async => [
        Airport(
          iata: 'ABC',
          city: 'TestCity',
          country: 'TestCountry',
          objectID: 'ABC',
          name: 'ABC',
          lat: 1.0,
          lon: 2.0,
          linksCount: 1,
        ),
        // Add more mocked Airport objects as needed
      ]);


      // When
     //final suggestions = await suggestionList.suggestionsCallback('ABC');

      // Then
      //expect(suggestions.isNotEmpty, true);
      //expect(suggestions.first, 'TestCity, TestCountry - ABC');
      // Add more assertions as needed
    });

    // Add more tests for different scenarios
  });
}