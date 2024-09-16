//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Region {
  /// Instantiate a new enum with the provided [value].
  const Region._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const EU = Region._(r'EU');
  static const US = Region._(r'US');
  static const WA = Region._(r'WA');
  static const EA = Region._(r'EA');

  /// List of all possible values in this [enum][Region].
  static const values = <Region>[
    EU,
    US,
    WA,
    EA,
  ];

  static Region? fromJson(dynamic value) =>
      RegionTypeTransformer().decode(value);

  static List<Region> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Region>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Region.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [Region] to String,
/// and [decode] dynamic data back to [Region].
class RegionTypeTransformer {
  factory RegionTypeTransformer() =>
      _instance ??= const RegionTypeTransformer._();

  const RegionTypeTransformer._();

  String encode(Region data) => data.value;

  /// Decodes a [dynamic value][data] to a Region.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  Region? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'EU':
          return Region.EU;
        case r'US':
          return Region.US;
        case r'WA':
          return Region.WA;
        case r'EA':
          return Region.EA;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [RegionTypeTransformer] instance.
  static RegionTypeTransformer? _instance;
}
