//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FeedFriend {
  /// Returns a new [FeedFriend] instance.
  FeedFriend({
    this.users = const [],
    this.content = const [],
  });

  List<User> users;

  List<Content> content;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedFriend &&
          _deepEquality.equals(other.users, users) &&
          _deepEquality.equals(other.content, content);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (users.hashCode) + (content.hashCode);

  @override
  String toString() => 'FeedFriend[users=$users, content=$content]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'users'] = this.users;
    json[r'content'] = this.content;
    return json;
  }

  /// Returns a new [FeedFriend] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeedFriend? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "FeedFriend[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "FeedFriend[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FeedFriend(
        users: User.listFromJson(json[r'users']),
        content: Content.listFromJson(json[r'content']),
      );
    }
    return null;
  }

  static List<FeedFriend> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FeedFriend>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeedFriend.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FeedFriend> mapFromJson(dynamic json) {
    final map = <String, FeedFriend>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeedFriend.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FeedFriend-objects as value to a dart map
  static Map<String, List<FeedFriend>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<FeedFriend>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FeedFriend.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'users',
    'content',
  };
}
