import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart'; // Update if your app name or main file is different

void main() {
  testWidgets('Home page loads with welcome message and about NGO',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(NGOApp()); // Make sure your main.dart uses MyApp()

    // Verify if the welcome message is displayed.
    expect(find.text('Welcome to Our NGO'), findsOneWidget);

    // Verify if the about text is displayed.
    expect(find.textContaining('About'), findsOneWidget);

    
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('Volunteer form page contains required fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(NGOApp());

    // Tap the tab/drawer item if needed (assumes tab is used)
    final volunteerTab = find.text('Volunteer'); // Tab or Drawer title
    expect(volunteerTab, findsOneWidget);
    await tester.tap(volunteerTab);
    await tester.pumpAndSettle();

    // Check for form fields
    expect(find.byType(TextField), findsNWidgets(3)); // Name, Phone, City
    expect(find.text('Submit'), findsOneWidget);
  });
}
