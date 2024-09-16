# dailyzap_api.api.FeedApi

## Load the API package
```dart
import 'package:dailyzap_api/api.dart';
```

All URIs are relative to *http://192.168.113.54*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getFeed**](FeedApi.md#getfeed) | **GET** /v1/feed | 


# **getFeed**
> Feed getFeed()



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FeedApi();

try {
    final result = api_instance.getFeed();
    print(result);
} catch (e) {
    print('Exception when calling FeedApi->getFeed: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Feed**](Feed.md)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

