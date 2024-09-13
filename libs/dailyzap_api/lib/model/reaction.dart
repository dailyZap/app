//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Reaction {
  /// Returns a new [Reaction] instance.
  Reaction({
    required this.id,
    required this.authorId,
    required this.type,
    required this.imageUrl,
    required this.timestamp,
  });

  String id;

  String authorId;

  ReactionType type;

  String imageUrl;

  int timestamp;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Reaction &&
          other.id == id &&
          other.authorId == authorId &&
          other.type == type &&
          other.imageUrl == imageUrl &&
          other.timestamp == timestamp;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (authorId.hashCode) +
      (type.hashCode) +
      (imageUrl.hashCode) +
      (timestamp.hashCode);

  @override
  String toString() =>
      'Reaction[id=$id, authorId=$authorId, type=$type, imageUrl=$imageUrl, timestamp=$timestamp]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'authorId'] = this.authorId;
    json[r'type'] = this.type;
    json[r'imageUrl'] = this.imageUrl;
    json[r'timestamp'] = this.timestamp;
    return json;
  }

  /// Returns a new [Reaction] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Reaction? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Reaction[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Reaction[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Reaction(
        id: mapValueOfType<String>(json, r'id')!,
        authorId: mapValueOfType<String>(json, r'authorId')!,
        type: ReactionType.fromJson(json[r'type'])!,
        imageUrl: mapValueOfType<String>(json, r'imageUrl')!,
        timestamp: mapValueOfType<int>(json, r'timestamp')!,
      );
    }
    return null;
  }

  static List<Reaction> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Reaction>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Reaction.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Reaction> mapFromJson(dynamic json) {
    final map = <String, Reaction>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Reaction.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Reaction-objects as value to a dart map
  static Map<String, List<Reaction>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Reaction>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Reaction.listFromJson(
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
    'authorId',
    'type',
    'imageUrl',
    'timestamp',
  };
}
