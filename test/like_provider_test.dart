import 'package:flutter_test/flutter_test.dart';
import 'package:video_app/like_provider.dart';

void main() {
  test('Like count should increment and decrement correctly', () {
    final likeProvider = LikeProvider(0);

    likeProvider.like();
    expect(likeProvider.likeCount, 1);

    likeProvider.unlike();
    expect(likeProvider.likeCount, 0);
  });
}
