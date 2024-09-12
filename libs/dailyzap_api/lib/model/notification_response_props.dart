//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationResponseProps {
  /// Returns a new [NotificationResponseProps] instance.
  NotificationResponseProps({
    required this.type,
    required this.title,
    required this.content,
    this.targetId,
  });

  NotificationType type;

  String title;

  String content;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? targetId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationResponseProps &&
          other.type == type &&
          other.title == title &&
          other.content == content &&
          other.targetId == targetId;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (type.hashCode) +
      (title.hashCode) +
      (content.hashCode) +
      (targetId == null ? 0 : targetId!.hashCode);

  @override
  String toString() =>
      'NotificationResponseProps[type=$type, title=$title, content=$content, targetId=$targetId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'type'] = this.type;
    json[r'title'] = this.title;
    json[r'content'] = this.content;
    if (this.targetId != null) {
      json[r'targetId'] = this.targetId;
    } else {
      json[r'targetId'] = null;
    }
    return json;
  }

  /// Returns a new [NotificationResponseProps] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationResponseProps? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "NotificationResponseProps[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "NotificationResponseProps[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return NotificationResponseProps(
        type: NotificationType.fromJson(json[r'type'])!,
        title: mapValueOfType<String>(json, r'title')!,
        content: mapValueOfType<String>(json, r'content')!,
        targetId: mapValueOfType<String>(json, r'targetId'),
      );
    }
    return null;
  }

  static List<NotificationResponseProps> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NotificationResponseProps>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationResponseProps.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationResponseProps> mapFromJson(dynamic json) {
    final map = <String, NotificationResponseProps>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationResponseProps.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationResponseProps-objects as value to a dart map
  static Map<String, List<NotificationResponseProps>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<NotificationResponseProps>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NotificationResponseProps.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
    'title',
    'content',
  };
}
