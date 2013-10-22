//
//  PushCenterViewController.m
//  Shopping
//
//  Created by huanfang_liu on 13-10-18.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "PushCenterViewController.h"
#import "ChooseViewController.h"
#import "SetShowCell.h"
@interface PushCenterViewController ()

{
    UITableView * _shouTab;
}
@end

@implementation PushCenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.contentArry = [NSMutableArray arrayWithCapacity:2];
    }
    return self;
}
-(void)loadView
{
    self.view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.navigationItem.title = @"推送";
    self.tabBarItem.badgeValue = [ NSString stringWithFormat:@"%d",7];
    self.view.backgroundColor = [UIColor whiteColor];
    UISegmentedControl *pushSeg = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"折扣提醒",@"推送规则", nil]];
    [pushSeg setSelectedSegmentIndex:1];
    [pushSeg addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    
    pushSeg.frame = CGRectMake(20, 5, 280, 30);
    pushSeg.segmentedControlStyle = UISegmentedControlStyleBar;
    [self.view addSubview:pushSeg];
    [pushSeg release];
}
-(void)changeValue:(UISegmentedControl *)obj
{
    if (obj.selectedSegmentIndex==0) {
        UIAlertView * al =[[UIAlertView alloc]initWithTitle:@"暂无推送" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [al show];
        [al release];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIBarButtonItem * bar = [[UIBarButtonItem alloc]initWithTitle:@"添加规则" style:UIBarButtonItemStyleBordered target:self action:@selector(addThePushKeyWord)];
    [self.navigationItem setRightBarButtonItem:bar];
    [bar release];
    
    
    _shouTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 35, 320, 400) style:UITableViewStylePlain];
    [self.view addSubview:_shouTab];
    [_shouTab setDelegate:self];
    [_shouTab setDataSource:self];
}
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contentArry count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * mark =@"mmmmm";
    SetShowCell * cell = [tableView dequeueReusableCellWithIdentifier:mark];
    if (nil==cell) {
        cell = [[[SetShowCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mark] autorelease];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    if ([self.contentArry count]>0) {
        [cell.label1 setText:[NSString stringWithFormat:@"   关键字:   %@",[[self.contentArry objectAtIndex:indexPath.row] valueForKey:@"one"]]];
        [cell.label2 setText:[NSString stringWithFormat:@"   分类:     %@",[[self.contentArry objectAtIndex:indexPath.row] valueForKey:@"tow"]]];
        [cell.label3 setText:[NSString stringWithFormat:@"   品牌:     %@",[[self.contentArry objectAtIndex:indexPath.row] valueForKey:@"there"]]];

    }
    return cell;
}
-(void)addThePushKeyWord
{
    ChooseViewController * choose = [[ChooseViewController alloc]init];
    [choose setTitle:@"添加规则"];
    choose.category = @"全部";
    choose.brand = @"全部";
    choose.isShowDeleteButton = YES;
    [self.navigationController pushViewController:choose animated:YES];
    [choose release];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChooseViewController * choose = [[ChooseViewController alloc]init];
    [choose setIsShowDeleteButton:NO];
    
    choose.keyWord = [[self.contentArry objectAtIndex:indexPath.row] valueForKey:@"one"];
    choose.category = [[self.contentArry objectAtIndex:indexPath.row] valueForKey:@"tow"];
    choose.brand = [[self.contentArry objectAtIndex:indexPath.row] valueForKey:@"there"];
    [self.navigationController pushViewController:choose animated:YES];
    [choose release];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_shouTab reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
