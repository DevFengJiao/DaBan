//
//  MSTableViewCell.h
//  Moses
//
//  Created by soresult on 13-8-28.
//  Copyright (c) 2013年 soresult. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    MSTableViewCellStyleNone,
    MSTableViewCellStyleSingleLine,
    MSTableViewCellStyleTop,
    MSTableViewCellStyleMiddle,
    MSTableViewCellStyleBottom,
} MSTableViewCellStyle;

typedef enum {
    MSTableViewCellAccessoryTypeNone,
    MSTableViewCellAccessoryTypeDetail,
    MSTableViewCellAccessoryTypeSelected,
    MSTableViewCellAccessoryTypeUnselected,
    MSTableViewCellAccessoryTypeSwitch,
    MSTableViewCellAccessoryTypeDot,
    MSTableViewCellAccessoryTypeUndot,
    MSTableViewCellAccessoryTypeCheck,
    MSTableViewCellAccessoryTypeUncheck,
} MSTableViewCellAccessoryType;

@interface MSTableViewCell : UITableViewCell

+ (CGFloat)heightOfCell;
+ (CGFloat)heightOfCellForDetailText:(NSString *)text;

@property (nonatomic, assign) MSTableViewCellStyle style;
@property (nonatomic, assign) MSTableViewCellAccessoryType type;
@property (nonatomic, retain) NSArray *detailImages;
@property (nonatomic, retain) UIImage *detailImage;

- (void)setTitleWithCellTitles:(NSArray *)titles indexPath:(NSIndexPath *)indexPath;
- (void)setPositionWithCellTitles:(NSArray *)titles indexPath:(NSIndexPath *)indexPath;

@end
