//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UniqueFields {
  /// Instantiate a new enum with the provided [value].
  const UniqueFields._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const handle = UniqueFields._(r'handle');
  static const email = UniqueFields._(r'email');

  /// List of all possible values in this [enum][UniqueFields].
  static const values = <UniqueFields>[
    handle,
    email,
  ];

  static UniqueFields? fromJson(dynamic value) =>
      UniqueFieldsTypeTransformer().decode(value);

  static List<UniqueFields> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UniqueFields>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UniqueFields.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UniqueFields] to String,
/// and [decode] dynamic data back to [UniqueFields].
class UniqueFieldsTypeTransformer {
  factory UniqueFieldsTypeTransformer() =>
      _instance ??= const UniqueFieldsTypeTransformer._();

  const UniqueFieldsTypeTransformer._();

  String encode(UniqueFields data) => data.value;

  /// Decodes a [dynamic value][data] to a UniqueFields.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UniqueFields? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'handle':
          return UniqueFields.handle;
        case r'email':
          return UniqueFields.email;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UniqueFieldsTypeTransformer] instance.
  static UniqueFieldsTypeTransformer? _instance;
}
