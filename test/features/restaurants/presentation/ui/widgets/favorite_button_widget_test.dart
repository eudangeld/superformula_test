import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/features/restaurants/presentation/ui/widgets/favorite_button_widget.dart';

void main() {
  FavoriteButton wut;
  const whenFalseKey = Key('outlineHeartKey');
  const whenTrueKey = Key('filledHeartKey');

  testWidgets('Should render a outline heart when value is FALSE',
      (tester) async {
    wut = FavoriteButton(value: false);
    await tester.pumpWidget(wut);
    expect(find.byKey(whenFalseKey), findsOneWidget);
  });
  testWidgets('Should render a filled heart when value is TRUE',
      (tester) async {
    wut = FavoriteButton(value: true);
    await tester.pumpWidget(wut);
    expect(find.byKey(whenTrueKey), findsOneWidget);
  });
}
