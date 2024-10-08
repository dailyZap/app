//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Register500Response {
  /// Returns a new [Register500Response] instance.
  Register500Response({
    required this.description,
    required this.reason,
  });

  String description;

  String reason;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Register500Response &&
          other.description == description &&
          other.reason == reason;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (description.hashCode) + (reason.hashCode);

  @override
  String toString() =>
      'Register500Response[description=$description, reason=$reason]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'description'] = this.description;
    json[r'reason'] = this.reason;
    return json;
  }

  /// Returns a new [Register500Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Register500Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Register500Response[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Register500Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Register500Response(
        description: mapValueOfType<String>(json, r'description')!,
        reason: mapValueOfType<String>(json, r'reason')!,
      );
    }
    return null;
  }

  static List<Register500Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Register500Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Register500Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Register500Response> mapFromJson(dynamic json) {
    final map = <String, Register500Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Register500Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Register500Response-objects as value to a dart map
  static Map<String, List<Register500Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Register500Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Register500Response.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'description',
    'reason',
  };
}
