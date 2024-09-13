//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ZapImageType {
  /// Instantiate a new enum with the provided [value].
  const ZapImageType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const front = ZapImageType._(r'front');
  static const back = ZapImageType._(r'back');

  /// List of all possible values in this [enum][ZapImageType].
  static const values = <ZapImageType>[
    front,
    back,
  ];

  static ZapImageType? fromJson(dynamic value) =>
      ZapImageTypeTypeTransformer().decode(value);

  static List<ZapImageType> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ZapImageType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ZapImageType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ZapImageType] to String,
/// and [decode] dynamic data back to [ZapImageType].
class ZapImageTypeTypeTransformer {
  factory ZapImageTypeTypeTransformer() =>
      _instance ??= const ZapImageTypeTypeTransformer._();

  const ZapImageTypeTypeTransformer._();

  String encode(ZapImageType data) => data.value;

  /// Decodes a [dynamic value][data] to a ZapImageType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ZapImageType? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'front':
          return ZapImageType.front;
        case r'back':
          return ZapImageType.back;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ZapImageTypeTypeTransformer] instance.
  static ZapImageTypeTypeTransformer? _instance;
}
