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
- (void)dealloc
{
    [_searchBar release];
    [super dealloc];
}
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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"category_tabbar_background.png"]];
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    [_searchBar setPlaceholder:@"搜索折扣"];
    [_searchBar setBarStyle:UIBarStyleDefault];
    _searchBar.delegate = self;
    self.navigationItem.titleView = _searchBar;
    [_searchBar becomeFirstResponder];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
#pragma mark--执行搜索
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_searchBar resignFirstResponder];
    UIImageView *resultImg = [[UIImageView alloc] initWithFrame:CGRectMake(110, 30, 100, 100)];
    resultImg.image = [UIImage  imageNamed:@"logo.png"];
    resultImg.tag = 1000;
    [self.view addSubview:resultImg];
    [resultImg release];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(60, 140, 200, 20)];
    lab.text = @"海量折扣信息,即将上线...";
    lab.backgroundColor = [UIColor clearColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.tag = 2000;
    lab.textColor = [[UIColor redColor] colorWithAlphaComponent:0.6];
    [self.view addSubview:lab];
    [lab release];
   }
#pragma mark--搜索条正在被编辑时的监督
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"正在增加%@",searchText);
}
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_AVAILABLE_IOS(3_0)
{
    return YES;
}
#pragma mark--将要被填写内容时的监督
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    UIImageView *img =(UIImageView *) [self.view viewWithTag:1000];
    UILabel *l = (UILabel *)[self.view  viewWithTag:2000];
    [img removeFromSuperview];
    [l removeFromSuperview];
     return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
