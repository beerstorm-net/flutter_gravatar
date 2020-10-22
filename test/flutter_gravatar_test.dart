import 'package:flutter_gravatar/flutter_gravatar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // test data
  final _email = "yg@beerstorm.net";
  final _hash = "5b44bc639d9cc3186fdbd344fd9c5246";
  final _gravatarUrl = "https://www.gravatar.com/";

  test('generate gravatar hash', () {
    final gravatar = Gravatar(_email);
    expect(gravatar.gravatarHash(), _hash);
  });

  test('generate gravatar imageUrl', () {
    final gravatar = Gravatar(_email);
    expect(gravatar.gravatarImageUrl(), _gravatarUrl + "avatar/" + _hash);
  });

  test('generate gravatar profileUrl', () {
    final gravatar = Gravatar(_email);
    expect(gravatar.gravatarProfileUrl(), _gravatarUrl + _hash + ".json");
    expect(gravatar.gravatarProfileUrl(type: "vcf"), _gravatarUrl + _hash + ".vcf");
  });
}
