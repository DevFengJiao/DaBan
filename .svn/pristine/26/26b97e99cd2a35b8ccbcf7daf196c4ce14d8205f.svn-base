//
//  MSTableViewCell.m
//  Moses
//
//  Created by soresult on 13-8-28.
//  Copyright (c) 2013年 soresult. All rights reserved.
//

#import "MSTableViewCell.h"
#import "Colours.h"
#import <QuartzCore/QuartzCore.h>
#import "MSSwitch.h"

@interface MSTableViewCell ()

@property (nonatomic, retain) NSMutableArray *detailImageViews;
@property (nonatomic, retain) UIImageView *detailImageView;

@end

@implementation MSTableViewCell

+ (CGFloat)heightOfCell
{
    return 44;
}

+ (CGFloat)heightOfCellForDetailText:(NSString *)text
{
    CGFloat height = 0;
    UIFont *cellFont = [UIFont systemFontOfSize:15];
    CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
    CGSize labelSize = [text sizeWithFont:cellFont
                        constrainedToSize:constraintSize
                            lineBreakMode:NSLineBreakByCharWrapping];
    height = labelSize.height + 38;
    if (height < [MSTableViewCell heightOfCell]) {
        height = [MSTableViewCell heightOfCell];
    }
    
    return height;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.style = MSTableViewCellStyleNone;
}

- (void)setup
{
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.textColor = self.tintColor = ZIGRAY;
    self.textLabel.font = [UIFont boldSystemFontOfSize:17];
    
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.textColor = [UIColor colorWithRed:132/255.0 green:134/255.0 blue:135/255.0 alpha:1.0];
    self.detailTextLabel.font = [UIFont systemFontOfSize:15];
    self.detailTextLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.detailTextLabel.numberOfLines = 0;

    self.detailImageViews = [NSMutableArray array];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if (self.type == MSTableViewCellAccessoryTypeNone) {
        selected = NO;
    }
    [super setSelected:selected animated:animated];

    self.textLabel.highlighted = NO;
    self.detailTextLabel.highlighted = NO;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    if (self.type == MSTableViewCellAccessoryTypeNone) {
        highlighted = NO;
    }
    [super setHighlighted:highlighted animated:animated];
    
    self.textLabel.highlighted = NO;
    self.detailTextLabel.highlighted = NO;
}

- (void)setFrame:(CGRect)frame
{
    if (!IOS7) {
        frame = CGRectInset(frame, 8, 0);
    }
    [super setFrame:frame];
}

- (void)dealloc
{
    [_detailImageViews release];
    [_detailImages release];
    [_detailImageView release];
    [_detailImage release];
    [super dealloc];
}

#pragma mark Setter

- (void)setType:(MSTableViewCellAccessoryType)type
{
    _type = type;
    
    if (_type == MSTableViewCellAccessoryTypeNone) {
        self.accessoryView = nil;
    } else if (_type == MSTableViewCellAccessoryTypeSwitch) {
        UISwitch *switcher = [[[MSSwitch alloc] init] autorelease];
        self.accessoryView = switcher;
    } else {
        CGRect r = self.bounds;
        r.size.width = 20;
        if (_type == MSTableViewCellAccessoryTypeSelected) {
            r.size.width = 30;
        }
        NSString *imageName = nil;
        switch (_type) {
            case MSTableViewCellAccessoryTypeNone:
            case MSTableViewCellAccessoryTypeUnselected:
                break;
            case MSTableViewCellAccessoryTypeDetail:
                imageName = @"cell_type_detail.png";
                break;
            case MSTableViewCellAccessoryTypeSelected:
                imageName = @"cell_type_selected.png";
                break;
            case MSTableViewCellAccessoryTypeDot:
                imageName = @"cell_type_dot.png";
                break;
            case MSTableViewCellAccessoryTypeUndot:
                imageName = @"cell_type_undot.png";
                break;
            case MSTableViewCellAccessoryTypeCheck:
                imageName = @"cell_type_check.png";
                break;
            case MSTableViewCellAccessoryTypeUncheck:
                imageName = @"cell_type_uncheck.png";
                break;
            default:
                break;
        }
        
        UIImageView *imageView = [[[UIImageView alloc] initWithFrame:r] autorelease];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin;
        imageView.image = [UIImage imageNamed:imageName];
        if (IOS7) {
            imageView.contentMode = UIViewContentModeLeft;
        } else {
            imageView.contentMode = UIViewContentModeRight;
        }
        self.accessoryView = imageView;
    }
}

- (void)setStyle:(MSTableViewCellStyle)style
{
    _style = style;
    
    NSString *imageName = nil;
    NSString *hlImageName = nil;

    switch (_style) {
        case MSTableViewCellStyleNone:
            
            break;
        case MSTableViewCellStyleSingleLine:
            imageName = @"cell_bg_line.png";
            hlImageName = @"cell_bg_line_hl.png";
            break;
        case MSTableViewCellStyleTop:
            imageName = @"cell_bg_top.png";
            hlImageName = @"cell_bg_top_hl.png";
            break;
        case MSTableViewCellStyleMiddle:
            imageName = @"cell_bg_mid.png";
            hlImageName = @"cell_bg_mid_hl.png";
            break;
        case MSTableViewCellStyleBottom:
            imageName = @"cell_bg_bottom.png";
            hlImageName = @"cell_bg_bottom_hl.png";
            break;
        default:
            break;
    }
    
    UIImage *image = [[UIImage imageNamed:imageName] stretchableImageWithLeftCapWidth:152 topCapHeight:22];
    UIImage *hlImage = [[UIImage imageNamed:hlImageName] stretchableImageWithLeftCapWidth:152 topCapHeight:22];
    self.backgroundView = [[[UIImageView alloc] initWithImage:image] autorelease];
    self.selectedBackgroundView = [[[UIImageView alloc] initWithImage:hlImage] autorelease];
}

- (void)setTitleWithCellTitles:(NSArray *)titles indexPath:(NSIndexPath *)indexPath
{
 
    self.textLabel.text = [[titles objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
}

- (void)setPositionWithCellTitles:(NSArray *)titles
                        indexPath:(NSIndexPath *)indexPath
{
    NSArray *section = [titles objectAtIndex:indexPath.section];
    if (section.count == 1) {
        self.style = MSTableViewCellStyleSingleLine;
    } else if (indexPath.row == 0) {
        self.style = MSTableViewCellStyleTop;
    } else if (indexPath.row == section.count - 1) {
        self.style = MSTableViewCellStyleBottom;
    } else {
        self.style = MSTableViewCellStyleMiddle;
    }
}

- (void)setDetailImages:(NSArray *)detailImages
{
    if (_detailImages != detailImages) {
        [_detailImages release];
        _detailImages = [detailImages retain];
        
        for (UIImageView *iv in self.detailImageViews) {
            [iv removeFromSuperview];
        }
        [self.detailImageViews removeAllObjects];
        
        CGRect bounds = self.contentView.bounds;
        CGFloat width = 16;
        CGFloat space = 5;
        CGRect r = CGRectMake(CGRectGetWidth(bounds) - space,
                              CGRectGetMidY(bounds) - width / 2,
                              width,
                              width);
        for (int i = 0; i < _detailImages.count; i++) {
            UIImage *image = [_detailImages objectAtIndex:_detailImages.count - i - 1];
            UIImageView *iv = [[[UIImageView alloc] initWithImage:image] autorelease];
            r.origin.x -= width + space;
            iv.frame = r;
            iv.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
            [self.contentView addSubview:iv];
            [self.detailImageViews addObject:iv];
        }
    }
}

- (void)setDetailImage:(UIImage *)detailImage
{
    if (_detailImage != detailImage) {
        [_detailImage release];
        _detailImage = [detailImage retain];
        
        if (!self.detailImageView) {
            CGRect r = self.contentView.bounds;
            r.origin.x = CGRectGetWidth(r) - CGRectGetHeight(r);
            r.size.width = CGRectGetHeight(r);
            self.detailImageView = [[[UIImageView alloc] initWithFrame:r] autorelease];
            self.detailImageView.contentMode = UIViewContentModeCenter;
            self.detailImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
            [self.contentView addSubview:self.detailImageView];
        }
        self.detailImageView.image = _detailImage;
    }
}

@end
