# dailyzap_api.api.AuthApi

## Load the API package
```dart
import 'package:dailyzap_api/api.dart';
```

All URIs are relative to *http://192.168.114.17*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkInvite**](AuthApi.md#checkinvite) | **GET** /v1/auth/invite/{code} | 
[**login**](AuthApi.md#login) | **POST** /v1/auth/login | 
[**register**](AuthApi.md#register) | **PUT** /v1/auth/register | 
[**twoFa**](AuthApi.md#twofa) | **POST** /v1/auth/twoFa | 


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
> LoginReturnParams login(userLoginParams)



### Example
```dart
import 'package:dailyzap_api/api.dart';

final api_instance = AuthApi();
final userLoginParams = UserLoginParams(); // UserLoginParams | 

try {
    final result = api_instance.login(userLoginParams);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->login: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userLoginParams** | [**UserLoginParams**](UserLoginParams.md)|  | 

### Return type

[**LoginReturnParams**](LoginReturnParams.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **register**
> RegisterReturnParams register(userCreationParams)



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

[**RegisterReturnParams**](RegisterReturnParams.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **twoFa**
> TwoFaReturnParams twoFa(userTwoFaParams)



### Example
```dart
import 'package:dailyzap_api/api.dart';

final api_instance = AuthApi();
final userTwoFaParams = UserTwoFaParams(); // UserTwoFaParams | 

try {
    final result = api_instance.twoFa(userTwoFaParams);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->twoFa: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userTwoFaParams** | [**UserTwoFaParams**](UserTwoFaParams.md)|  | 

### Return type

[**TwoFaReturnParams**](TwoFaReturnParams.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

