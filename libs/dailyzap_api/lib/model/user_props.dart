//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserProps {
  /// Returns a new [UserProps] instance.
  UserProps({
    required this.id,
    required this.handle,
    required this.firstName,
    required this.lastName,
    required this.profilePictureUrl,
  });

  String id;

  String handle;

  String firstName;

  String lastName;

  String profilePictureUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProps &&
          other.id == id &&
          other.handle == handle &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.profilePictureUrl == profilePictureUrl;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (handle.hashCode) +
      (firstName.hashCode) +
      (lastName.hashCode) +
      (profilePictureUrl.hashCode);

  @override
  String toString() =>
      'UserProps[id=$id, handle=$handle, firstName=$firstName, lastName=$lastName, profilePictureUrl=$profilePictureUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'handle'] = this.handle;
    json[r'firstName'] = this.firstName;
    json[r'lastName'] = this.lastName;
    json[r'profilePictureUrl'] = this.profilePictureUrl;
    return json;
  }

  /// Returns a new [UserProps] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserProps? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UserProps[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UserProps[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserProps(
        id: mapValueOfType<String>(json, r'id')!,
        handle: mapValueOfType<String>(json, r'handle')!,
        firstName: mapValueOfType<String>(json, r'firstName')!,
        lastName: mapValueOfType<String>(json, r'lastName')!,
        profilePictureUrl: mapValueOfType<String>(json, r'profilePictureUrl')!,
      );
    }
    return null;
  }

  static List<UserProps> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserProps>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserProps.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserProps> mapFromJson(dynamic json) {
    final map = <String, UserProps>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserProps.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserProps-objects as value to a dart map
  static Map<String, List<UserProps>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UserProps>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserProps.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'handle',
    'firstName',
    'lastName',
    'profilePictureUrl',
  };
}
