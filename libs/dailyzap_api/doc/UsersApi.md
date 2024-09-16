# dailyzap_api.api.UsersApi

## Load the API package
```dart
import 'package:dailyzap_api/api.dart';
```

All URIs are relative to *http://192.168.113.54*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getProfilePicture**](UsersApi.md#getprofilepicture) | **GET** /v1/users/{id}/profile/picture | 
[**getUserByHandle**](UsersApi.md#getuserbyhandle) | **GET** /v1/users | 
[**getUserById**](UsersApi.md#getuserbyid) | **GET** /v1/users/{id} | 


# **getProfilePicture**
> String getProfilePicture(id)



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final id = id_example; // String | 

try {
    final result = api_instance.getProfilePicture(id);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->getProfilePicture: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

**String**

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/*, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserByHandle**
> List<User> getUserByHandle(handle)



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final handle = handle_example; // String | 

try {
    final result = api_instance.getUserByHandle(handle);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->getUserByHandle: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **handle** | **String**|  | [optional] 

### Return type

[**List<User>**](User.md)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserById**
> User getUserById(id)



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UsersApi();
final id = id_example; // String | 

try {
    final result = api_instance.getUserById(id);
    print(result);
} catch (e) {
    print('Exception when calling UsersApi->getUserById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**User**](User.md)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

