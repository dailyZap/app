# dailyzap_api.api.UsersApi

## Load the API package
```dart
import 'package:dailyzap_api/api.dart';
```

All URIs are relative to *http://192.168.114.17*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getUserByHandle**](UsersApi.md#getuserbyhandle) | **GET** /users | 
[**getUserById**](UsersApi.md#getuserbyid) | **GET** /users/{id} | 


# **getUserByHandle**
> List<UserGetParams> getUserByHandle(handle)



### Example
```dart
import 'package:dailyzap_api/api.dart';

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

[**UserGetParams**](UserGetParams.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

