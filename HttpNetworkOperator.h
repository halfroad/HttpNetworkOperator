//
//  HttpNetworkOperator.h
//  HttpNetworkOperator
//
//  Created by Li Jinhui on Nov/14/16.
//  Copyright © 2016 Half Road Software Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HTTP_METHOD_POST    @"POST"
#define HTTP_METHOD_GET     @"GET"

@interface HttpNetworkOperator : NSObject

+ (instancetype) sharedInstance;

@end

@interface HttpURLNetworkOperator : HttpNetworkOperator

/*!
 @method request:
 @abstract                      Sends the HTTP GET request via URL....
 @discussion                    This method is designated to send the HTTP GET request via the specific URL.                   This is the designated method to send the HTTP request with specific parameters.
 @param URL                     The URL for the request.
 @param onReceivedChallenge     Event when an authentication is initiated.
 @param onReceiveData           Event when receiving a data block of bytes.
 @param onResponseReceived       Event when a HTTP Response is returned.
 */

- (void) request: (NSURL *) URL OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived;

/*!
 @method request:
 @abstract                      Sends the HTTP GET request via URL....
 @discussion                    This method is designated to send the HTTP GET request via the specific URL.                   This is the designated method to send the HTTP request with specific parameters.
 @param URL                     The URL for the request.
 @param onReceivedChallenge     Event when an authentication is initiated.
 @param completionHandler       Event when a HTTP Request is completed. Note, this callback only be triggered when asynchronous is YES
 */

- (void) request: (NSURL *) URL OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler;

/*!
 @method request:
 @abstract                      Sends the HTTP GET request via URL....
 @discussion                    This method is designated to send the HTTP GET request via the specific URL.                   This is the designated method to send the HTTP request with specific parameters.
 @param URL                     The URL for the request.
 @param asynchronous            Sends the request asynchronously.
 @param onReceivedChallenge     Event when an authentication is initiated.
 @param onReceiveData           Event when receiving a data block of bytes.
 @param onResponseReceived       Event when a HTTP Response is returned.
 @param completionHandler       Event when a HTTP Request is completed. Note, this callback only be triggered when asynchronous is YES
 */

- (void) request: (NSURL *) URL Asynchronous: (BOOL) asynchronous OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler;

@end

@interface HttpRequestNetworkOperator : HttpNetworkOperator

/*!
 @method                        request:
 @abstract                      Send the HTTP request with all the customized parameters.
 @discussion                    This is the designated method to send the HTTP request with all the customized parameters. This is the underlay method.
 @param URL                     The URL for the request.
 @param HTTPMethod              Request Method, GET/POST/PUT/DELETE/UPLOAD, etc. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html for more.
 @param allHTTPHeaderFields     NSDictionary of HTTP header fields. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html for details.
 @param HTTPBody                Body of HTTP request, contains the raw data of the data will be sent to the host. This data is sent as the message body of the request, as
 in done in an HTTP POST request.
 @param onReceivedChallenge     Event when an authentication is initiated.
 @param onReceiveData           Event when receiving a data block of bytes.
 @param onResponseReceived       Event when a HTTP Response is returned.
 
 */

//  @result Return Value of the method.

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived;
/*!
 @method                        request:
 @abstract                      Send the HTTP request with all the customized parameters.
 @discussion                    This is the designated method to send the HTTP request with all the customized parameters. This is the underlay method.
 @param URL                     The URL for the request.
 @param HTTPMethod              Request Method, GET/POST/PUT/DELETE/UPLOAD, etc. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html for more.
 @param allHTTPHeaderFields     NSDictionary of HTTP header fields. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html for details.
 @param HTTPBody                Body of HTTP request, contains the raw data of the data will be sent to the host. This data is sent as the message body of the request, as
 in done in an HTTP POST request.
 @param onReceivedChallenge     Event when an authentication is initiated.
 @param completionHandler       Event when a HTTP Request is completed. Note, this callback only be triggered when asynchronous is YES
 */

//  @result Return Value of the method.

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler;

/*!
 @method                        request:
 @abstract                      Send the HTTP request with all the customized parameters.
 @discussion                    This is the designated method to send the HTTP request with all the customized parameters. This is the underlay method.
 @param URL                     The URL for the request.
 @param HTTPMethod              Request Method, GET/POST/PUT/DELETE/UPLOAD, etc. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html for more.
 @param allHTTPHeaderFields     NSDictionary of HTTP header fields. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html for details.
 @param HTTPBody                Body of HTTP request, contains the raw data of the data will be sent to the host. This data is sent as the message body of the request, as
 in done in an HTTP POST request.
 @param asynchronous            Sends the request asynchronously.
 @param onReceivedChallenge     Event when an authentication is initiated.
 @param onReceiveData           Event when receiving a data block of bytes.
 @param onResponseReceived       Event when a HTTP Response is returned.
 @param completionHandler       Event when a HTTP Request is completed. Note, this callback only be triggered when asynchronous is YES
 */

//  @result Return Value of the method.

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody Asynchronous: (BOOL) asynchronous OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler;

/*!
 @method                        request:
 @abstract                      Send the HTTP request with all the customized parameters.
 @discussion                    This is the designated method to send the HTTP request with all the customized parameters. This is the underlay method.
 @param URL                     The URL for the request.
 @param HTTPMethod              Request Method, GET/POST/PUT/DELETE/UPLOAD, etc. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html for more.
 @param cachePolicy             Item of NSURLRequestCachePolicy.
 @param allHTTPHeaderFields     NSDictionary of HTTP header fields. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html for details.
 @param HTTPBody                Body of HTTP request, contains the raw data of the data will be sent to the host. This data is sent as the message body of the request, as
 in done in an HTTP POST request.
 @param asynchronous            Sends the request asynchronously.
 @param onReceivedChallenge     Event when an authentication is initiated.
 @param onReceiveData           Event when receiving a data block of bytes.
 @param onResponseReceived       Event when a HTTP Response is returned.
 @param completionHandler       Event when a HTTP Request is completed. Note, this callback only be triggered when asynchronous is YES
 */

//  @result Return Value of the method.

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod CachePolicy: (NSURLRequestCachePolicy) cachePolicy AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody Asynchronous: (BOOL) asynchronous OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler;

/*!
 @method                        request:
 @abstract                      Send the HTTP request with all the customized parameters.
 @discussion                    This is the designated method to send the HTTP request with all the customized parameters. This is the underlay method.
 @param URL                     The URL for the request.
 @param HTTPMethod              Request Method, GET/POST/PUT/DELETE/UPLOAD, etc. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html for more.
 @param cachePolicy             Item of NSURLRequestCachePolicy.
 @param allHTTPHeaderFields     NSDictionary of HTTP header fields. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html for details.
 @param HTTPBody                Body of HTTP request, contains the raw data of the data will be sent to the host. This data is sent as the message body of the request, as
 in done in an HTTP POST request.
 @param HTTPBodyStream          The provided stream should be unopened; the request will take
 over the stream's delegate.  The entire stream's contents will be
 transmitted as the HTTP body of the request.  Note that the body stream
 and the body data (set by setHTTPBody:, above) are mutually exclusive
 - setting one will clear the other. .
 @param asynchronous            Sends the request asynchronously.
 @param onReceivedChallenge     Event when an authentication is initiated.
 @param onReceiveData           Event when receiving a data block of bytes.
 @param onResponseReceived       Event when a HTTP Response is returned.
 @param completionHandler       Event when a HTTP Request is completed. Note, this callback only be triggered when asynchronous is YES
 */

//  @result Return Value of the method.

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod CachePolicy: (NSURLRequestCachePolicy) cachePolicy AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody HTTPBodyStream: (NSInputStream *) HTTPBodyStream Asynchronous: (BOOL) asynchronous OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler;

/*!
 @method                        request:
 @abstract                      Send the HTTP request with all the customized parameters.
 @discussion                    This is the designated method to send the HTTP request with all the customized parameters. This is the underlay method.
 @param URL                     The URL for the request.
 @param HTTPMethod              Request Method, GET/POST/PUT/DELETE/UPLOAD, etc. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html for more.
 @param cachePolicy             Item of NSURLRequestCachePolicy.
 @param timeoutInterval         Sencods of the timeout interval.
 @param allHTTPHeaderFields     NSDictionary of HTTP header fields. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html for details.
 @param HTTPBody                Body of HTTP request, contains the raw data of the data will be sent to the host. This data is sent as the message body of the request, as
 in done in an HTTP POST request.
 @param HTTPBodyStream          The provided stream should be unopened; the request will take
 over the stream's delegate.  The entire stream's contents will be
 transmitted as the HTTP body of the request.  Note that the body stream
 and the body data (set by setHTTPBody:, above) are mutually exclusive
 - setting one will clear the other. .
 @param HTTPShouldUsePipelining Sets whether the request should not wait for the previous response
 before transmitting.
 @param asynchronous            Sends the request asynchronously.
 @param onReceivedChallenge     Event when an authentication is initiated.
 @param onReceiveData           Event when receiving a data block of bytes.
 @param onResponseReceived       Event when a HTTP Response is returned.
 @param completionHandler       Event when a HTTP Request is completed. Note, this callback only be triggered when asynchronous is YES
 */

//  @result Return Value of the method.

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod CachePolicy: (NSURLRequestCachePolicy) cachePolicy AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody HTTPBodyStream: (NSInputStream *) HTTPBodyStream HTTPShouldUsePipelining: (BOOL) HTTPShouldUsePipelining Asynchronous: (BOOL) asynchronous OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler;

/*!
 @method                        request:
 @abstract                      Send the HTTP request with all the customized parameters.
 @discussion                    This is the designated method to send the HTTP request with all the customized parameters. This is the underlay method.
 @param URL                     The URL for the request.
 @param HTTPMethod              Request Method, GET/POST/PUT/DELETE/UPLOAD, etc. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html for more.
 @param cachePolicy             Item of NSURLRequestCachePolicy.
 @param timeoutInterval         Sencods of the timeout interval.
 @param allHTTPHeaderFields     NSDictionary of HTTP header fields. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html for details.
 @param HTTPBody                Body of HTTP request, contains the raw data of the data will be sent to the host. This data is sent as the message body of the request, as
 in done in an HTTP POST request.
 @param HTTPBodyStream          The provided stream should be unopened; the request will take
 over the stream's delegate.  The entire stream's contents will be
 transmitted as the HTTP body of the request.  Note that the body stream
 and the body data (set by setHTTPBody:, above) are mutually exclusive
 - setting one will clear the other. .
 @param HTTPShouldHandleCookies YES if cookies should be sent with and set for this request.
 @param HTTPShouldUsePipelining Sets whether the request should not wait for the previous response
 before transmitting.
 @param asynchronous            Sends the request asynchronously.
 @param onReceivedChallenge     Event when an authentication is initiated.
 @param onReceiveData           Event when receiving a data block of bytes.
 @param onResponseReceived       Event when a HTTP Response is returned.
 @param completionHandler       Event when a HTTP Request is completed. Note, this callback only be triggered when asynchronous is YES
 */

//  @result Return Value of the method.

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod CachePolicy: (NSURLRequestCachePolicy) cachePolicy AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody HTTPBodyStream: (NSInputStream *) HTTPBodyStream HTTPShouldHandleCookies: (BOOL) HTTPShouldHandleCookies HTTPShouldUsePipelining: (BOOL) HTTPShouldUsePipelining Asynchronous: (BOOL) asynchronous OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler;

/*!
 @method                        request:
 @abstract                      Send the HTTP request with all the customized parameters.
 @discussion                    This is the designated method to send the HTTP request with all the customized parameters. This is the underlay method.
 @param URL                     The URL for the request.
 @param HTTPMethod              Request Method, GET/POST/PUT/DELETE/UPLOAD, etc. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html for more.
 @param cachePolicy             Item of NSURLRequestCachePolicy.
 @param timeoutInterval         Sencods of the timeout interval.
 @param allHTTPHeaderFields     NSDictionary of HTTP header fields. See https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html for details.
 @param HTTPBody                Body of HTTP request, contains the raw data of the data will be sent to the host. This data is sent as the message body of the request, as
 in done in an HTTP POST request.
 @param HTTPBodyStream          The provided stream should be unopened; the request will take
 over the stream's delegate.  The entire stream's contents will be
 transmitted as the HTTP body of the request.  Note that the body stream
 and the body data (set by setHTTPBody:, above) are mutually exclusive
 - setting one will clear the other. .
 @param HTTPShouldHandleCookies YES if cookies should be sent with and set for this request.
 @param HTTPShouldUsePipelining Sets whether the request should not wait for the previous response
 before transmitting.
 @param asynchronous            Sends the request asynchronously.
 @param onReceivedChallenge     Event when an authentication is initiated.
 @param onReceiveData           Event when receiving a data block of bytes.
 @param onResponseReceived       Event when a HTTP Response is returned.
 @param completionHandler       Event when a HTTP Request is completed. Note, this callback only be triggered when asynchronous is YES
 */

//  @result Return Value of the method.

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod CachePolicy: (NSURLRequestCachePolicy) cachePolicy TimeoutInterval: (NSTimeInterval) timeoutInterval AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody HTTPBodyStream: (NSInputStream *) HTTPBodyStream HTTPShouldHandleCookies: (BOOL) HTTPShouldHandleCookies HTTPShouldUsePipelining: (BOOL) HTTPShouldUsePipelining Asynchronous: (BOOL) asynchronous OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler;
@end
