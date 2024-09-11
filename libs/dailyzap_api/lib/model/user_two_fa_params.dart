//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserTwoFaParams {
  /// Returns a new [UserTwoFaParams] instance.
  UserTwoFaParams({
    required this.loginToken,
    required this.twoFaCode,
  });

  String loginToken;

  String twoFaCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTwoFaParams &&
          other.loginToken == loginToken &&
          other.twoFaCode == twoFaCode;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (loginToken.hashCode) + (twoFaCode.hashCode);

  @override
  String toString() =>
      'UserTwoFaParams[loginToken=$loginToken, twoFaCode=$twoFaCode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'loginToken'] = this.loginToken;
    json[r'twoFaCode'] = this.twoFaCode;
    return json;
  }

  /// Returns a new [UserTwoFaParams] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserTwoFaParams? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UserTwoFaParams[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UserTwoFaParams[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserTwoFaParams(
        loginToken: mapValueOfType<String>(json, r'loginToken')!,
        twoFaCode: mapValueOfType<String>(json, r'twoFaCode')!,
      );
    }
    return null;
  }

  static List<UserTwoFaParams> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserTwoFaParams>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserTwoFaParams.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserTwoFaParams> mapFromJson(dynamic json) {
    final map = <String, UserTwoFaParams>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserTwoFaParams.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserTwoFaParams-objects as value to a dart map
  static Map<String, List<UserTwoFaParams>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UserTwoFaParams>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserTwoFaParams.listFromJson(
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
    'twoFaCode',
  };
}
