# dailyzap_api.api.InfoApi

## Load the API package
```dart
import 'package:dailyzap_api/api.dart';
```

All URIs are relative to *http://192.168.113.54*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getServerInfo**](InfoApi.md#getserverinfo) | **GET** /v1/info | 


# **getServerInfo**
> ServerInfo getServerInfo()



### Example
```dart
import 'package:dailyzap_api/api.dart';

final api_instance = InfoApi();

try {
    final result = api_instance.getServerInfo();
    print(result);
} catch (e) {
    print('Exception when calling InfoApi->getServerInfo: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ServerInfo**](ServerInfo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

