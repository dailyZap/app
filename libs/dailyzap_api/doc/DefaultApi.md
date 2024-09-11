# dailyzap_api.api.DefaultApi

## Load the API package
```dart
import 'package:dailyzap_api/api.dart';
```

All URIs are relative to *http://192.168.114.17*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkInvite**](DefaultApi.md#checkinvite) | **GET** /v1/auth/invite/{code} | 
[**createUser**](DefaultApi.md#createuser) | **POST** /users | 
[**getUserByHandle**](DefaultApi.md#getuserbyhandle) | **GET** /users | 
[**getUserById**](DefaultApi.md#getuserbyid) | **GET** /users/{id} | 
[**register**](DefaultApi.md#register) | **PUT** /v1/auth/register | 


# **checkInvite**
> checkInvite(code)



### Example
```dart
import 'package:dailyzap_api/api.dart';

final api_instance = DefaultApi();
final code = code_example; // String | 

try {
    api_instance.checkInvite(code);
} catch (e) {
    print('Exception when calling DefaultApi->checkInvite: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createUser**
> createUser(userCreationParams)



### Example
```dart
import 'package:dailyzap_api/api.dart';

final api_instance = DefaultApi();
final userCreationParams = UserCreationParams(); // UserCreationParams | 

try {
    api_instance.createUser(userCreationParams);
} catch (e) {
    print('Exception when calling DefaultApi->createUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userCreationParams** | [**UserCreationParams**](UserCreationParams.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserByHandle**
> List<UserGetParams> getUserByHandle(handle)



### Example
```dart
import 'package:dailyzap_api/api.dart';

final api_instance = DefaultApi();
final handle = handle_example; // String | 

try {
    final result = api_instance.getUserByHandle(handle);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getUserByHandle: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **handle** | **String**|  | [optional] 

### Return type

[**List<UserGetParams>**](UserGetParams.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserById**
> UserGetParams getUserById(id)



### Example
```dart
import 'package:dailyzap_api/api.dart';

final api_instance = DefaultApi();
final id = id_example; // String | 

try {
    final result = api_instance.getUserById(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->getUserById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**UserGetParams**](UserGetParams.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **register**
> register()



### Example
```dart
import 'package:dailyzap_api/api.dart';

final api_instance = DefaultApi();

try {
    api_instance.register();
} catch (e) {
    print('Exception when calling DefaultApi->register: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

