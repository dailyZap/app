//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationType {
  /// Instantiate a new enum with the provided [value].
  const NotificationType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ZAP_NOW = NotificationType._(r'ZAP_NOW');
  static const FRIEND_REQUEST = NotificationType._(r'FRIEND_REQUEST');
  static const NEW_DAILY_ZAP = NotificationType._(r'NEW_DAILY_ZAP');
  static const NEW_REACTION = NotificationType._(r'NEW_REACTION');
  static const NEW_COMMENT = NotificationType._(r'NEW_COMMENT');
  static const TAGGED = NotificationType._(r'TAGGED');

  /// List of all possible values in this [enum][NotificationType].
  static const values = <NotificationType>[
    ZAP_NOW,
    FRIEND_REQUEST,
    NEW_DAILY_ZAP,
    NEW_REACTION,
    NEW_COMMENT,
    TAGGED,
  ];

  static NotificationType? fromJson(dynamic value) =>
      NotificationTypeTypeTransformer().decode(value);

  static List<NotificationType> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <NotificationType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [NotificationType] to String,
/// and [decode] dynamic data back to [NotificationType].
class NotificationTypeTypeTransformer {
  factory NotificationTypeTypeTransformer() =>
      _instance ??= const NotificationTypeTypeTransformer._();

  const NotificationTypeTypeTransformer._();

  String encode(NotificationType data) => data.value;

  /// Decodes a [dynamic value][data] to a NotificationType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  NotificationType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ZAP_NOW':
          return NotificationType.ZAP_NOW;
        case r'FRIEND_REQUEST':
          return NotificationType.FRIEND_REQUEST;
        case r'NEW_DAILY_ZAP':
          return NotificationType.NEW_DAILY_ZAP;
        case r'NEW_REACTION':
          return NotificationType.NEW_REACTION;
        case r'NEW_COMMENT':
          return NotificationType.NEW_COMMENT;
        case r'TAGGED':
          return NotificationType.TAGGED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [NotificationTypeTypeTransformer] instance.
  static NotificationTypeTypeTransformer? _instance;
}
