import 'package:flight_booking_app/common/widgets/dynamic_text_button.dart';
import 'package:flight_booking_app/common/widgets/toggle_button.dart';
import 'package:flight_booking_app/common/widgets/xen_popup/xen_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Test to ensure the button displays the correct text and icon
  testWidgets('DynamicTextButton displays correct text and icon', (WidgetTester tester) async {
    const testIcon = Icons.add;
    const buttonText = 'Test Button';
    const textController = 'Dynamic Text';

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: DynamicTextButton(
          textController: textController,
          buttonText: buttonText,
          icon: testIcon,
          buttonAction: Text('Action Body'),
        ),
      ),
    ));

    // Verify that the correct icon is displayed
    expect(find.byIcon(testIcon), findsOneWidget);

    // Verify the button displays text from textController when it's not null
    expect(find.text(textController), findsOneWidget);
    expect(find.text(buttonText), findsNothing);

    // Reset and test with null textController
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: DynamicTextButton(
          textController: null,
          buttonText: buttonText,
          icon: testIcon,
          buttonAction: Text('Action Body'),
        ),
      ),
    ));

    // Now, buttonText should be displayed instead
    expect(find.text(buttonText), findsOneWidget);
    expect(find.text(textController), findsNothing);
  });

  // Test to ensure tapping the button shows the XenPopupCard
  testWidgets('Tapping DynamicTextButton shows XenPopupCard', (WidgetTester tester) async {
    const buttonText = 'Test Button';

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: DynamicTextButton(
          textController: null,
          buttonText: buttonText,
          icon: Icons.add,
          buttonAction: Text('Action Body'),
        ),
      ),
    ));

    // Tap the button to show the popup
    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle(); // Wait for the popup animation

    // Verify XenPopupCard is displayed with the correct body
    expect(find.byType(XenPopupCard), findsOneWidget);
    expect(find.text('Action Body'), findsOneWidget);
  });

  //Test toggle bottom display correct display
   group('TransactionToggle Tests', () {
  testWidgets('tapping toggle button display correct color', (WidgetTester tester) async{
    final List<Widget> elementTest = [Text('button1'),Text('button2')];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TransactionToggle(
          children: elementTest, 
          onToggleChanged: (_){}),),
    ));
    expect(find.byType(ToggleButtons), findsOneWidget);
    expect(find.text('button1'), findsOneWidget);
    expect(find.text('button2'), findsOneWidget);
    
  });

  testWidgets('tapping a button class onToggleChanged with correct index', (WidgetTester tester) async{
    int tappedIndex = -1;
    final List<Widget> elementTest = [Text('button1'),Text('button2')];
    await tester.pumpWidget(MaterialApp(
      home: TransactionToggle(
        children: elementTest, 
        onToggleChanged: (index){
          tappedIndex = index;
        }),
    ));

    //tap first button
    await tester.tap(find.text('button1'));
    await tester.pumpAndSettle();

    expect(tappedIndex, 0);

    //tap second button
    await tester.tap(find.text('button2'));
    await tester.pumpAndSettle();
    
    expect(tappedIndex, 1);
  });
   });
}
