//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FeedResponseProps {
  /// Returns a new [FeedResponseProps] instance.
  FeedResponseProps({
    this.content = const [],
    this.authors = const [],
  });

  List<Content> content;

  List<Author> authors;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedResponseProps &&
          _deepEquality.equals(other.content, content) &&
          _deepEquality.equals(other.authors, authors);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (content.hashCode) + (authors.hashCode);

  @override
  String toString() => 'FeedResponseProps[content=$content, authors=$authors]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'content'] = this.content;
    json[r'authors'] = this.authors;
    return json;
  }

  /// Returns a new [FeedResponseProps] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeedResponseProps? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "FeedResponseProps[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "FeedResponseProps[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FeedResponseProps(
        content: Content.listFromJson(json[r'content']),
        authors: Author.listFromJson(json[r'authors']),
      );
    }
    return null;
  }

  static List<FeedResponseProps> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FeedResponseProps>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeedResponseProps.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FeedResponseProps> mapFromJson(dynamic json) {
    final map = <String, FeedResponseProps>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeedResponseProps.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FeedResponseProps-objects as value to a dart map
  static Map<String, List<FeedResponseProps>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<FeedResponseProps>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FeedResponseProps.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'content',
    'authors',
  };
}
