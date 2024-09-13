//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FeedResponsePropsFriend {
  /// Returns a new [FeedResponsePropsFriend] instance.
  FeedResponsePropsFriend({
    this.users = const [],
    this.content = const [],
  });

  List<Author> users;

  List<Content> content;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedResponsePropsFriend &&
          _deepEquality.equals(other.users, users) &&
          _deepEquality.equals(other.content, content);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (users.hashCode) + (content.hashCode);

  @override
  String toString() =>
      'FeedResponsePropsFriend[users=$users, content=$content]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'users'] = this.users;
    json[r'content'] = this.content;
    return json;
  }

  /// Returns a new [FeedResponsePropsFriend] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeedResponsePropsFriend? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "FeedResponsePropsFriend[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "FeedResponsePropsFriend[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FeedResponsePropsFriend(
        users: Author.listFromJson(json[r'users']),
        content: Content.listFromJson(json[r'content']),
      );
    }
    return null;
  }

  static List<FeedResponsePropsFriend> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FeedResponsePropsFriend>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeedResponsePropsFriend.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FeedResponsePropsFriend> mapFromJson(dynamic json) {
    final map = <String, FeedResponsePropsFriend>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeedResponsePropsFriend.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FeedResponsePropsFriend-objects as value to a dart map
  static Map<String, List<FeedResponsePropsFriend>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<FeedResponsePropsFriend>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FeedResponsePropsFriend.listFromJson(
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
