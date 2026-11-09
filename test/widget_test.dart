import 'package:flutter_test/flutter_test.dart';
import 'package:simple_rajang_river_cruise_app/main.dart';

void main() {
  testWidgets('Star count increases after tap', (WidgetTester tester) async {
    await tester.pumpWidget(const RajangCruiseApp());

    expect(find.text('43'), findsOneWidget);

    await tester.tap(find.text('43'));
    await tester.pump();

    expect(find.text('44'), findsOneWidget);
  });
}