//
//  MSCar.m
//  Moses
//
//  Created by soresult on 13-8-17.
//  Copyright (c) 2013年 soresult. All rights reserved.
//

#import "MSCar.h"

@implementation MSCar

+ (NSArray *)typesList
{
    static NSArray *_typesList;
    if (!_typesList) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"CarType" ofType:@"plist"];
        NSDictionary *plistDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        
        NSDictionary *typsDict = [plistDict objectForKey:@"Types"];
        NSArray *keys = [[typsDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
        _typesList = [[typsDict objectsForKeys:keys notFoundMarker:[NSDictionary dictionary]] retain];
    }
    return _typesList;
}

+ (NSArray *)types
{
    NSArray *types = [MSCar typesList];
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dict in types) {
        NSArray *keys = [[dict allKeys] sortedArrayUsingSelector:@selector(compare:)];
        [array addObject:keys];
    }
    return array;
}

+ (NSArray *)subtypesOfType:(NSString *)type
{
    NSArray *types = [MSCar typesList];
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
        _colorNames = [[plistDict objectForKey:@"Colors"] retain];
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
        self.colorName = [[MSCar colorNames] firstObject];
        self.numberOfSeat = 3;
    }
    return self;
}

- (void)dealloc
{
    [_carNumber release];
    [_type release];
    [_subtype release];
    [_colorName release];
    [super dealloc];
}

#pragma mark JSON

//- (NSDictionary *)encodeToJSONDict
//{
//    NSMutableDictionary *JSONDict = [NSMutableDictionary dictionaryWithDictionary:[super encodeToJSONDict]];
//
//    [JSONDict setString:self.carNumber forKey:@"number"];
//    [JSONDict setString:self.type forKey:@"type"];
//    [JSONDict setString:self.subtype forKey:@"subtype"];
//    [JSONDict setString:self.colorName forKey:@"color_name"];
//    [JSONDict setInteger:self.numberOfSeat forKey:@"seat"];
//    
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
    return [MSCar imageOfType:self.type];
}

- (UIImage *)colorImage
{
    return [MSCar imageOfColorName:self.colorName];
}

@end
