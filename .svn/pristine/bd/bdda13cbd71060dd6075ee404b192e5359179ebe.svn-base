//
//  MKHttpRequest.h
//  NewLingYou
//
//  Created by Seven on 15/5/29.
//  Copyright (c) 2015年 Seven. All rights reserved.
//

#import "WTRequestCenter.h"

/*!
 @enum NSURLRequestCachePolicy
 
 @constant MKRequestCenterCachePolicyNormal
 基本请求，直接访问url，取得数据
 
 @constant MKRequestCenterCachePolicyCacheElseWeb
 查看本地是否有缓存，如果有就使用，不管失效日期，
 如果缓存中没有，就访问url
 
 @constant MKRequestCenterCachePolicyOnlyCache
 只取本地的数据，如果本地数据为空也不访问网络
 
 @constant MKRequestCenterCachePolicyCacheAndRefresh
 本地获取一次，网络获取一次。
 如果本地有数据，网络获取不回调，如果本地没有数据，网络获取会回调
 
 
 @constant MKRequestCenterCachePolicyCacheAndWeb
 本地获取一次，网络获取一次，都会回调。
 注意：这种情况非常少见，只有调用网页的时候可能会用得到。
 
 */

typedef NS_ENUM(NSUInteger, MKRequestCenterCachePolicy) {
    MKRequestCenterCachePolicyNormal,
    MKRequestCenterCachePolicyCacheElseWeb,
    MKRequestCenterCachePolicyOnlyCache,
    MKRequestCenterCachePolicyCacheAndRefresh,
    MKRequestCenterCachePolicyCacheAndWeb
};

typedef void (^MKRequestFinishedBlock)(NSURLResponse *response,NSData *date,id JSONObject);
typedef void (^MKRequestFailedBlock)(NSURLResponse *response,NSError *error);
typedef void (^MKRequestComplectionBlock)(NSURLResponse *response,NSData *data,id JSONObject,NSError *error);
typedef void (^MKDownLoadProgressBlock)(NSUInteger bytesRead,long long totalBytesRead,long long totalBytesExpectedToRead);

@interface MKHttpRequest : WTRequestCenter
/*!
 just do a request
 */
+(void)justDoURLRequest:(NSURLRequest*)request
           finished:(MKRequestFinishedBlock)finished
             failed:(MKRequestFailedBlock)failed;

/*
 do a request with cachePolicy
 */
+(void)justDoURLRequest:(NSURLRequest*)request
             option:(MKRequestCenterCachePolicy)option
           finished:(MKRequestFinishedBlock)finished
             failed:(MKRequestFailedBlock)failed;


+ (NSURLRequest *)requestWithAction:(NSString *)action
                         parameters:(NSDictionary*)parameters
                           finished:(MKRequestFinishedBlock)finished
                             failed:(MKRequestFailedBlock)failed;

+ (NSURLRequest *)requestWithAction:(NSString *)action
                         parameters:(NSDictionary*)parameters
                             option:(MKRequestCenterCachePolicy)option
                           finished:(MKRequestFinishedBlock)finished
                             failed:(MKRequestFailedBlock)failed;

@end
