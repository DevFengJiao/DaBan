//
//  MSCarTypeViewController.m
//  Moses
//
//  Created by soresult on 13-9-6.
//  Copyright (c) 2013年 soresult. All rights reserved.
//

#import "MSCarTypeViewController.h"

#import "MSTableViewCell.h"

@interface MSCarTypeViewController ()

@property (nonatomic, copy) NSString *seletedType;
@property (nonatomic, copy) NSString *seletedSubtype;

@property (nonatomic, retain) NSArray *typs;
@property (nonatomic, retain) NSArray *subtyps;

@end

@implementation MSCarTypeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"车辆类型", nil);
        self.typs = [MSCar types];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[MSTableViewCell class]
           forCellReuseIdentifier:@"Cell"];
    [self.subTypeTableView registerClass:[MSTableViewCell class]
           forCellReuseIdentifier:@"Cell"];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.subTypeTableView.layer.shadowRadius = 10.0f;
    self.subTypeTableView.layer.shadowOpacity = 0.75f;
    self.subTypeTableView.clipsToBounds = NO;
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setSubTypeTableView:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_car release];
    [_seletedType release];
    [_seletedSubtype release];
    [_typs release];
    [_subtyps release];
    [_tableView release];
    [_subTypeTableView release];
    [super dealloc];
}

#pragma mark UITableViewDelegate, UITableViewDataSource

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        CGRect r = self.subTypeTableView.frame;
        r.origin.x = CGRectGetWidth(self.view.bounds);
        
//        [UIView animateWithDuration:kAnimationDuration animations:^{
            self.subTypeTableView.frame = r;
//        }];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.subTypeTableView) {
        return self.subtyps.count;
    }
    return self.typs.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.subTypeTableView) {
        return [[self.subtyps objectAtIndex:section] count];
    }
    return [[self.typs objectAtIndex:section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)] autorelease];
    label.backgroundColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:0.5];
    label.textColor = [UIColor darkGrayColor];

    if (tableView != self.subTypeTableView) {
        label.text = [NSString stringWithFormat:@"   %c", section + 'A'];
    } else {
        label.text = self.seletedType;
        label.textAlignment = NSTextAlignmentCenter;
    }
    return label;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (tableView == self.subTypeTableView) {
        return nil;
    }
    NSMutableArray *titles = [NSMutableArray array];
    for (char c = 'A'; c <= 'Z'; c++) {
        [titles addObject:[NSString stringWithFormat:@"%c", c]];
    }
    return titles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    MSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (tableView == self.subTypeTableView) {
        
        [cell setTitleWithCellTitles:self.subtyps indexPath:indexPath];
        [cell setPositionWithCellTitles:self.subtyps indexPath:indexPath];
        
        cell.type = MSTableViewCellAccessoryTypeNone;
        cell.imageView.image = nil;
    } else {
        NSLog(@"indexPath--%@",indexPath);
        [cell setTitleWithCellTitles:self.typs indexPath:indexPath];
        [cell setPositionWithCellTitles:self.typs indexPath:indexPath];
        cell.type = MSTableViewCellAccessoryTypeDetail;
        cell.imageView.image = [MSCar imageOfType:cell.textLabel.text];
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 43.5, SCREEN_WIDTH, 0.5)];
        line.backgroundColor = LINEE;
        [cell.contentView addSubview:line];
        
    }
        
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (tableView == self.subTypeTableView) {
        self.seletedSubtype = cell.textLabel.text;
        self.car.type = self.seletedType;
        self.car.subtype = self.seletedSubtype;
        
        if (self.delegate&& [self.delegate respondsToSelector:@selector(MSCarString:andCarSubType:)]) {
            [self.delegate MSCarString:self.seletedType andCarSubType:self.seletedSubtype];
        }

        [self.navigationController popViewControllerAnimated:YES];
    } else {
        self.seletedType = cell.textLabel.text;
        self.subtyps = @[[MSCar subtypesOfType:self.seletedType]];
        [self.subTypeTableView reloadData];
        
        CGRect r = self.subTypeTableView.frame;
        r.origin.x = CGRectGetWidth(self.view.bounds) - CGRectGetWidth(r);
        
//        [UIView animateWithDuration:kAnimationDuration animations:^{
            self.subTypeTableView.frame = r;
//        }];
    }
    
    
}

@end
