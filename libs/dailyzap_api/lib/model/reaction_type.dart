//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ReactionType {
  /// Instantiate a new enum with the provided [value].
  const ReactionType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const THUMBS_UP = ReactionType._(r'THUMBS_UP');
  static const GRINNING_FACE_WITH_BIG_EYES =
      ReactionType._(r'GRINNING_FACE_WITH_BIG_EYES');
  static const ASTONISHED_FACE = ReactionType._(r'ASTONISHED_FACE');
  static const FACE_WITH_TEARS_OF_JOY =
      ReactionType._(r'FACE_WITH_TEARS_OF_JOY');
  static const SMILING_FACE_WITH_HEART_EYES =
      ReactionType._(r'SMILING_FACE_WITH_HEART_EYES');
  static const HIGH_VOLTAGE = ReactionType._(r'HIGH_VOLTAGE');

  /// List of all possible values in this [enum][ReactionType].
  static const values = <ReactionType>[
    THUMBS_UP,
    GRINNING_FACE_WITH_BIG_EYES,
    ASTONISHED_FACE,
    FACE_WITH_TEARS_OF_JOY,
    SMILING_FACE_WITH_HEART_EYES,
    HIGH_VOLTAGE,
  ];

  static ReactionType? fromJson(dynamic value) =>
      ReactionTypeTypeTransformer().decode(value);

  static List<ReactionType> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ReactionType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ReactionType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ReactionType] to String,
/// and [decode] dynamic data back to [ReactionType].
class ReactionTypeTypeTransformer {
  factory ReactionTypeTypeTransformer() =>
      _instance ??= const ReactionTypeTypeTransformer._();

  const ReactionTypeTypeTransformer._();

  String encode(ReactionType data) => data.value;

  /// Decodes a [dynamic value][data] to a ReactionType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ReactionType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'THUMBS_UP':
          return ReactionType.THUMBS_UP;
        case r'GRINNING_FACE_WITH_BIG_EYES':
          return ReactionType.GRINNING_FACE_WITH_BIG_EYES;
        case r'ASTONISHED_FACE':
          return ReactionType.ASTONISHED_FACE;
        case r'FACE_WITH_TEARS_OF_JOY':
          return ReactionType.FACE_WITH_TEARS_OF_JOY;
        case r'SMILING_FACE_WITH_HEART_EYES':
          return ReactionType.SMILING_FACE_WITH_HEART_EYES;
        case r'HIGH_VOLTAGE':
          return ReactionType.HIGH_VOLTAGE;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ReactionTypeTypeTransformer] instance.
  static ReactionTypeTypeTransformer? _instance;
}
