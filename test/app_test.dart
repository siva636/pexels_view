import 'package:flutter_test/flutter_test.dart';
import 'package:pexels_view/src/app.dart';
import 'package:pexels_view/src/utility/constant/constant.dart';

void main() {
  testWidgets('App should have the Search widget title',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.text(title), findsOneWidget);
  });
}
