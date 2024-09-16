# dailyzap_api.api.ReactionsApi

## Load the API package
```dart
import 'package:dailyzap_api/api.dart';
```

All URIs are relative to *http://192.168.113.54*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteReaction**](ReactionsApi.md#deletereaction) | **DELETE** /v1/reactions/{id} | 
[**getProfilePicture**](ReactionsApi.md#getprofilepicture) | **GET** /v1/reactions/{id}/picture | 


# **deleteReaction**
> deleteReaction(id)



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ReactionsApi();
final id = id_example; // String | 

try {
    api_instance.deleteReaction(id);
} catch (e) {
    print('Exception when calling ReactionsApi->deleteReaction: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

final api_instance = ReactionsApi();
final id = id_example; // String | 

try {
    final result = api_instance.getProfilePicture(id);
    print(result);
} catch (e) {
    print('Exception when calling ReactionsApi->getProfilePicture: $e\n');
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

