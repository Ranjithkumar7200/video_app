import 'package:flutter_test/flutter_test.dart';
import 'package:video_app/video_feed.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Video thumbnails should appear in feed',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: VideoFeed()));

    expect(find.byType(Card),
        findsWidgets);
  });
}
