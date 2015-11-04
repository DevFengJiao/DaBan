//
//  uploadImage.m
//  爱坪山
//
//  Created by guoql on 14-10-29.
//  Copyright (c) 2014年 guoql. All rights reserved.
//



#import "uploadImage.h"
#import "SVProgressHUD.h"

@implementation RequestPostUploadHelper

static NSString * const FORM_FLE_INPUT = @"file";

+ (NSString *)postRequestWithURL: (NSString *)url  // IN
                      postParems: (NSMutableDictionary *)postParems // IN
                     picFilePath: (NSString *)picFilePath  // IN
                     picFileName: (NSString *)picFileName;  // IN
{
    
    
   // NSString *TWITTERFON_FORM_BOUNDARY = @"0xKhTmLbOuNdArY";
    NSString *TWITTERFON_FORM_BOUNDARY = @"AaB03x";
    //根据url初始化request
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:10];
    //分界线 --AaB03x
    NSString *MPboundary=[[NSString alloc]initWithFormat:@"--%@",TWITTERFON_FORM_BOUNDARY];
    //结束符 AaB03x--
    NSString *endMPboundary=[[NSString alloc]initWithFormat:@"%@--",MPboundary];
    //得到图片的data
    NSData* data;
    if(picFilePath){
        
        UIImage *image=[UIImage imageWithContentsOfFile:picFilePath];
        //判断图片是不是png格式的文件
        if (UIImagePNGRepresentation(image)) {
            //返回为png图像。
            data = UIImagePNGRepresentation(image);
        }else {
            //返回为JPEG图像。
            data = UIImageJPEGRepresentation(image, 1.0);
        }
    }
    //http body的字符串
    NSMutableString *body=[[NSMutableString alloc]init];
    //参数的集合的所有key的集合
    NSArray *keys= [postParems allKeys];
    
    //遍历keys
    for(int i=0;i<[keys count];i++)
    {
        //得到当前key
        NSString *key=[keys objectAtIndex:i];
        
        //添加分界线，换行
        [body appendFormat:@"%@\r\n",MPboundary];
        //添加字段名称，换2行
        [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key];
        //添加字段的值
        [body appendFormat:@"%@\r\n",[postParems objectForKey:key]];
        
        NSLog(@"添加字段的值==%@",[postParems objectForKey:key]);
    }
    
    if(picFilePath){
        ////添加分界线，换行
       [body appendFormat:@"%@\r\n",MPboundary];
        
        //声明pic字段，文件名为boris.png
        
        [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",FORM_FLE_INPUT,picFileName];
        
        //[body appendFormat:@"multipart: form-data; name=\"%@\"; file=\"%@\"\r\n",FORM_FLE_INPUT,picFileName];
       // [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",@"pic",picFileName];
        //声明上传文件的格式
        [body appendFormat:@"Content-Type: image/jpge,image/gif, image/jpeg, image/pjpeg, image/pjpeg\r\n\r\n"];
        
    }
    
    //声明结束符：--AaB03x--
    NSString *end=[[NSString alloc]initWithFormat:@"\r\n%@",endMPboundary];
    //声明myRequestData，用来放入http body
    NSMutableData *myRequestData=[NSMutableData data];
    
    //将body字符串转化为UTF8格式的二进制
    [myRequestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
    if(picFilePath){
        //将image的data加入
        [myRequestData appendData:data];
    }
    //加入结束符--AaB03x--
    [myRequestData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    
    //设置HTTPHeader中Content-Type的值
    NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",TWITTERFON_FORM_BOUNDARY];
   // NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data;"];
    //设置HTTPHeader
    [request setValue:content forHTTPHeaderField:@"Content-Type"];
    //设置Content-Length
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[myRequestData length]] forHTTPHeaderField:@"Content-Length"];
    //设置http body
    [request setHTTPBody:myRequestData];
    //http method
    [request setHTTPMethod:@"POST"];
    
    
    NSHTTPURLResponse *urlResponese = nil;
    NSError *error = [[NSError alloc]init];
    NSData* resultData = [NSURLConnection sendSynchronousRequest:request   returningResponse:&urlResponese error:&error];
    
    if (error != nil) {
       
      //  NSLog(@"error=%@",[error localizedDescription]);
      //  NSLog(@"error=%@",[error localizedFailureReason]);

     //      NSLog(@"error=%@",[error description]);
    }
 
    NSString* result= [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    
//     NSLog(@"返回结果=====%d",[urlResponese statusCode]);
    
    if([urlResponese statusCode] >=200&&[urlResponese statusCode]<300){
        NSLog(@"返回结果=====%@",result);
        return result;
    }
    
    return nil;
}


/**
 * 修发图片大小
 */
+ (UIImage *) imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize) newSize{
    newSize.height=image.size.height*(newSize.width/image.size.width);
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  newImage;
    
}

/**
 * 保存图片
 */
+ (NSString *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName{
    NSData* imageData;
    
    //判断图片是不是png格式的文件
    if (UIImagePNGRepresentation(tempImage)) {
        //返回为png图像。
        imageData = UIImagePNGRepresentation(tempImage);
    }else {
        //返回为JPEG图像。
        imageData = UIImageJPEGRepresentation(tempImage, 1.0);
    }
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    NSString* documentsDirectory = [paths objectAtIndex:0];
    
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    
    NSArray *nameAry=[fullPathToFile componentsSeparatedByString:@"/"];
    NSLog(@"===fullPathToFile===%@",fullPathToFile);
    NSLog(@"===FileName===%@",[nameAry objectAtIndex:[nameAry count]-1]);
    
    [imageData writeToFile:fullPathToFile atomically:NO];
    return fullPathToFile;
}

/**
 * 生成GUID
 */
+ (NSString *)generateUuidString{
    // create a new UUID which you own
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    
    // create a new CFStringRef (toll-free bridged to NSString)
    // that you own
    NSString *uuidString = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid));
    
    // transfer ownership of the string
    // to the autorelease pool
    // release the UUID
    CFRelease(uuid);
    
    return uuidString;
}


+(NSDictionary*)updateImage:(NSString*)url param:(NSMutableDictionary*)params format:(NSString*)fmat
{
    //分界线的标识符
   
    NSString *TWITTERFON_FORM_BOUNDARY = @"AaB03x";
    //根据url初始化request
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:10];
    //分界线 --AaB03x
    NSString *MPboundary=[[NSString alloc]initWithFormat:@"--%@",TWITTERFON_FORM_BOUNDARY];
    //结束符 AaB03x--
    NSString *endMPboundary=[[NSString alloc]initWithFormat:@"%@--",MPboundary];
    //要上传的图片
    
    //UIImage *image=[UIImage imageNamed:[params objectForKey:@"pic"]];
    
    UIImage *image = [UIImage imageWithContentsOfFile:[params objectForKey:@"pic"]];
    //得到图片的data
    NSData* data = UIImagePNGRepresentation(image);
    //http body的字符串
    NSMutableString *body=[[NSMutableString alloc]init];
    //参数的集合的所有key的集合
    NSArray *keys= [params allKeys];
    
    //遍历keys
    for(int i=0;i<[keys count];i++)
    {
        //得到当前key
        NSString *key=[keys objectAtIndex:i];
        //如果key不是pic，说明value是字符类型，比如name：Boris
        if(![key isEqualToString:@"pic"])
        {
            //添加分界线，换行
            [body appendFormat:@"%@\r\n",MPboundary];
            //添加字段名称，换2行
            [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key];
            //添加字段的值
            [body appendFormat:@"%@\r\n",[params objectForKey:key]];
        }
    }
    
    ////添加分界线，换行
    [body appendFormat:@"%@\r\n",MPboundary];
    //声明pic字段，文件名为boris.png
    //[body appendFormat:@"Content-Disposition: form-data; name=\"pic\"; filename=\"text02.png\"\r\n"];
    
    [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",FORM_FLE_INPUT,[params objectForKey:@"pic"]];

    //声明上传文件的格式
    //[body appendFormat:@"Content-Type: image/png,image/jpeg\r\n\r\n"];
    NSString *contype = [NSString stringWithFormat:@"Content-Type: %@\r\n\r\n",fmat];
    NSLog(@"content type=%@",contype);
    [body appendFormat:@"Content-Type: %@\r\n\r\n",fmat];
    
    //声明结束符：--AaB03x--
    NSString *end=[[NSString alloc]initWithFormat:@"\r\n%@",endMPboundary];
    //声明myRequestData，用来放入http body
    NSMutableData *myRequestData=[NSMutableData data];
    //将body字符串转化为UTF8格式的二进制
    [myRequestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
    //将image的data加入
    [myRequestData appendData:data];
    //加入结束符--AaB03x--
    [myRequestData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    
    //设置HTTPHeader中Content-Type的值
    NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",TWITTERFON_FORM_BOUNDARY];
    //设置HTTPHeader
    [request setValue:content forHTTPHeaderField:@"Content-Type"];
    //设置Content-Length
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[myRequestData length]] forHTTPHeaderField:@"Content-Length"];
    //设置http body
    [request setHTTPBody:myRequestData];
    //http method
    [request setHTTPMethod:@"POST"];
    
    //建立连接，设置代理
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    //设置接受response的data
    if (conn) {
        NSLog(@"connect successs");
        
        NSHTTPURLResponse *urlResponese = nil;
        NSError *error;
        NSData* resultData = [NSURLConnection sendSynchronousRequest:request   returningResponse:&urlResponese error:&error];
        
        //NSString* result= [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
        //NSData * data = [result dataUsingEncoding:NSUTF8StringEncoding];
        
        NSLog(@"error=%@",[error localizedFailureReason]);
       // NSLog(@"返回结果=====%@ resuct code=%d ",result,[urlResponese statusCode]);
        
        NSDictionary *jsonDict ;
        if (resultData!=nil) {
          jsonDict  = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableLeaves error:nil];

        }
        return jsonDict;
    }
    
    return nil;

}

+(NSDictionary*)uploadVedio:(NSString*)url param:(NSMutableDictionary*)params
{
    //分界线的标识符
    
    NSString *TWITTERFON_FORM_BOUNDARY = @"AaB03x";
    //根据url初始化request
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:10];
    //分界线 --AaB03x
    NSString *MPboundary=[[NSString alloc]initWithFormat:@"--%@",TWITTERFON_FORM_BOUNDARY];
    //结束符 AaB03x--
    NSString *endMPboundary=[[NSString alloc]initWithFormat:@"%@--",MPboundary];
    //要上传的图片
    //UIImage *image=[params objectForKey:@"pic"];
    //得到图片的data
    //NSData* data = UIImagePNGRepresentation(image);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *path = [paths objectAtIndex:0];
    //NSString *filePathName = path;
    NSString *filePathName = [path stringByAppendingPathComponent:[params
                                                                   objectForKey:@"vedio"]];
    NSFileManager *fm;
    fm = [NSFileManager defaultManager];
    NSDictionary *attr =[fm fileAttributesAtPath: filePathName traverseLink: NO] ; //文件属性
    NSLog(@"file size is：%i bytes ",[[attr objectForKey:NSFileSize] intValue]);
    
    NSFileHandle* handler = [NSFileHandle fileHandleForReadingAtPath:filePathName];
    [handler seekToFileOffset:(unsigned long long)0];
    NSData* data = [handler readDataOfLength:[[attr objectForKey:NSFileSize] intValue]];
    
    
    //http body的字符串
    NSMutableString *body=[[NSMutableString alloc]init];
    //参数的集合的所有key的集合
    NSArray *keys= [params allKeys];
    
    //遍历keys
    for(int i=0;i<[keys count];i++)
    {
        //得到当前key
        NSString *key=[keys objectAtIndex:i];
        //如果key不是pic，说明value是字符类型，比如name：Boris
        if(![key isEqualToString:@"vedio"])
        {
            //添加分界线，换行
            [body appendFormat:@"%@\r\n",MPboundary];
            //添加字段名称，换2行
            [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key];
            //添加字段的值
            [body appendFormat:@"%@\r\n",[params objectForKey:key]];
        }
    }
    
    ////添加分界线，换行
    [body appendFormat:@"%@\r\n",MPboundary];
    //声明pic字段，文件名为boris.png
    //[body appendFormat:@"Content-Disposition: form-data; name=\"pic\"; filename=\"text02.png\"\r\n"];
    [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",FORM_FLE_INPUT,[params objectForKey:@"vedio"]];
    
    //声明上传文件的格式
    [body appendFormat:@"Content-Type: vedio/mp3\r\n\r\n"];
    
    //声明结束符：--AaB03x--
    NSString *end=[[NSString alloc]initWithFormat:@"\r\n%@",endMPboundary];
    //声明myRequestData，用来放入http body
    NSMutableData *myRequestData=[NSMutableData data];
    //将body字符串转化为UTF8格式的二进制
    [myRequestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
    //将image的data加入
    [myRequestData appendData:data];
    //加入结束符--AaB03x--
    [myRequestData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    
    //设置HTTPHeader中Content-Type的值
    NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",TWITTERFON_FORM_BOUNDARY];
    //设置HTTPHeader
    [request setValue:content forHTTPHeaderField:@"Content-Type"];
    //设置Content-Length
    [request setValue:[NSString stringWithFormat:@"%lu", (long)[myRequestData length]] forHTTPHeaderField:@"Content-Length"];
    //设置http body
    [request setHTTPBody:myRequestData];
    //http method
    [request setHTTPMethod:@"POST"];
    
    //建立连接，设置代理
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    //设置接受response的data
    if (conn) {
        NSLog(@"connect successs");
        
        NSHTTPURLResponse *urlResponese = nil;
        NSError *error;
        NSData* resultData = [NSURLConnection sendSynchronousRequest:request   returningResponse:&urlResponese error:&error];
        
        NSString* result= [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
        NSLog(@"error=%@",[error localizedFailureReason]);
        NSLog(@"返回结果=====%@ resuct code=%ld ",result,(long)[urlResponese statusCode]);
        if (resultData != nil) {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableLeaves error:nil];
        return jsonDict;
        }
    }
    
    return nil;
    
}

+(NSString*)getReturnRecord:(NSString*)urlString
{
    
    NSString *str;
    
    //[self saveImage:[UIImage imageWithContentsOfFile:filePath] WithName:@"test.png"];
    NSMutableDictionary *pa = [NSMutableDictionary dictionaryWithCapacity:1];
    NSString *audioFileName = @"myrecord.mp3";
    [pa setValue:audioFileName forKey:@"vedio"];
    [pa setValue:@"myrecord" forKey:@"field1"];
    //[pa setValue:@"jpeg" forKey:@"format"];
    NSLog(@"upload record address=%@",urlString);
    NSDictionary* resultDict = [RequestPostUploadHelper uploadVedio: urlString param:pa];
    // NSLog(@"result = %@",result);
    //upload success
    if ( resultDict != nil) {
        
        str = [resultDict objectForKey:@"result"];
        NSLog(@"audio record name=%@",str);
        return str;
    }
    
    return nil;
}

+(NSString*)getReturnVedio:(NSString*)urlString
{
    
    NSString *str;
    
    //[self saveImage:[UIImage imageWithContentsOfFile:filePath] WithName:@"test.png"];
    NSMutableDictionary *pa = [NSMutableDictionary dictionaryWithCapacity:1];
    NSString *audioFileName = @"myvedio.mp4";
    [pa setValue:audioFileName forKey:@"vedio"];
    [pa setValue:@"myvedio" forKey:@"field1"];
    //[pa setValue:@"jpeg" forKey:@"format"];
    NSLog(@"upload record address=%@",urlString);
    NSDictionary* resultDict = [RequestPostUploadHelper uploadVedio: urlString param:pa];

    if ( resultDict != nil) {
        
        str = [resultDict objectForKey:@"result"];
        NSLog(@"vedio record name=%@",str);
        return str;
    }
    
    return nil;
}

+(NSString*)getReturnImage:(NSString*)filePath uploadAddr:(NSString*)urlString
{
    
    NSString *str;
    
    //[self saveImage:[UIImage imageWithContentsOfFile:filePath] WithName:@"test.png"];
    
    NSMutableDictionary *pa = [NSMutableDictionary dictionaryWithCapacity:1];
    // NSString *imageName = [NSString stringWithFormat:@"image.png"];
    // NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    // NSString *imageName = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image"];
    [pa setValue:filePath forKey:@"pic"];
    [pa setValue:@"image" forKey:@"field1"];
    //[pa setValue:@"jpeg" forKey:@"format"];
    NSLog(@"upload address=%@",urlString);
//    [SVProgressHUD show];
    NSDictionary* resultDict = [RequestPostUploadHelper updateImage: urlString param:pa format:@"image/png"];
   // NSLog(@"result = %@",result);
    //upload success
    if ( resultDict != nil) {
        [SVProgressHUD dismiss];
        
        str = [resultDict objectForKey:@"result"];
        NSLog(@"image photo name=%@",str);
        
        /*   NSString *url = [NSString stringWithFormat:@"%@&userId=%@&userName=%@&icon=%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"userId"],[[NSUserDefaults standardUserDefaults] objectForKey:@"LoginUserName"],userImageUrl];
         
         [self userModifyHandle:url sender:self]; */
        
        return str;
    }
    
    return nil;
}

@end