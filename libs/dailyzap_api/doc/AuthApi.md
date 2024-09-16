# dailyzap_api.api.AuthApi

## Load the API package
```dart
import 'package:dailyzap_api/api.dart';
```

All URIs are relative to *http://192.168.113.54*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkInvite**](AuthApi.md#checkinvite) | **GET** /v1/auth/invite/{code} | 
[**login**](AuthApi.md#login) | **POST** /v1/auth/login | 
[**otp**](AuthApi.md#otp) | **POST** /v1/auth/otp | 
[**register**](AuthApi.md#register) | **PUT** /v1/auth/register | 


# **checkInvite**
> checkInvite(code)



### Example
```dart
import 'package:dailyzap_api/api.dart';

final api_instance = AuthApi();
final code = code_example; // String | 

try {
    api_instance.checkInvite(code);
} catch (e) {
    print('Exception when calling AuthApi->checkInvite: $e\n');
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

# **login**
> LoginToken login(loginParams)



### Example
```dart
import 'package:dailyzap_api/api.dart';

final api_instance = AuthApi();
final loginParams = LoginParams(); // LoginParams | 

try {
    final result = api_instance.login(loginParams);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->login: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginParams** | [**LoginParams**](LoginParams.md)|  | 

### Return type

[**LoginToken**](LoginToken.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **otp**
> Session otp(oTPParams)



### Example
```dart
import 'package:dailyzap_api/api.dart';

final api_instance = AuthApi();
final oTPParams = OTPParams(); // OTPParams | 

try {
    final result = api_instance.otp(oTPParams);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->otp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oTPParams** | [**OTPParams**](OTPParams.md)|  | 

### Return type

[**Session**](Session.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **register**
> LoginToken register(userCreationParams)



### Example
```dart
import 'package:dailyzap_api/api.dart';

final api_instance = AuthApi();
final userCreationParams = UserCreationParams(); // UserCreationParams | 

try {
    final result = api_instance.register(userCreationParams);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->register: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userCreationParams** | [**UserCreationParams**](UserCreationParams.md)|  | 

### Return type

[**LoginToken**](LoginToken.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

