//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PictureResponseProps {
  /// Returns a new [PictureResponseProps] instance.
  PictureResponseProps({
    required this.uploadUrl,
  });

  String uploadUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PictureResponseProps && other.uploadUrl == uploadUrl;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (uploadUrl.hashCode);

  @override
  String toString() => 'PictureResponseProps[uploadUrl=$uploadUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'uploadUrl'] = this.uploadUrl;
    return json;
  }

  /// Returns a new [PictureResponseProps] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PictureResponseProps? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "PictureResponseProps[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "PictureResponseProps[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PictureResponseProps(
        uploadUrl: mapValueOfType<String>(json, r'uploadUrl')!,
      );
    }
    return null;
  }

  static List<PictureResponseProps> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PictureResponseProps>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PictureResponseProps.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PictureResponseProps> mapFromJson(dynamic json) {
    final map = <String, PictureResponseProps>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PictureResponseProps.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PictureResponseProps-objects as value to a dart map
  static Map<String, List<PictureResponseProps>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<PictureResponseProps>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PictureResponseProps.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'uploadUrl',
  };
}
