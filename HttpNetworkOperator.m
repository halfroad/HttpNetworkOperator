//
//  HttpNetworkOperator.h
//  HttpNetworkOperator
//
//  Created by Li Jinhui on Nov/14/16.
//  Copyright © 2016 Half Road Software Co., Ltd. All rights reserved.
//

#import "HttpNetworkOperator.h"

#define DEFAULT_TIMEOUT_INTERVAL_FOR_REQUEST        60.0
#define DEFAULT_TIMEOUT_INTERVAL_FOR_RESOURCE       7 * 24 * 60 * 60.0
#define DEFAULT_HTTP_MAXIMUM_CONNECTIONS_PER_HOST   4

typedef NS_ENUM (NSUInteger, SessionConfigurationTypes)
{
    SessionConfigurationTypeDefault     ,
    SessionConfigurationTypeEphemeral   ,
    SessionConfigurationTypeBackground  ,
};

@implementation HttpNetworkOperator

+ (instancetype) sharedInstance
{
    static id instance;
    static dispatch_once_t once;
    
    dispatch_once (&once, ^ {
        
        instance = [[self alloc] init];
        
    });
    
    return instance;
}

@end


@interface HttpNetworkSessionOperator : NSObject <NSURLSessionTaskDelegate>

@end

@implementation HttpNetworkSessionOperator

#pragma mark -- Helpers

+ (instancetype) sharedInstance
{
    static id instance;
    static dispatch_once_t once;
    
    dispatch_once (&once, ^ {
        
        instance = [[self alloc] init];
        
    });
    
    return instance;
}

- (NSURLSession *) createSession
{
    return [self createSession: SessionConfigurationTypeDefault Delegate: nil];
}

- (NSURLSession *) createSession: (id <NSURLSessionTaskDelegate>) delegate
{
    return [self createSession: SessionConfigurationTypeDefault Delegate: delegate];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType Delegate: (id <NSURLSessionTaskDelegate>) delegate
{
    return [self createSession: configurationType HTTPAdditionalHeaders: nil Delegate: delegate];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders Delegate: (id <NSURLSessionTaskDelegate>) delegate
{
    return [self createSession: configurationType HTTPAdditionalHeaders: HTTPAdditionalHeaders Delegate: delegate DelegateQueue: NSOperationQueue.mainQueue];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders Delegate: (id <NSURLSessionTaskDelegate>) delegate DelegateQueue: (NSOperationQueue *) delegateQueue
{
    return [self createSession: configurationType URLCredentialStorage: nil HTTPAdditionalHeaders: HTTPAdditionalHeaders Delegate: delegate DelegateQueue: delegateQueue];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType URLCredentialStorage: (NSURLCredentialStorage *) URLCredentialStorage HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders  Delegate: (id <NSURLSessionTaskDelegate>) delegate DelegateQueue: (NSOperationQueue *) delegateQueue
{
    return [self createSession: configurationType URLCredentialStorage: URLCredentialStorage HTTPCookieStorage: [NSHTTPCookieStorage sharedHTTPCookieStorage] HTTPAdditionalHeaders: HTTPAdditionalHeaders Delegate: delegate DelegateQueue: delegateQueue];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType URLCredentialStorage: (NSURLCredentialStorage *) URLCredentialStorage HTTPCookieStorage: (NSHTTPCookieStorage *) HTTPCookieStorage HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders Delegate: (id <NSURLSessionTaskDelegate>) delegate DelegateQueue: (NSOperationQueue *) delegateQueue
{
    return [self createSession: configurationType URLCredentialStorage: URLCredentialStorage HTTPShouldSetCookies: YES HTTPCookieStorage: HTTPCookieStorage HTTPAdditionalHeaders: HTTPAdditionalHeaders Delegate: delegate DelegateQueue: delegateQueue];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType URLCredentialStorage: (NSURLCredentialStorage *) URLCredentialStorage HTTPShouldSetCookies: (BOOL) HTTPShouldSetCookies HTTPCookieStorage: (NSHTTPCookieStorage *) HTTPCookieStorage HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders Delegate: (id <NSURLSessionTaskDelegate>) delegate DelegateQueue: (NSOperationQueue *) delegateQueue
{
    return [self createSession: configurationType URLCredentialStorage: URLCredentialStorage URLCache: [NSURLCache sharedURLCache] HTTPShouldSetCookies: HTTPShouldSetCookies HTTPCookieStorage: HTTPCookieStorage HTTPAdditionalHeaders: HTTPAdditionalHeaders Delegate: delegate DelegateQueue: delegateQueue];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType URLCredentialStorage: (NSURLCredentialStorage *) URLCredentialStorage URLCache: (NSURLCache *) URLCache HTTPShouldSetCookies: (BOOL) HTTPShouldSetCookies HTTPCookieStorage: (NSHTTPCookieStorage *) HTTPCookieStorage HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders Delegate: (id <NSURLSessionTaskDelegate>) delegate DelegateQueue: (NSOperationQueue *) delegateQueue
{
    return [self createSession: configurationType URLCredentialStorage: URLCredentialStorage RequestCachePolicy: NSURLRequestUseProtocolCachePolicy URLCache: URLCache HTTPShouldSetCookies: HTTPShouldSetCookies HTTPCookieStorage: HTTPCookieStorage HTTPAdditionalHeaders: HTTPAdditionalHeaders Delegate: delegate DelegateQueue: delegateQueue];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType URLCredentialStorage: (NSURLCredentialStorage *) URLCredentialStorage RequestCachePolicy: (NSURLRequestCachePolicy) requestCachePolicy URLCache: (NSURLCache *) URLCache HTTPShouldSetCookies: (BOOL) HTTPShouldSetCookies HTTPCookieStorage: (NSHTTPCookieStorage *) HTTPCookieStorage HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders Delegate: (id <NSURLSessionTaskDelegate>) delegate DelegateQueue: (NSOperationQueue *) delegateQueue
{
    return [self createSession: configurationType URLCredentialStorage: URLCredentialStorage RequestCachePolicy: requestCachePolicy URLCache: URLCache HTTPShouldSetCookies: HTTPShouldSetCookies HTTPCookieAcceptPolicy: NSHTTPCookieAcceptPolicyOnlyFromMainDocumentDomain HTTPCookieStorage: HTTPCookieStorage HTTPAdditionalHeaders: HTTPAdditionalHeaders Delegate: delegate DelegateQueue: delegateQueue];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType URLCredentialStorage: (NSURLCredentialStorage *) URLCredentialStorage RequestCachePolicy: (NSURLRequestCachePolicy) requestCachePolicy URLCache: (NSURLCache *) URLCache HTTPShouldSetCookies: (BOOL) HTTPShouldSetCookies HTTPCookieAcceptPolicy: (NSHTTPCookieAcceptPolicy) HTTPCookieAcceptPolicy HTTPCookieStorage: (NSHTTPCookieStorage *) HTTPCookieStorage HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders Delegate: (id <NSURLSessionTaskDelegate>) delegate DelegateQueue: (NSOperationQueue *) delegateQueue
{
    return [self createSession: configurationType URLCredentialStorage: URLCredentialStorage RequestCachePolicy: requestCachePolicy URLCache: URLCache HTTPShouldSetCookies: HTTPShouldSetCookies HTTPCookieAcceptPolicy: HTTPCookieAcceptPolicy HTTPCookieStorage: HTTPCookieStorage HTTPAdditionalHeaders: HTTPAdditionalHeaders HTTPMaximumConnectionsPerHost: DEFAULT_HTTP_MAXIMUM_CONNECTIONS_PER_HOST Delegate: delegate DelegateQueue: delegateQueue];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType URLCredentialStorage: (NSURLCredentialStorage *) URLCredentialStorage RequestCachePolicy: (NSURLRequestCachePolicy) requestCachePolicy URLCache: (NSURLCache *) URLCache HTTPShouldSetCookies: (BOOL) HTTPShouldSetCookies HTTPCookieAcceptPolicy: (NSHTTPCookieAcceptPolicy) HTTPCookieAcceptPolicy HTTPCookieStorage: (NSHTTPCookieStorage *) HTTPCookieStorage HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders HTTPMaximumConnectionsPerHost: (NSInteger) HTTPMaximumConnectionsPerHost Delegate: (id <NSURLSessionTaskDelegate>) delegate DelegateQueue: (NSOperationQueue *) delegateQueue
{
    return [self createSession: configurationType URLCredentialStorage: URLCredentialStorage RequestCachePolicy: requestCachePolicy URLCache: URLCache HTTPShouldSetCookies: HTTPShouldSetCookies HTTPCookieAcceptPolicy: HTTPCookieAcceptPolicy HTTPCookieStorage: HTTPCookieStorage HTTPAdditionalHeaders: HTTPAdditionalHeaders Discretionary: YES SharedContainerIdentifier: nil HTTPMaximumConnectionsPerHost: HTTPMaximumConnectionsPerHost Delegate: delegate DelegateQueue: delegateQueue];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType URLCredentialStorage: (NSURLCredentialStorage *) URLCredentialStorage RequestCachePolicy: (NSURLRequestCachePolicy) requestCachePolicy URLCache: (NSURLCache *) URLCache HTTPShouldSetCookies: (BOOL) HTTPShouldSetCookies HTTPCookieAcceptPolicy: (NSHTTPCookieAcceptPolicy) HTTPCookieAcceptPolicy HTTPCookieStorage: (NSHTTPCookieStorage *) HTTPCookieStorage HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders Discretionary: (BOOL) discretionary HTTPMaximumConnectionsPerHost: (NSInteger) HTTPMaximumConnectionsPerHost Delegate: (id <NSURLSessionTaskDelegate>) delegate DelegateQueue: (NSOperationQueue *) delegateQueue
{
    return [self createSession: configurationType URLCredentialStorage: URLCredentialStorage RequestCachePolicy: requestCachePolicy URLCache: URLCache HTTPShouldSetCookies: HTTPShouldSetCookies HTTPCookieAcceptPolicy: HTTPCookieAcceptPolicy HTTPCookieStorage: HTTPCookieStorage HTTPAdditionalHeaders: HTTPAdditionalHeaders Discretionary: discretionary SharedContainerIdentifier: nil HTTPMaximumConnectionsPerHost: HTTPMaximumConnectionsPerHost Delegate: delegate DelegateQueue: delegateQueue];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType URLCredentialStorage: (NSURLCredentialStorage *) URLCredentialStorage RequestCachePolicy: (NSURLRequestCachePolicy) requestCachePolicy URLCache: (NSURLCache *) URLCache HTTPShouldSetCookies: (BOOL) HTTPShouldSetCookies HTTPCookieAcceptPolicy: (NSHTTPCookieAcceptPolicy) HTTPCookieAcceptPolicy HTTPCookieStorage: (NSHTTPCookieStorage *) HTTPCookieStorage HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders Discretionary: (BOOL) discretionary SharedContainerIdentifier: (NSString *) sharedContainerIdentifier HTTPMaximumConnectionsPerHost: (NSInteger) HTTPMaximumConnectionsPerHost Delegate: (id <NSURLSessionTaskDelegate>) delegate DelegateQueue: (NSOperationQueue *) delegateQueue
{
    return [self createSession: configurationType URLCredentialStorage: URLCredentialStorage RequestCachePolicy: requestCachePolicy URLCache: URLCache HTTPShouldSetCookies: HTTPShouldSetCookies HTTPCookieAcceptPolicy: HTTPCookieAcceptPolicy HTTPCookieStorage: HTTPCookieStorage HTTPAdditionalHeaders: HTTPAdditionalHeaders TimeoutIntervalForResource: DEFAULT_TIMEOUT_INTERVAL_FOR_RESOURCE Discretionary: discretionary SharedContainerIdentifier: sharedContainerIdentifier HTTPMaximumConnectionsPerHost: HTTPMaximumConnectionsPerHost Delegate: delegate DelegateQueue: delegateQueue];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType URLCredentialStorage: (NSURLCredentialStorage *) URLCredentialStorage RequestCachePolicy: (NSURLRequestCachePolicy) requestCachePolicy URLCache: (NSURLCache *) URLCache HTTPShouldSetCookies: (BOOL) HTTPShouldSetCookies HTTPCookieAcceptPolicy: (NSHTTPCookieAcceptPolicy) HTTPCookieAcceptPolicy HTTPCookieStorage: (NSHTTPCookieStorage *) HTTPCookieStorage HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders TimeoutIntervalForResource: (NSTimeInterval) timeoutIntervalForResource Discretionary: (BOOL) discretionary SharedContainerIdentifier: (NSString *) sharedContainerIdentifier HTTPMaximumConnectionsPerHost: (NSInteger) HTTPMaximumConnectionsPerHost Delegate: (id <NSURLSessionTaskDelegate>) delegate DelegateQueue: (NSOperationQueue *) delegateQueue
{
    return [self createSession: configurationType URLCredentialStorage: URLCredentialStorage RequestCachePolicy: requestCachePolicy URLCache: URLCache HTTPShouldSetCookies: HTTPShouldSetCookies HTTPCookieAcceptPolicy: HTTPCookieAcceptPolicy HTTPCookieStorage: HTTPCookieStorage HTTPAdditionalHeaders: HTTPAdditionalHeaders TimeoutIntervalForRequest: DEFAULT_TIMEOUT_INTERVAL_FOR_REQUEST TimeoutIntervalForResource: timeoutIntervalForResource Discretionary: discretionary SharedContainerIdentifier: sharedContainerIdentifier HTTPMaximumConnectionsPerHost: HTTPMaximumConnectionsPerHost Delegate: delegate DelegateQueue: delegateQueue];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType URLCredentialStorage: (NSURLCredentialStorage *) URLCredentialStorage RequestCachePolicy: (NSURLRequestCachePolicy) requestCachePolicy URLCache: (NSURLCache *) URLCache HTTPShouldSetCookies: (BOOL) HTTPShouldSetCookies HTTPCookieAcceptPolicy: (NSHTTPCookieAcceptPolicy) HTTPCookieAcceptPolicy HTTPCookieStorage: (NSHTTPCookieStorage *) HTTPCookieStorage HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders TimeoutIntervalForRequest: (NSTimeInterval) timeoutIntervalForRequest TimeoutIntervalForResource: (NSTimeInterval) timeoutIntervalForResource Discretionary: (BOOL) discretionary SharedContainerIdentifier: (NSString *) sharedContainerIdentifier HTTPMaximumConnectionsPerHost: (NSInteger) HTTPMaximumConnectionsPerHost Delegate: (id <NSURLSessionTaskDelegate>) delegate DelegateQueue: (NSOperationQueue *) delegateQueue
{
    return [self createSession: configurationType ConfigurationIdentifier: nil URLCredentialStorage: URLCredentialStorage RequestCachePolicy: requestCachePolicy URLCache: URLCache HTTPShouldSetCookies: HTTPShouldSetCookies HTTPCookieAcceptPolicy: HTTPCookieAcceptPolicy HTTPCookieStorage: HTTPCookieStorage HTTPAdditionalHeaders: HTTPAdditionalHeaders TimeoutIntervalForRequest: timeoutIntervalForRequest TimeoutIntervalForResource: timeoutIntervalForResource Discretionary: discretionary SharedContainerIdentifier: sharedContainerIdentifier HTTPMaximumConnectionsPerHost: HTTPMaximumConnectionsPerHost Delegate: delegate DelegateQueue: delegateQueue];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType ConfigurationIdentifier: (NSString *) configurationIdentifier URLCredentialStorage: (NSURLCredentialStorage *) URLCredentialStorage RequestCachePolicy: (NSURLRequestCachePolicy) requestCachePolicy URLCache: (NSURLCache *) URLCache HTTPShouldSetCookies: (BOOL) HTTPShouldSetCookies HTTPCookieAcceptPolicy: (NSHTTPCookieAcceptPolicy) HTTPCookieAcceptPolicy HTTPCookieStorage: (NSHTTPCookieStorage *) HTTPCookieStorage HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders TimeoutIntervalForRequest: (NSTimeInterval) timeoutIntervalForRequest TimeoutIntervalForResource: (NSTimeInterval) timeoutIntervalForResource Discretionary: (BOOL) discretionary SharedContainerIdentifier: (NSString *) sharedContainerIdentifier HTTPMaximumConnectionsPerHost: (NSInteger) HTTPMaximumConnectionsPerHost Delegate: (id <NSURLSessionTaskDelegate>) delegate DelegateQueue: (NSOperationQueue *) delegateQueue
{
    return [self createSession: configurationType ConfigurationIdentifier: configurationIdentifier AllowsCellularAccess: YES URLCredentialStorage: URLCredentialStorage RequestCachePolicy: requestCachePolicy URLCache: URLCache HTTPShouldSetCookies: HTTPShouldSetCookies HTTPCookieAcceptPolicy: HTTPCookieAcceptPolicy HTTPCookieStorage: HTTPCookieStorage HTTPAdditionalHeaders: HTTPAdditionalHeaders TimeoutIntervalForRequest: timeoutIntervalForRequest TimeoutIntervalForResource: timeoutIntervalForResource Discretionary: discretionary SharedContainerIdentifier: sharedContainerIdentifier HTTPMaximumConnectionsPerHost: HTTPMaximumConnectionsPerHost Delegate: delegate DelegateQueue: delegateQueue];
}

- (NSURLSession *) createSession: (enum SessionConfigurationTypes) configurationType ConfigurationIdentifier: (NSString *) configurationIdentifier AllowsCellularAccess: (BOOL) allowsCellularAccess URLCredentialStorage: (NSURLCredentialStorage *) URLCredentialStorage RequestCachePolicy: (NSURLRequestCachePolicy) requestCachePolicy URLCache: (NSURLCache *) URLCache HTTPShouldSetCookies: (BOOL) HTTPShouldSetCookies HTTPCookieAcceptPolicy: (NSHTTPCookieAcceptPolicy) HTTPCookieAcceptPolicy HTTPCookieStorage: (NSHTTPCookieStorage *) HTTPCookieStorage HTTPAdditionalHeaders: (NSDictionary *) HTTPAdditionalHeaders TimeoutIntervalForRequest: (NSTimeInterval) timeoutIntervalForRequest TimeoutIntervalForResource: (NSTimeInterval) timeoutIntervalForResource Discretionary: (BOOL) discretionary SharedContainerIdentifier: (NSString *) sharedContainerIdentifier HTTPMaximumConnectionsPerHost: (NSInteger) HTTPMaximumConnectionsPerHost Delegate: (id <NSURLSessionTaskDelegate>) delegate DelegateQueue: (NSOperationQueue *) delegateQueue
{
    NSURLSessionConfiguration * urlSessionConfiguration;
    
    switch (configurationType)
    {
        case SessionConfigurationTypeDefault:
            urlSessionConfiguration                             = [NSURLSessionConfiguration defaultSessionConfiguration];
            
            break;
            
        case SessionConfigurationTypeEphemeral:
            urlSessionConfiguration                             = [NSURLSessionConfiguration ephemeralSessionConfiguration];
            
            break;
            
        case SessionConfigurationTypeBackground:
        {
            if (configurationIdentifier)
                urlSessionConfiguration                         = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier: configurationIdentifier];
            else
            {
                NSString * bundleIdentifer                      = NSBundle.mainBundle.bundleIdentifier;
                
                urlSessionConfiguration                         = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier: bundleIdentifer];
                
                if (!discretionary)
                    urlSessionConfiguration.discretionary       = discretionary;
            }
        }
            
            break;
            
        default:
            urlSessionConfiguration                             = [NSURLSessionConfiguration defaultSessionConfiguration];
            
            break;
    }
    
    // Settings
    
    urlSessionConfiguration.allowsCellularAccess                = allowsCellularAccess;
    urlSessionConfiguration.URLCredentialStorage                = URLCredentialStorage;
    
    if (requestCachePolicy != NSURLRequestUseProtocolCachePolicy)
        urlSessionConfiguration.requestCachePolicy              = requestCachePolicy;
    
    urlSessionConfiguration.URLCache                            = URLCache;
    
    if (!HTTPShouldSetCookies)
        urlSessionConfiguration.HTTPShouldSetCookies            = HTTPShouldSetCookies;
    
    if (HTTPCookieAcceptPolicy != NSHTTPCookieAcceptPolicyOnlyFromMainDocumentDomain)
        urlSessionConfiguration.HTTPCookieAcceptPolicy          = HTTPCookieAcceptPolicy;
    
    urlSessionConfiguration.HTTPCookieStorage                   = HTTPCookieStorage;
    
    urlSessionConfiguration.HTTPAdditionalHeaders               = HTTPAdditionalHeaders;
    
    if (timeoutIntervalForRequest != DEFAULT_TIMEOUT_INTERVAL_FOR_REQUEST)
        urlSessionConfiguration.timeoutIntervalForRequest       = timeoutIntervalForRequest;
    if (timeoutIntervalForResource != DEFAULT_TIMEOUT_INTERVAL_FOR_RESOURCE)
        urlSessionConfiguration.timeoutIntervalForResource      = timeoutIntervalForResource;
    
    if (sharedContainerIdentifier)
        urlSessionConfiguration.sharedContainerIdentifier       = sharedContainerIdentifier;
    
    if (HTTPMaximumConnectionsPerHost != DEFAULT_HTTP_MAXIMUM_CONNECTIONS_PER_HOST)
        urlSessionConfiguration.HTTPMaximumConnectionsPerHost    = HTTPMaximumConnectionsPerHost;
    
    NSURLSession * urlSession                                   = [NSURLSession sessionWithConfiguration: urlSessionConfiguration delegate: delegate delegateQueue: delegateQueue];
    
    return urlSession;
}

@end

@interface HttpNetworkOperatorEventHandler : NSObject <NSURLSessionTaskDelegate, NSURLSessionDataDelegate>

@property (assign, nonatomic) long long totalSize;

@property (copy, nonatomic) void (^ onReceivedChallenge) (NSURLSession *, NSURLAuthenticationChallenge *, void (^) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential));
@property (copy, nonatomic) void (^ onBodyDataSent) (NSURLSession *, NSURLSessionTask *, long long bytesSent, long long totalBytesSent, long long totalBytesExpectedToSend);
@property (copy, nonatomic) void (^ onResponseReceived) (NSURLSession *, NSURLSessionDataTask *, NSURLResponse *, long long size, NSURLSessionResponseDisposition);
@property (copy, nonatomic) void (^ onReceiveData) (NSURLSession *, NSURLSessionDataTask *, NSData *, long long size, long long totalsize, long long remainingSize);
@property (copy, nonatomic) void (^ onErrorOccurs) (NSURLSession *, NSURLSessionTask *, NSError *);

@end

@implementation HttpNetworkOperatorEventHandler

- (void) URLSession: (NSURLSession *) session didReceiveChallenge: (NSURLAuthenticationChallenge *) challenge completionHandler: (void (^) (NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable)) completionHandler
{
    if (self.onReceivedChallenge)
    {
        self.onReceivedChallenge (session, challenge, completionHandler);
        
        self.onReceivedChallenge = nil;
    }
    else
        completionHandler (NSURLSessionAuthChallengeUseCredential, [NSURLCredential credentialForTrust: challenge.protectionSpace.serverTrust]);
}

- (void) URLSession: (NSURLSession *) session task: (NSURLSessionTask *) task didSendBodyData: (int64_t) bytesSent totalBytesSent: (int64_t) totalBytesSent totalBytesExpectedToSend: (int64_t) totalBytesExpectedToSend
{
    if (self.onBodyDataSent)
        self.onBodyDataSent (session, task, bytesSent, totalBytesSent, totalBytesExpectedToSend);
}

- (void) URLSession: (NSURLSession *) session dataTask: (NSURLSessionDataTask *) dataTask didReceiveResponse: (NSURLResponse *) response completionHandler: (void (^) (NSURLSessionResponseDisposition)) completionHandler
{
    if (self.onResponseReceived)
        self.onResponseReceived (session, dataTask, response, response.expectedContentLength, NSURLSessionResponseAllow);
    
    self.totalSize              = response.expectedContentLength;
    
    completionHandler (NSURLSessionResponseAllow);
    
    self.onResponseReceived     = nil;
}

- (void) URLSession: (NSURLSession *) session dataTask: (NSURLSessionDataTask *) dataTask didReceiveData: (NSData *) data
{
    if (self.onReceiveData)
        self.onReceiveData (session, dataTask, data, data.length, self.totalSize, self.totalSize - data.length);
    
    if (self.totalSize == data.length)
        self.onReceiveData      = nil;
}

- (void) URLSession: (NSURLSession *) session task: (NSURLSessionTask *) task didCompleteWithError: (NSError *) error
{
    if (self.onErrorOccurs)
    {
        self.onErrorOccurs (session, task, error);
        
        self.onErrorOccurs = nil;
    }
}

@end


@interface HttpURLNetworkOperator ()

@end

@implementation HttpURLNetworkOperator


/*!
 @method request:
 @abstract                      Sends the HTTP GET request via URL....
 @discussion                    This method is designated to send the HTTP GET request via the specific URL.                   This is the designated method to send the HTTP request with specific parameters.
 @param URL                     The URL for the request.
 @param onReceivedChallenge     Event when an authentication is initiated.
 @param onReceiveData           Event when receiving a data block of bytes.
 @param onResponseReceived       Event when a HTTP Response is returned.
 */

- (void) request: (NSURL *) URL OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived
{
    [self request: URL Asynchronous: NO OnReceivedChallenge: onReceivedChallenge OnReceiveData: onReceiveData onResponseReceived: onResponseReceived CompletionHandler: nil];
}

/*!
 @method request:
 @abstract                      Sends the HTTP GET request via URL....
 @discussion                    This method is designated to send the HTTP GET request via the specific URL.                   This is the designated method to send the HTTP request with specific parameters.
 @param URL                     The URL for the request.
 @param onReceivedChallenge     Event when an authentication is initiated.
 @param completionHandler       Event when a HTTP Request is completed. Note, this callback only be triggered when asynchronous is YES
 */

- (void) request: (NSURL *) URL OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler
{
    [self request: URL Asynchronous: YES OnReceivedChallenge: onReceivedChallenge OnReceiveData: nil onResponseReceived: nil CompletionHandler: completionHandler];
}

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

- (void) request: (NSURL *) URL Asynchronous: (BOOL) asynchronous OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler
{
    NSURLSessionDataTask * urlSessionDataTask;
    NSURLSession * urlSession;
    
    HttpNetworkOperatorEventHandler * handler       = [HttpNetworkOperatorEventHandler new];
    
    handler.onReceivedChallenge                     = onReceivedChallenge;
    
    if (asynchronous)
    {
        urlSession                                  = [[HttpNetworkSessionOperator sharedInstance] createSession: handler];
        
        urlSessionDataTask                          = [urlSession dataTaskWithURL: URL completionHandler: ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if (completionHandler)
                completionHandler (urlSessionDataTask, data, response, error);
        }];
    }
   else
   {
       handler.onResponseReceived                    = onResponseReceived;
       handler.onReceiveData                        = onReceiveData;
       
       urlSession                                   = [[HttpNetworkSessionOperator sharedInstance] createSession: handler];
       
       urlSessionDataTask                           = [urlSession dataTaskWithURL: URL];
   }
    
    [urlSessionDataTask resume];
}


@end

@interface HttpRequestNetworkOperator ()

@end

@implementation HttpRequestNetworkOperator

/*!
 @method sharedInstance:
 @abstract Initializes the singleton instance.
 @discussion Initializes the singleton instance.
 @result Return the sington instance.
 */

+ (instancetype) sharedInstance
{
    static id instance;
    static dispatch_once_t once;
    
    dispatch_once (&once, ^ {
        
        instance = [[self alloc] init];
        
    });
    
    return instance;
}

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

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived
{
    [self request: URL HTTPMethod: HTTPMethod AllHTTPHeaderFields: allHTTPHeaderFields HTTPBody: HTTPBody Asynchronous: NO OnReceivedChallenge: onReceivedChallenge OnReceiveData: onReceiveData onResponseReceived: onResponseReceived CompletionHandler: nil];
}
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

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler
{
    [self request: URL HTTPMethod: HTTPMethod AllHTTPHeaderFields: allHTTPHeaderFields HTTPBody: HTTPBody Asynchronous: YES OnReceivedChallenge: onReceivedChallenge OnReceiveData: nil onResponseReceived: nil CompletionHandler: completionHandler];
}

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

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody Asynchronous: (BOOL) asynchronous OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler
{
    [self request: URL HTTPMethod: HTTPMethod CachePolicy: NSURLRequestUseProtocolCachePolicy AllHTTPHeaderFields: allHTTPHeaderFields HTTPBody: HTTPBody Asynchronous: asynchronous OnReceivedChallenge: onReceivedChallenge OnReceiveData: onReceiveData onResponseReceived: onResponseReceived CompletionHandler: completionHandler];
}

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

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod CachePolicy: (NSURLRequestCachePolicy) cachePolicy AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody Asynchronous: (BOOL) asynchronous OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler
{
    [self request: URL HTTPMethod: HTTPMethod CachePolicy: cachePolicy AllHTTPHeaderFields: allHTTPHeaderFields HTTPBody: HTTPBody HTTPBodyStream: nil Asynchronous: asynchronous OnReceivedChallenge: onReceivedChallenge OnReceiveData: onReceiveData onResponseReceived: onResponseReceived CompletionHandler: completionHandler];
}

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

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod CachePolicy: (NSURLRequestCachePolicy) cachePolicy AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody HTTPBodyStream: (NSInputStream *) HTTPBodyStream Asynchronous: (BOOL) asynchronous OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler
{
    [self request: URL HTTPMethod: HTTPMethod CachePolicy: cachePolicy AllHTTPHeaderFields: allHTTPHeaderFields HTTPBody: HTTPBody HTTPBodyStream: HTTPBodyStream HTTPShouldUsePipelining: YES Asynchronous: asynchronous OnReceivedChallenge: onReceivedChallenge OnReceiveData: onReceiveData onResponseReceived: onResponseReceived CompletionHandler: completionHandler];
}

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

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod CachePolicy: (NSURLRequestCachePolicy) cachePolicy AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody HTTPBodyStream: (NSInputStream *) HTTPBodyStream HTTPShouldUsePipelining: (BOOL) HTTPShouldUsePipelining Asynchronous: (BOOL) asynchronous OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler
{
    [self request: URL HTTPMethod: HTTPMethod CachePolicy: cachePolicy AllHTTPHeaderFields: allHTTPHeaderFields HTTPBody: HTTPBody HTTPBodyStream: HTTPBodyStream HTTPShouldHandleCookies: YES HTTPShouldUsePipelining: HTTPShouldUsePipelining Asynchronous: asynchronous OnReceivedChallenge: onReceivedChallenge OnReceiveData: onReceiveData onResponseReceived: onResponseReceived CompletionHandler: completionHandler];
}

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

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod CachePolicy: (NSURLRequestCachePolicy) cachePolicy AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody HTTPBodyStream: (NSInputStream *) HTTPBodyStream HTTPShouldHandleCookies: (BOOL) HTTPShouldHandleCookies HTTPShouldUsePipelining: (BOOL) HTTPShouldUsePipelining Asynchronous: (BOOL) asynchronous OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler
{
    [self request: URL HTTPMethod: HTTPMethod CachePolicy: cachePolicy TimeoutInterval: DEFAULT_TIMEOUT_INTERVAL_FOR_REQUEST AllHTTPHeaderFields: allHTTPHeaderFields HTTPBody: HTTPBody HTTPBodyStream: HTTPBodyStream HTTPShouldHandleCookies: HTTPShouldHandleCookies HTTPShouldUsePipelining: HTTPShouldUsePipelining Asynchronous: asynchronous OnReceivedChallenge: onReceivedChallenge OnReceiveData: onReceiveData onResponseReceived: onResponseReceived CompletionHandler: completionHandler];
}

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

- (void) request: (NSURL *) URL HTTPMethod: (NSString *) HTTPMethod CachePolicy: (NSURLRequestCachePolicy) cachePolicy TimeoutInterval: (NSTimeInterval) timeoutInterval AllHTTPHeaderFields: (NSDictionary *) allHTTPHeaderFields HTTPBody: (NSData *) HTTPBody HTTPBodyStream: (NSInputStream *) HTTPBodyStream HTTPShouldHandleCookies: (BOOL) HTTPShouldHandleCookies HTTPShouldUsePipelining: (BOOL) HTTPShouldUsePipelining Asynchronous: (BOOL) asynchronous OnReceivedChallenge: (void (^) (NSURLSession * session, NSURLAuthenticationChallenge * URLAuthenticationChallenge, void (^completionHandler) (NSURLSessionAuthChallengeDisposition URLSessionAuthChallengeDisposition, NSURLCredential * URLCredential))) onReceivedChallenge OnReceiveData: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSData * data, long long size, long long totalSize, long long remainingSize)) onReceiveData onResponseReceived: (void (^) (NSURLSession * session, NSURLSessionDataTask * dataTask, NSURLResponse * response, long long size, NSURLSessionResponseDisposition URLSessionResponseDisposition)) onResponseReceived CompletionHandler: (void (^) (NSURLSessionDataTask * dataTask, NSData * data, NSURLResponse * response, NSError * error)) completionHandler
{
    NSMutableURLRequest * urlRequest                = [NSMutableURLRequest requestWithURL: URL cachePolicy: cachePolicy timeoutInterval: timeoutInterval];
    
    if (HTTPMethod)
        urlRequest.HTTPMethod                       = HTTPMethod;
    
    if (allHTTPHeaderFields.allKeys.count)
        urlRequest.allHTTPHeaderFields              = allHTTPHeaderFields;
    
    if (HTTPBody)
        urlRequest.HTTPBody                         = HTTPBody;
    else if (HTTPBodyStream)
        urlRequest.HTTPBodyStream                   = HTTPBodyStream;
    
    if (!HTTPShouldHandleCookies)
        urlRequest.HTTPShouldHandleCookies          = HTTPShouldHandleCookies;
    
    if (HTTPShouldUsePipelining)
        urlRequest.HTTPShouldUsePipelining          = HTTPShouldUsePipelining;
    
    NSURLSessionDataTask    * urlSessionDataTask;
    NSURLSession            * urlSession;
    
    HttpNetworkOperatorEventHandler * handler       = [HttpNetworkOperatorEventHandler new];
    
    handler.onReceivedChallenge                     = onReceivedChallenge;
    
    if (asynchronous)
    {
        urlSession                                  = [[HttpNetworkSessionOperator sharedInstance] createSession: handler];
        
        urlSessionDataTask                          = [urlSession dataTaskWithRequest: urlRequest completionHandler: ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if (completionHandler)
                completionHandler (urlSessionDataTask, data, response, error);
        }];
    }
    else
    {
        handler.onResponseReceived                  = onResponseReceived;
        handler.onReceiveData                       = onReceiveData;
        
        urlSession                                  = [[HttpNetworkSessionOperator sharedInstance] createSession: handler];
        urlSessionDataTask                          = [urlSession dataTaskWithRequest: urlRequest];
    }
    
    [urlSessionDataTask resume];
}

@end
