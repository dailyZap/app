//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserCreationParams {
  /// Returns a new [UserCreationParams] instance.
  UserCreationParams({
    required this.handle,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.region,
  });

  String handle;

  String email;

  String firstName;

  String lastName;

  Region region;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCreationParams &&
          other.handle == handle &&
          other.email == email &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.region == region;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (handle.hashCode) +
      (email.hashCode) +
      (firstName.hashCode) +
      (lastName.hashCode) +
      (region.hashCode);

  @override
  String toString() =>
      'UserCreationParams[handle=$handle, email=$email, firstName=$firstName, lastName=$lastName, region=$region]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'handle'] = this.handle;
    json[r'email'] = this.email;
    json[r'firstName'] = this.firstName;
    json[r'lastName'] = this.lastName;
    json[r'region'] = this.region;
    return json;
  }

  /// Returns a new [UserCreationParams] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserCreationParams? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UserCreationParams[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UserCreationParams[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserCreationParams(
        handle: mapValueOfType<String>(json, r'handle')!,
        email: mapValueOfType<String>(json, r'email')!,
        firstName: mapValueOfType<String>(json, r'firstName')!,
        lastName: mapValueOfType<String>(json, r'lastName')!,
        region: Region.fromJson(json[r'region'])!,
      );
    }
    return null;
  }

  static List<UserCreationParams> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserCreationParams>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserCreationParams.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserCreationParams> mapFromJson(dynamic json) {
    final map = <String, UserCreationParams>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserCreationParams.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserCreationParams-objects as value to a dart map
  static Map<String, List<UserCreationParams>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UserCreationParams>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserCreationParams.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'handle',
    'email',
    'firstName',
    'lastName',
    'region',
  };
}
