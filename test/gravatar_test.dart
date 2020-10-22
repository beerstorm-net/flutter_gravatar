import 'package:flutter_test/flutter_test.dart';
import 'package:gravatar/gravatar.dart';

void main() {
  test('generate gravatar urls', () {
    // test data
    final _email = "yg@beerstorm.net";
    final _hash = "5b44bc639d9cc3186fdbd344fd9c5246";
    final _gravatarUrl = "https://www.gravatar.com/";
    // test methods
    final gravatar = Gravatar(_email);
    expect(gravatar.gravatarHash(), _hash);
    expect(gravatar.gravatarImageUrl(), _gravatarUrl + "avatar/" + _hash);
    expect(gravatar.gravatarProfileUrl(), _gravatarUrl + _hash + ".json");
  });
}
