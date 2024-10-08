//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Notifications {
  /// Returns a new [Notifications] instance.
  Notifications({
    this.notifications = const [],
  });

  List<Notification> notifications;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Notifications &&
          _deepEquality.equals(other.notifications, notifications);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (notifications.hashCode);

  @override
  String toString() => 'Notifications[notifications=$notifications]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'notifications'] = this.notifications;
    return json;
  }

  /// Returns a new [Notifications] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Notifications? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Notifications[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Notifications[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Notifications(
        notifications: Notification.listFromJson(json[r'notifications']),
      );
    }
    return null;
  }

  static List<Notifications> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Notifications>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Notifications.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Notifications> mapFromJson(dynamic json) {
    final map = <String, Notifications>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Notifications.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Notifications-objects as value to a dart map
  static Map<String, List<Notifications>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Notifications>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Notifications.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'notifications',
  };
}
