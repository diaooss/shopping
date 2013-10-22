//
//  SearchingViewController.m
//  Shopping
//
//  Created by huanfang_liu on 13-10-21.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "SearchingViewController.h"

@interface SearchingViewController ()

@end

@implementation SearchingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidDisappear:(BOOL)animated
{
}
-(void)loadView
{
    self.view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    UISearchBar * searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    [searchBar setPlaceholder:@"搜索折扣..."];
    [searchBar setBarStyle:UIBarStyleDefault];
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
    [searchBar becomeFirstResponder];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    UIAlertView *tips = [[[UIAlertView alloc] initWithTitle:@"正在施工..." message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
    [tips show];
    
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    NSLog(@"正在增加%@",searchText);
}
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_AVAILABLE_IOS(3_0)
{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
