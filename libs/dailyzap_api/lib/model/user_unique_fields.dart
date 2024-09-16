//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserUniqueFields {
  /// Instantiate a new enum with the provided [value].
  const UserUniqueFields._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const handle = UserUniqueFields._(r'handle');
  static const email = UserUniqueFields._(r'email');

  /// List of all possible values in this [enum][UserUniqueFields].
  static const values = <UserUniqueFields>[
    handle,
    email,
  ];

  static UserUniqueFields? fromJson(dynamic value) =>
      UserUniqueFieldsTypeTransformer().decode(value);

  static List<UserUniqueFields> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UserUniqueFields>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserUniqueFields.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UserUniqueFields] to String,
/// and [decode] dynamic data back to [UserUniqueFields].
class UserUniqueFieldsTypeTransformer {
  factory UserUniqueFieldsTypeTransformer() =>
      _instance ??= const UserUniqueFieldsTypeTransformer._();

  const UserUniqueFieldsTypeTransformer._();

  String encode(UserUniqueFields data) => data.value;

  /// Decodes a [dynamic value][data] to a UserUniqueFields.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserUniqueFields? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'handle':
          return UserUniqueFields.handle;
        case r'email':
          return UserUniqueFields.email;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UserUniqueFieldsTypeTransformer] instance.
  static UserUniqueFieldsTypeTransformer? _instance;
}
