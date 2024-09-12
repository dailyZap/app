//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProfileResponseProps {
  /// Returns a new [ProfileResponseProps] instance.
  ProfileResponseProps({
    required this.id,
    required this.handle,
    required this.firstName,
    required this.lastName,
    required this.pictureUrl,
    this.inviteUrl,
  });

  String id;

  String handle;

  String firstName;

  String lastName;

  String pictureUrl;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? inviteUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileResponseProps &&
          other.id == id &&
          other.handle == handle &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.pictureUrl == pictureUrl &&
          other.inviteUrl == inviteUrl;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (handle.hashCode) +
      (firstName.hashCode) +
      (lastName.hashCode) +
      (pictureUrl.hashCode) +
      (inviteUrl == null ? 0 : inviteUrl!.hashCode);

  @override
  String toString() =>
      'ProfileResponseProps[id=$id, handle=$handle, firstName=$firstName, lastName=$lastName, pictureUrl=$pictureUrl, inviteUrl=$inviteUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'handle'] = this.handle;
    json[r'firstName'] = this.firstName;
    json[r'lastName'] = this.lastName;
    json[r'pictureUrl'] = this.pictureUrl;
    if (this.inviteUrl != null) {
      json[r'inviteUrl'] = this.inviteUrl;
    } else {
      json[r'inviteUrl'] = null;
    }
    return json;
  }

  /// Returns a new [ProfileResponseProps] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProfileResponseProps? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ProfileResponseProps[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ProfileResponseProps[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ProfileResponseProps(
        id: mapValueOfType<String>(json, r'id')!,
        handle: mapValueOfType<String>(json, r'handle')!,
        firstName: mapValueOfType<String>(json, r'firstName')!,
        lastName: mapValueOfType<String>(json, r'lastName')!,
        pictureUrl: mapValueOfType<String>(json, r'pictureUrl')!,
        inviteUrl: mapValueOfType<String>(json, r'inviteUrl'),
      );
    }
    return null;
  }

  static List<ProfileResponseProps> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ProfileResponseProps>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProfileResponseProps.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProfileResponseProps> mapFromJson(dynamic json) {
    final map = <String, ProfileResponseProps>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProfileResponseProps.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProfileResponseProps-objects as value to a dart map
  static Map<String, List<ProfileResponseProps>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ProfileResponseProps>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProfileResponseProps.listFromJson(
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
    'pictureUrl',
  };
}
