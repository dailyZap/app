# dailyzap_api.api.ZapsApi

## Load the API package
```dart
import 'package:dailyzap_api/api.dart';
```

All URIs are relative to *http://192.168.114.17*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createZap**](ZapsApi.md#createzap) | **PUT** /v1/zaps | 
[**setZapUploaded**](ZapsApi.md#setzapuploaded) | **PUT** /v1/zaps/{zapId}/uploaded | 


# **createZap**
> ZapResponseProps createZap(zapCreationParams)



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ZapsApi();
final zapCreationParams = ZapCreationParams(); // ZapCreationParams | 

try {
    final result = api_instance.createZap(zapCreationParams);
    print(result);
} catch (e) {
    print('Exception when calling ZapsApi->createZap: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **zapCreationParams** | [**ZapCreationParams**](ZapCreationParams.md)|  | 

### Return type

[**ZapResponseProps**](ZapResponseProps.md)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setZapUploaded**
> setZapUploaded(zapId)



### Example
```dart
import 'package:dailyzap_api/api.dart';
// TODO Configure HTTP Bearer authorization: sessionToken
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('sessionToken').setAccessToken(yourTokenGeneratorFunction);

final api_instance = ZapsApi();
final zapId = zapId_example; // String | 

try {
    api_instance.setZapUploaded(zapId);
} catch (e) {
    print('Exception when calling ZapsApi->setZapUploaded: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **zapId** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[sessionToken](../README.md#sessionToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

