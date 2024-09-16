//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/auth_api.dart';
part 'api/feed_api.dart';
part 'api/friends_api.dart';
part 'api/info_api.dart';
part 'api/notifications_api.dart';
part 'api/profile_api.dart';
part 'api/reactions_api.dart';
part 'api/users_api.dart';
part 'api/zaps_api.dart';

part 'model/comment.dart';
part 'model/content.dart';
part 'model/feed.dart';
part 'model/feed_friend.dart';
part 'model/friend_requests.dart';
part 'model/friends.dart';
part 'model/login_params.dart';
part 'model/login_token.dart';
part 'model/notification.dart';
part 'model/notification_type.dart';
part 'model/notifications.dart';
part 'model/otp_params.dart';
part 'model/profile.dart';
part 'model/profile_picture_upload_info.dart';
part 'model/reaction.dart';
part 'model/reaction_type.dart';
part 'model/region.dart';
part 'model/region_update.dart';
part 'model/register409_response.dart';
part 'model/register500_response.dart';
part 'model/repost_zap403_response.dart';
part 'model/server_info.dart';
part 'model/session.dart';
part 'model/user.dart';
part 'model/user_creation_params.dart';
part 'model/user_unique_fields.dart';
part 'model/zap.dart';
part 'model/zap_creation_params.dart';
part 'model/zap_image_type.dart';
part 'model/zap_upload_info.dart';

/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) =>
    pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
