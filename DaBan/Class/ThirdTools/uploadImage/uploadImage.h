//
//  uploadImage.h
//  爱坪山
//
//  Created by guoql on 14-10-29.
//  Copyright (c) 2014年 guoql. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface RequestPostUploadHelper : NSObject

/**
 *POST 提交 并可以上传图片目前只支持单张
 */
+ (NSString *)postRequestWithURL: (NSString *)url  // IN
                      postParems: (NSMutableDictionary *)postParems // IN 提交参数据集合
                     picFilePath: (NSString *)picFilePath  // IN 上传图片路径
                     picFileName: (NSString *)picFileName;  // IN 上传图片名称

/**
 * 修发图片大小
 */
+ (UIImage *) imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize) newSize;
/**
 * 保存图片
 */
+ (NSString *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName;
/**
 * 生成GUID
 */
+ (NSString *)generateUuidString;

+(NSDictionary*)updateImage:(NSString*)url param:(NSMutableDictionary*)params format:(NSString*)fmat;

+(NSDictionary*)uploadVedio:(NSString*)url param:(NSMutableDictionary*)params;

+(NSString*)getReturnImage:(NSString*)filePath uploadAddr:(NSString*)urlString;

+(NSString*)getReturnRecord:(NSString*)urlString;

+(NSString*)getReturnVedio:(NSString*)urlString;
@end