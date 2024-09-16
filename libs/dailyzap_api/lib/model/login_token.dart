//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LoginToken {
  /// Returns a new [LoginToken] instance.
  LoginToken({
    required this.loginToken,
  });

  String loginToken;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginToken && other.loginToken == loginToken;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (loginToken.hashCode);

  @override
  String toString() => 'LoginToken[loginToken=$loginToken]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'loginToken'] = this.loginToken;
    return json;
  }

  /// Returns a new [LoginToken] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LoginToken? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "LoginToken[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "LoginToken[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LoginToken(
        loginToken: mapValueOfType<String>(json, r'loginToken')!,
      );
    }
    return null;
  }

  static List<LoginToken> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <LoginToken>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LoginToken.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LoginToken> mapFromJson(dynamic json) {
    final map = <String, LoginToken>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LoginToken.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LoginToken-objects as value to a dart map
  static Map<String, List<LoginToken>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<LoginToken>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LoginToken.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'loginToken',
  };
}
