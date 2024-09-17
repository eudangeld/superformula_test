import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/features/restaurants/presentation/ui/strings/en_strings.dart';
import 'package:restaurant_tour/features/restaurants/presentation/ui/widgets/open_closed_indicator_widget.dart';

void main() {
  OpenClosedIndicatorWidget wut;

  testWidgets('Should render closed when value is FALSE', (tester) async {
    wut = const OpenClosedIndicatorWidget(value: false);
    await tester.pumpWidget(MaterialApp(
      home: wut,
    ));
    expect(find.text(EnRestaurantsStrings.closed), findsOneWidget);
  });
  testWidgets('Should render Open now when value is TRUE', (tester) async {
    wut = const OpenClosedIndicatorWidget(value: true);
    await tester.pumpWidget(MaterialApp(
      home: wut,
    ));
    expect(find.text(EnRestaurantsStrings.openNow), findsOneWidget);
  });
}
