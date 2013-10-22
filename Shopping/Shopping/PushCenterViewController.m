//
//  PushCenterViewController.m
//  Shopping
//
//  Created by huanfang_liu on 13-10-18.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "PushCenterViewController.h"

@interface PushCenterViewController ()

@end

@implementation PushCenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
    pushSeg.frame = CGRectMake(20, 5, 280, 30);
    pushSeg.segmentedControlStyle = UISegmentedControlStyleBar;
    [self.view addSubview:pushSeg];
    [pushSeg release];
    UIBarButtonItem *addBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addThePushKeyWord)];
    self.navigationItem.rightBarButtonItem = addBar;

    [addBar release];
}
-(void)addThePushKeyWord
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
