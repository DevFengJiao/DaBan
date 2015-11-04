//
//  MSUserModel.m
//  DaBan
//
//  Created by qkm on 15-8-12.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSUserModel.h"
#import "NSDictionary+Utility.h"

@implementation MSUserModel

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.uid         = [dict intValueForKey:@"uid"];
        self.phone       = [dict stringForKey:@"phone"];
        self.name        = [dict stringForKey:@"name"];
        self.sex         = [dict intValueForKey:@"sex"];
        self.headImgUrl  = [dict stringForKey:@"head_imgurl"];
        self.carImgUrl   = [dict stringForKey:@"car_imgurl"];
        self.carColor    = [dict stringForKey:@"car_color"];
        self.carStyle    = [dict stringForKey:@"car_style"];
        self.carLicense  = [dict stringForKey:@"car_license"];
        self.verifyPhone = [dict intValueForKey:@"verify_phone"];
        self.verifyId    = [dict intValueForKey:@"verify_id"];
        self.verifyDriver= [dict intValueForKey:@"verify_driver_license"];
        self.realName    = [dict stringForKey:@"real_name"];
        self.numId       = [dict stringForKey:@"num_id_license"];
        self.imgurlId    = [dict stringForKey:@"imgurl_id"];
        self.imgurlDriver = [dict stringForKey:@"imgurl_driver_licence"];
        self.imgurlVehical = [dict stringForKey:@"imgurl_vihical_lincence"];
        
    }
    
    return self;
}

@end
