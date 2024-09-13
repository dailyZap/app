//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FriendRequestsResponseProps {
  /// Returns a new [FriendRequestsResponseProps] instance.
  FriendRequestsResponseProps({
    this.incoming = const [],
    this.outgoing = const [],
  });

  List<UserProps> incoming;

  List<UserProps> outgoing;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FriendRequestsResponseProps &&
          _deepEquality.equals(other.incoming, incoming) &&
          _deepEquality.equals(other.outgoing, outgoing);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (incoming.hashCode) + (outgoing.hashCode);

  @override
  String toString() =>
      'FriendRequestsResponseProps[incoming=$incoming, outgoing=$outgoing]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'incoming'] = this.incoming;
    json[r'outgoing'] = this.outgoing;
    return json;
  }

  /// Returns a new [FriendRequestsResponseProps] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FriendRequestsResponseProps? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "FriendRequestsResponseProps[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "FriendRequestsResponseProps[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FriendRequestsResponseProps(
        incoming: UserProps.listFromJson(json[r'incoming']),
        outgoing: UserProps.listFromJson(json[r'outgoing']),
      );
    }
    return null;
  }

  static List<FriendRequestsResponseProps> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <FriendRequestsResponseProps>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FriendRequestsResponseProps.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FriendRequestsResponseProps> mapFromJson(dynamic json) {
    final map = <String, FriendRequestsResponseProps>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FriendRequestsResponseProps.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FriendRequestsResponseProps-objects as value to a dart map
  static Map<String, List<FriendRequestsResponseProps>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<FriendRequestsResponseProps>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FriendRequestsResponseProps.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'incoming',
    'outgoing',
  };
}
