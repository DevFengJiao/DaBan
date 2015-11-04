//
//  MKHttpRequest.m
//  NewLingYou
//
//  Created by Seven on 15/5/29.
//  Copyright (c) 2015年 Seven. All rights reserved.
//

#import "MKHttpRequest.h"
#import "WTURLRequestOperation.h"
#import "WTURLRequestSerialization.h"
#import "DefineString.h"

@implementation MKHttpRequest

+ (void)justDoURLRequest:(NSURLRequest *)request
            finished:(MKRequestFinishedBlock)finished
              failed:(MKRequestFailedBlock)failed
{
    [self justDoURLRequest:request finished:finished failed:failed shouldCache:NO];
}

+ (void)justDoURLRequest:(NSURLRequest *)request
                  option:(MKRequestCenterCachePolicy)option
                finished:(MKRequestFinishedBlock)finished
                  failed:(MKRequestFailedBlock)failed
{
    NSCachedURLResponse *response = [[self sharedCache] cachedResponseForRequest:request];
    
    switch (option) {
        case MKRequestCenterCachePolicyNormal:
        {
            //            [self doURLRequest:request finished: failed:failed];
            [self justDoURLRequest:request finished:finished failed:failed shouldCache:YES];
            
        }
            break;
            
        case MKRequestCenterCachePolicyCacheElseWeb:
        {
            if (response) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (finished) {
                        id JSONObject = [self JSONObjectWithData:response.data];
                        finished(response.response,response.data,JSONObject);
                    }
                });
            }else
            {
                [self justDoURLRequest:request finished:finished failed:failed shouldCache:YES];
            }
        }
            break;
            
        case MKRequestCenterCachePolicyOnlyCache:
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (response) {
                    if (finished) {
                        id JSONObject = [self JSONObjectWithData:response.data];
                        finished(response.response,response.data,JSONObject);
                    }
                }else
                {
                    NSError *error = [NSError errorWithDomain:NSCocoaErrorDomain
                                                         code:NSURLErrorBadURL
                                                     userInfo:nil];
                    if (failed) {
                        failed(nil,error);
                    }
                }
                
            });
        }
            break;
            
        case MKRequestCenterCachePolicyCacheAndRefresh:
        {
            
            //          如果有本地的，也去刷新，刷新后不回调，如果没有，则用网络的
            
            if (response) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (finished) {
                        id JSONObject = [self JSONObjectWithData:response.data];
                        finished(response.response,response.data,JSONObject);
                    }
                });
                [self justDoURLRequest:request finished:nil failed:nil];
            }else
            {
                [self justDoURLRequest:request finished:finished failed:failed shouldCache:YES];
            }
            
            
        }
            break;
        case WTRequestCenterCachePolicyCacheAndWeb:
        {
            if (response) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (finished) {
                        id JSONObject = [self JSONObjectWithData:response.data];
                        finished(response.response,response.data, JSONObject);
                    }
                });
                [self justDoURLRequest:request finished:finished failed:failed shouldCache:YES];
            }else
            {
                [self justDoURLRequest:request finished:finished failed:failed shouldCache:YES];
            }
            
            
        }
            break;
            
            
        default:
            break;
    }
    
}

+ (void)justDoURLRequest:(NSURLRequest *)request
                finished:(MKRequestFinishedBlock)finished
                  failed:(MKRequestFailedBlock)failed
             shouldCache:(BOOL)shouldCache
{
    //    有效性判断
    assert(request != nil);
    
    
    [self sendRequestStartNotificationWithRequest:request];
    
    NSTimeInterval startTimeInterval = [[NSDate date] timeIntervalSince1970];
    if (WTRequestCenterDebugMode) {
        //        NSLog(@"WTRequestCenter request start:%@",request);
        
    }
    
    void (^complection)(NSURLResponse *response,NSData *data,NSError *error);
    
    complection = ^(NSURLResponse *response,NSData *data,NSError *connectionError)
    {
        NSTimeInterval endTimeInterval = [[NSDate date] timeIntervalSince1970];
        
        [self sendRequestCompleteNotificationWithRequest:request
                                                response:response
                                                    data:data];
        
        
        if (connectionError) {
            if (WTRequestCenterDebugMode) {
                //                    访问出错
                NSLog(@"---------- MKHttpRequest请求失败... request failed:\n\nrequest信息:%@\n\n 响应: response：%@\n\n请求错误:error：%@  \n 请求时间 time:%f",request,response,connectionError,endTimeInterval-startTimeInterval);
            }
        }else
        {
            if (shouldCache) {
                NSNumber *endTime = [NSNumber numberWithFloat:endTimeInterval];
                NSNumber *startTime = [NSNumber numberWithFloat:startTimeInterval];
                
                NSDictionary *userInfo = @{@"requestTime":startTime.stringValue,@"responseTime": endTime.stringValue};
                
                NSCachedURLResponse *tempURLResponse = [[NSCachedURLResponse alloc] initWithResponse:response data:data userInfo:userInfo storagePolicy:NSURLCacheStorageAllowed];
                
                [[self sharedCache] storeCachedResponse:tempURLResponse forRequest:request];
            }
            
            if (WTRequestCenterDebugMode) {
                //                NSLog(@"WTRequestCenter request finished:%@  time:%f",request,endTimeInterval-startTimeInterval);
            }
        }
        
        
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if (connectionError) {
                if (failed) {
                    failed(response,connectionError);
                }
                
            }else
            {
                if (finished) {
                   id JSONObjec = [self JSONObjectWithData:data];
                    finished(response,data,JSONObjec);
                }
            }
        }];
    };
    
    
    //    [[WTRequestCenter sharedQueue] addOperationWithBlock:^{
    [NSURLConnection sendAsynchronousRequest:request queue:[WTRequestCenter sharedQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        complection(response,data,connectionError);
    }];
    //    }];
    
}

+ (NSURLRequest *)requestWithAction:(NSString *)action
                         parameters:(NSDictionary *)parameters
                           finished:(MKRequestFinishedBlock)finished
                             failed:(MKRequestFailedBlock)failed
{

    
    return [self requestWithAction:action parameters:parameters option:MKRequestCenterCachePolicyNormal finished:finished failed:failed];
    
}

+ (NSURLRequest *)requestWithAction:(NSString *)action
                         parameters:(NSDictionary *)parameters
                             option:(MKRequestCenterCachePolicy)option
                           finished:(MKRequestFinishedBlock)finished
                             failed:(MKRequestFailedBlock)failed
{
    NSString *urlString = [NSString stringWithFormat:@"%@cmd=%@",DaBan_URL,action];
    NSURLRequest *request = [[WTURLRequestSerialization sharedRequestSerialization] requestWithMethod:@"POST" URLString:urlString parameters:parameters error:nil];
    [self justDoURLRequest:request option:option finished:finished failed:failed];
    return request;
}
@end
