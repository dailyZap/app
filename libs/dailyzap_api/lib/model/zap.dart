//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Zap {
  /// Returns a new [Zap] instance.
  Zap({
    required this.id,
    required this.frontCameraUrl,
    required this.backCameraUrl,
    required this.timestamp,
    this.comments = const [],
    this.reactions = const [],
    this.late_,
  });

  String id;

  String frontCameraUrl;

  String backCameraUrl;

  int timestamp;

  List<Comment> comments;

  List<Reaction> reactions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? late_;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Zap &&
          other.id == id &&
          other.frontCameraUrl == frontCameraUrl &&
          other.backCameraUrl == backCameraUrl &&
          other.timestamp == timestamp &&
          _deepEquality.equals(other.comments, comments) &&
          _deepEquality.equals(other.reactions, reactions) &&
          other.late_ == late_;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (id.hashCode) +
      (frontCameraUrl.hashCode) +
      (backCameraUrl.hashCode) +
      (timestamp.hashCode) +
      (comments.hashCode) +
      (reactions.hashCode) +
      (late_ == null ? 0 : late_!.hashCode);

  @override
  String toString() =>
      'Zap[id=$id, frontCameraUrl=$frontCameraUrl, backCameraUrl=$backCameraUrl, timestamp=$timestamp, comments=$comments, reactions=$reactions, late_=$late_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'id'] = this.id;
    json[r'frontCameraUrl'] = this.frontCameraUrl;
    json[r'backCameraUrl'] = this.backCameraUrl;
    json[r'timestamp'] = this.timestamp;
    json[r'comments'] = this.comments;
    json[r'reactions'] = this.reactions;
    if (this.late_ != null) {
      json[r'late'] = this.late_;
    } else {
      json[r'late'] = null;
    }
    return json;
  }

  /// Returns a new [Zap] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Zap? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Zap[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Zap[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Zap(
        id: mapValueOfType<String>(json, r'id')!,
        frontCameraUrl: mapValueOfType<String>(json, r'frontCameraUrl')!,
        backCameraUrl: mapValueOfType<String>(json, r'backCameraUrl')!,
        timestamp: mapValueOfType<int>(json, r'timestamp')!,
        comments: Comment.listFromJson(json[r'comments']),
        reactions: Reaction.listFromJson(json[r'reactions']),
        late_: mapValueOfType<int>(json, r'late'),
      );
    }
    return null;
  }

  static List<Zap> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Zap>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Zap.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Zap> mapFromJson(dynamic json) {
    final map = <String, Zap>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Zap.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Zap-objects as value to a dart map
  static Map<String, List<Zap>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Zap>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Zap.listFromJson(
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
    'frontCameraUrl',
    'backCameraUrl',
    'timestamp',
    'comments',
    'reactions',
  };
}
