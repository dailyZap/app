//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Friends {
  /// Returns a new [Friends] instance.
  Friends({
    this.friends = const [],
  });

  List<User> friends;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Friends && _deepEquality.equals(other.friends, friends);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (friends.hashCode);

  @override
  String toString() => 'Friends[friends=$friends]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'friends'] = this.friends;
    return json;
  }

  /// Returns a new [Friends] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Friends? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Friends[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Friends[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Friends(
        friends: User.listFromJson(json[r'friends']),
      );
    }
    return null;
  }

  static List<Friends> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Friends>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Friends.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Friends> mapFromJson(dynamic json) {
    final map = <String, Friends>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Friends.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Friends-objects as value to a dart map
  static Map<String, List<Friends>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Friends>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Friends.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'friends',
  };
}
