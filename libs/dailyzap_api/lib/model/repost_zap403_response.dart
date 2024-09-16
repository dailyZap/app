//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RepostZap403Response {
  /// Returns a new [RepostZap403Response] instance.
  RepostZap403Response({
    required this.reason,
  });

  String reason;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepostZap403Response && other.reason == reason;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (reason.hashCode);

  @override
  String toString() => 'RepostZap403Response[reason=$reason]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'reason'] = this.reason;
    return json;
  }

  /// Returns a new [RepostZap403Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RepostZap403Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "RepostZap403Response[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "RepostZap403Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RepostZap403Response(
        reason: mapValueOfType<String>(json, r'reason')!,
      );
    }
    return null;
  }

  static List<RepostZap403Response> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <RepostZap403Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RepostZap403Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RepostZap403Response> mapFromJson(dynamic json) {
    final map = <String, RepostZap403Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RepostZap403Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RepostZap403Response-objects as value to a dart map
  static Map<String, List<RepostZap403Response>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<RepostZap403Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RepostZap403Response.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'reason',
  };
}
