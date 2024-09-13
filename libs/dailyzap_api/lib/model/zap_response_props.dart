//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ZapResponseProps {
  /// Returns a new [ZapResponseProps] instance.
  ZapResponseProps({
    required this.zapId,
    required this.uploadFrontUrl,
    required this.uploadBackUrl,
  });

  String zapId;

  String uploadFrontUrl;

  String uploadBackUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ZapResponseProps &&
          other.zapId == zapId &&
          other.uploadFrontUrl == uploadFrontUrl &&
          other.uploadBackUrl == uploadBackUrl;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (zapId.hashCode) + (uploadFrontUrl.hashCode) + (uploadBackUrl.hashCode);

  @override
  String toString() =>
      'ZapResponseProps[zapId=$zapId, uploadFrontUrl=$uploadFrontUrl, uploadBackUrl=$uploadBackUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'zapId'] = this.zapId;
    json[r'uploadFrontUrl'] = this.uploadFrontUrl;
    json[r'uploadBackUrl'] = this.uploadBackUrl;
    return json;
  }

  /// Returns a new [ZapResponseProps] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ZapResponseProps? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ZapResponseProps[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ZapResponseProps[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ZapResponseProps(
        zapId: mapValueOfType<String>(json, r'zapId')!,
        uploadFrontUrl: mapValueOfType<String>(json, r'uploadFrontUrl')!,
        uploadBackUrl: mapValueOfType<String>(json, r'uploadBackUrl')!,
      );
    }
    return null;
  }

  static List<ZapResponseProps> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ZapResponseProps>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ZapResponseProps.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ZapResponseProps> mapFromJson(dynamic json) {
    final map = <String, ZapResponseProps>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ZapResponseProps.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ZapResponseProps-objects as value to a dart map
  static Map<String, List<ZapResponseProps>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ZapResponseProps>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ZapResponseProps.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'zapId',
    'uploadFrontUrl',
    'uploadBackUrl',
  };
}
