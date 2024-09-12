//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Model36EnumsNotificationType {
  /// Instantiate a new enum with the provided [value].
  const Model36EnumsNotificationType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ZAP_NOW = Model36EnumsNotificationType._(r'ZAP_NOW');
  static const FRIEND_REQUEST =
      Model36EnumsNotificationType._(r'FRIEND_REQUEST');
  static const NEW_DAILY_ZAP = Model36EnumsNotificationType._(r'NEW_DAILY_ZAP');
  static const NEW_REACTION = Model36EnumsNotificationType._(r'NEW_REACTION');
  static const NEW_COMMENT = Model36EnumsNotificationType._(r'NEW_COMMENT');
  static const TAGGED = Model36EnumsNotificationType._(r'TAGGED');

  /// List of all possible values in this [enum][Model36EnumsNotificationType].
  static const values = <Model36EnumsNotificationType>[
    ZAP_NOW,
    FRIEND_REQUEST,
    NEW_DAILY_ZAP,
    NEW_REACTION,
    NEW_COMMENT,
    TAGGED,
  ];

  static Model36EnumsNotificationType? fromJson(dynamic value) =>
      Model36EnumsNotificationTypeTypeTransformer().decode(value);

  static List<Model36EnumsNotificationType> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Model36EnumsNotificationType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Model36EnumsNotificationType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [Model36EnumsNotificationType] to String,
/// and [decode] dynamic data back to [Model36EnumsNotificationType].
class Model36EnumsNotificationTypeTypeTransformer {
  factory Model36EnumsNotificationTypeTypeTransformer() =>
      _instance ??= const Model36EnumsNotificationTypeTypeTransformer._();

  const Model36EnumsNotificationTypeTypeTransformer._();

  String encode(Model36EnumsNotificationType data) => data.value;

  /// Decodes a [dynamic value][data] to a Model36EnumsNotificationType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  Model36EnumsNotificationType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ZAP_NOW':
          return Model36EnumsNotificationType.ZAP_NOW;
        case r'FRIEND_REQUEST':
          return Model36EnumsNotificationType.FRIEND_REQUEST;
        case r'NEW_DAILY_ZAP':
          return Model36EnumsNotificationType.NEW_DAILY_ZAP;
        case r'NEW_REACTION':
          return Model36EnumsNotificationType.NEW_REACTION;
        case r'NEW_COMMENT':
          return Model36EnumsNotificationType.NEW_COMMENT;
        case r'TAGGED':
          return Model36EnumsNotificationType.TAGGED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [Model36EnumsNotificationTypeTypeTransformer] instance.
  static Model36EnumsNotificationTypeTypeTransformer? _instance;
}
