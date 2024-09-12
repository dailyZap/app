# dailyzap_api.api.ProfileApi

## Load the API package
```dart
import 'package:dailyzap_api/api.dart';
```

All URIs are relative to *http://192.168.114.17*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getProfile**](ProfileApi.md#getprofile) | **GET** /v1/profile | 
[**setProfilePicture**](ProfileApi.md#setprofilepicture) | **PUT** /v1/profile/picture | 


# **getProfile**
> ProfileResponseProps getProfile()



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ProfileApi();

try {
    final result = api_instance.getProfile();
    print(result);
} catch (e) {
    print('Exception when calling ProfileApi->getProfile: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ProfileResponseProps**](ProfileResponseProps.md)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setProfilePicture**
> PictureResponseProps setProfilePicture()



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ProfileApi();

try {
    final result = api_instance.setProfilePicture();
    print(result);
} catch (e) {
    print('Exception when calling ProfileApi->setProfilePicture: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**PictureResponseProps**](PictureResponseProps.md)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

