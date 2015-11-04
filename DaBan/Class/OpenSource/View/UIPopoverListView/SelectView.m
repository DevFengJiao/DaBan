//
//  CreateTripViewController.m
//  LingYou
//
//  Created by sky on 15-2-10.
//  Copyright (c) 2015年 sky. All rights reserved.
//

#import "SelectView.h"
#import "DefineString.h"
#import "Defines.h"

@interface SelectView ()<UITableViewDataSource, UITableViewDelegate>
{
    NSString *lineID ;
}
@end

@implementation SelectView

- (void)setMaskLayer
{
    // 遮罩层
    CALayer * maskLayer =[CALayer layer];
    [maskLayer setFrame:CGRectMake(0, _mainTableView.frame.origin.y + _mainTableView.frame.size.height, self.frame.size.width, self.frame.size.height - _mainTableView.frame.origin.y - _mainTableView.frame.size.height)];
    maskLayer.backgroundColor = [UIColor blackColor].CGColor ;
    
    maskLayer.opacity = 0.5;
    
//    [self.layer addSublayer:maskLayer];
}

- (instancetype)initWithFrame:(CGRect)frame andSelectBlock: (SelectBlock)selectBlock
{
    
    self.backgroundColor = [UIColor whiteColor];
    self = [super initWithFrame: frame];
    
    if (self)
    {
        _selectBlock = selectBlock;
    }
    return self;
}

- (void) setMainTableView
{
    _mainTableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, self.frame.size.width, _datasource.count * 44) style: UITableViewStylePlain];
    
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview: _mainTableView];
    
    _mainTableView.dataSource = self;
    _mainTableView.delegate = self;
    
    [_mainTableView selectRowAtIndexPath: _blockDictionary[@"index"] animated: YES scrollPosition: UITableViewScrollPositionMiddle];
    
    [_mainTableView scrollToRowAtIndexPath: _blockDictionary[@"index"]  atScrollPosition: UITableViewScrollPositionMiddle animated: YES];
    
    // 遮罩层
    [self setMaskLayer];
}

#pragma mark---UITableViewDatasource 
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datasource.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellID];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: cellID];
        cell.selectedBackgroundView = [[UIView alloc] init];
        
        UILabel *label1 = [[UILabel alloc] initWithFrame: CGRectMake(0, cell.frame.size.height - 1, SCREEN_WIDTH , 0.3)];
        label1.backgroundColor = [UIColor redColor];
        [cell.selectedBackgroundView addSubview: label1];
        
        UILabel *label2 = [[UILabel alloc] initWithFrame: label1.frame];
        label2.backgroundColor = [UIColor lightGrayColor];
        
        [cell.contentView addSubview: label2];
        
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.highlightedTextColor = [UIColor redColor];
    }
    cell.textLabel.text = _datasource[indexPath.row];
    
    UILabel *label = [[UILabel alloc]init];
    lineID = _datasourceID[indexPath.row];
    label.text = lineID;
    [cell.contentView addSubview:label];
    
    return cell;
}

#pragma mark---UITableViewDelegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_selectBlock)
    {
        if (_blockDictionary == nil)
        {
            _blockDictionary = [[NSMutableDictionary alloc] init];
        }
        
        [_blockDictionary setObject: [tableView cellForRowAtIndexPath: indexPath].textLabel.text forKey: @"name"];
        [_blockDictionary setObject: [tableView cellForRowAtIndexPath:indexPath].contentView forKey: @"lineid"];
        
        [_blockDictionary setObject: indexPath forKey: @"index"];
        _selectBlock(_blockDictionary);
        [self removeFromSuperview];
    }
}



@end
