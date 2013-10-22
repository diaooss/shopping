//
//  MyTabbar.m
//  Shopping
//
//  Created by huanfang_liu on 13-10-18.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "MyTabbar.h"
#import "FirstViewController.h"
#import "PushCenterViewController.h"
#import "CollectViewController.h"
#import "MoreViewController.h"
@interface MyTabbar ()

@end

@implementation MyTabbar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        /*/初始化控制标签/*/
        FirstViewController *homePage = [[[FirstViewController alloc] init] autorelease];
        UINavigationController *homePageNavc = [[[UINavigationController alloc] initWithRootViewController:homePage] autorelease];
        homePageNavc.tabBarItem.title = @"折扣";
        
        
        PushCenterViewController *pushPage = [[[PushCenterViewController alloc] init] autorelease];
        UINavigationController *pushPageNavc = [[[UINavigationController alloc] initWithRootViewController:pushPage] autorelease];
        pushPageNavc.tabBarItem.title = @"推送";
        CollectViewController *collectPage = [[[CollectViewController alloc] init] autorelease];
        UINavigationController *collectPageNavc = [[[UINavigationController alloc] initWithRootViewController:collectPage] autorelease];
        collectPageNavc.tabBarItem.title = @"收藏";
        
        MoreViewController *morePage = [[[MoreViewController alloc] init]autorelease];
        UINavigationController *morePageNavc = [[[UINavigationController alloc] initWithRootViewController:morePage] autorelease];
        morePageNavc.tabBarItem.title = @"更多";
        NSArray *controllersArry = [NSArray arrayWithObjects:homePageNavc,pushPageNavc,collectPageNavc,morePageNavc, nil];
        self.viewControllers = controllersArry;
        [homePageNavc.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tabbar_deals_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"tabbar_deals.png"]];
        [pushPageNavc.tabBarItem  setFinishedSelectedImage:[UIImage imageNamed:@"tabbar_subscribe_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"tabbar_subscribe.png"]];
        [collectPageNavc.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tabbar_favorites_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"tabbar_favorites.png"]];
        
        [morePageNavc.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tabbar_more_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"tabbar_more.png"]];

    }
    
    
    
    return self;
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
