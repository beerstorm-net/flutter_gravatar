library gravatar;

import 'dart:convert';

import 'package:crypto/crypto.dart';

import 'utils.dart';

class Gravatar {
  String _email;
  String _gravatarUrl; // = "https://www.gravatar.com/"; // /avatar for images
  static _initGravatarUrl(gravatarUrl) =>
      Utils.nullSafe(gravatarUrl).isNotEmpty ? gravatarUrl : "https://www.gravatar.com/";

  /// init with email as parameter
  Gravatar(String email, {String gravatarUrl})
      : assert(Utils.nullSafe(email).isNotEmpty && email.trim().isValidEmail()),
        this._email = email.trim().toLowerCase(),
        this._gravatarUrl = _initGravatarUrl(gravatarUrl);

  String _generateMd5(String inputStr) {
    return md5.convert(utf8.encode(inputStr)).toString();
  }

  /// generate MD5 HASH from email, used for Gravatar API requests
  String gravatarHash() {
    return _generateMd5(_email);
  }

  /// generate ImageUrl for Gravatar
  String gravatarImageUrl() {
    return _gravatarUrl + "avatar/" + _generateMd5(_email);
  }

  /// generate ProfileUrl for Gravatar
  String gravatarProfileUrl({String type = ".json"}) {
    if (Utils.nullSafe(type).isNotEmpty) {
      type = type.toLowerCase().trim();
    }
    type = !type.startsWith(".") ? ("." + type) : type;
    if (!".json .xml .php .vcf .qr".contains(type)) {
      type = ".json"; //default
    }

    return _gravatarUrl + _generateMd5(_email) + type;
  }
}
