//
//  MSCarModel.m
//  DaBan
//
//  Created by qkm on 15-8-8.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSCarModel.h"

@implementation MSCarModel
-(instancetype)initWithDictionary:(NSDictionary *) dict{
    self = [super init];
    if (self) {
        
    }
    return self;
}


+ (NSArray *)typesList
{
    static NSArray *_typesList;
    if (!_typesList) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"CarType" ofType:@"plist"];
        NSDictionary *plistDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        
        NSDictionary *typsDict = [plistDict objectForKey:@"Types"];
        NSArray *keys = [[typsDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
        _typesList = [typsDict objectsForKeys:keys notFoundMarker:[NSDictionary dictionary]];
    }
    return _typesList;
}

+ (NSArray *)types
{
    NSArray *types = [MSCarModel typesList];
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dict in types) {
        NSArray *keys = [[dict allKeys] sortedArrayUsingSelector:@selector(compare:)];
        [array addObject:keys];
    }
    return array;
}

+ (NSArray *)subtypesOfType:(NSString *)type
{
    NSArray *types = [MSCarModel  typesList];
    for (NSDictionary *dict in types) {
        NSArray *array = [dict objectForKey:type];
        if (array) {
            return array;
        }
    }
    return nil;
}

+ (UIImage *)imageOfType:(NSString *)type
{
    NSString *imageName = [NSString stringWithFormat:@"%@.png", type];
    return [UIImage imageNamed:imageName];
}

+ (NSArray *)colorNames
{
    static NSArray *_colorNames;
    if (!_colorNames) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"CarType" ofType:@"plist"];
        NSDictionary *plistDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        _colorNames = [plistDict objectForKey:@"Colors"];
    }
    return _colorNames;
}

+ (UIImage *)imageOfColorName:(NSString *)colorName
{
    if (!colorName) {
        return nil;
    }
    NSString *imageName = [NSString stringWithFormat:@"color_%@.png", colorName];
    return [UIImage imageNamed:imageName];
}

#pragma mark

- (id)init
{
    if (self = [super init]) {
        self.carNumber = @"京A00000";
        self.colorName = [[MSCarModel colorNames] firstObject];
        self.numberOfSeat = 3;
    }
    return self;
}



#pragma mark JSON

//- (NSDictionary *)encodeToJSONDict
//{
//    NSMutableDictionary *JSONDict = [NSMutableDictionary dictionaryWithDictionary:[super encodeToJSONDict]];
    
//    [JSONDict setString:self.carNumber forKey:@"number"];
//    [JSONDict setString:self.type forKey:@"type"];
//    [JSONDict setString:self.subtype forKey:@"subtype"];
//    [JSONDict setString:self.colorName forKey:@"color_name"];
//    [JSONDict setInteger:self.numberOfSeat forKey:@"seat"];
    
//    return JSONDict;
//}

//- (void)decodeFromJSONDict:(NSDictionary *)JSONDict
//{
//    [super decodeFromJSONDict:JSONDict];
//    
//    NSString *number = [JSONDict stringForKey:@"number"];
//    if (number) {
//        self.carNumber = number;
//    }
//    NSString *type = [JSONDict stringForKey:@"type"];
//    if (type) {
//        self.type = type;
//    }
//    NSString *subtype = [JSONDict stringForKey:@"subtype"];
//    if (subtype) {
//        self.subtype = subtype;
//    }
//    NSString *colorName = [JSONDict stringForKey:@"color_name"];
//    if (colorName) {
//        self.colorName = colorName;
//    }
//    NSNumber *seat = [JSONDict numberForKey:@"seat"];
//    if (seat) {
//        self.numberOfSeat = seat.integerValue;
//    }
//}

#pragma mark Network

- (NSString *)resoucePath
{
    return @"cars";
}

- (NSArray *)postKeys
{
    return @[@"number",
             @"type",
             @"subtype",
             @"color_name",
             @"seat"];
}

- (NSArray *)putKeys
{
    return self.postKeys;
}

#pragma mark

- (UIImage *)typeImage
{
    return [MSCarModel imageOfType:self.type];
}

- (UIImage *)colorImage
{
    return [MSCarModel imageOfColorName:self.colorName];
}


@end
