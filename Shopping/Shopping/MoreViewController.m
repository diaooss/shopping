//
//  MoreViewController.m
//  Shopping
//
//  Created by huanfang_liu on 13-10-18.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "MoreViewController.h"
#import "AboutUSViewController.h"
#import "FeedBackpage.h"
@interface MoreViewController ()

@end
@implementation MoreViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"更多";
    UITableView *setTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height-50) style:UITableViewStyleGrouped];
    setTab.dataSource = self;
    setTab.delegate = self;
    [self.view addSubview:setTab];
    setTab.showsVerticalScrollIndicator = NO;
    [setTab release];
	// Do any additional setup after loading the view.
}
#pragma mark--tableviewcell的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0||section==1) {
        return 2;
    }
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseName = @"use";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseName];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseName] autorelease];
    }
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"清除缓存";
                break;
            case 1:
                cell.textLabel.text = @"字体颜色";
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"推送设置";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                UISwitch *s = [[UISwitch alloc] initWithFrame:CGRectMake(210, 10, 0, 0)];
                [cell.contentView addSubview:s];
                s.on = YES;
                [s addTarget:self action:@selector(isGetNotifation:) forControlEvents:UIControlEventValueChanged];
                [s release];
                break;
            case 1:
                cell.textLabel.text = @"意见反馈";
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"给个好评";
                break;
            case 1:
                cell.textLabel.text = @"更多应用";
                break;
            case 2:
                cell.textLabel.text = @"关于我们";
                break;
            default:
                break;
        }
    }
    return cell;
}
#pragma mark--点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                [self clearCacheData];
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 1:
                [self goToFeedBack];
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
                [self givePraise];
                break;
            case 2:
                [self goToAboutUSPage];
                break;
            default:
                break;
        }
    }
}
#pragma mark--清除缓存
-(void)clearCacheData
{
    UIAlertView *tips = [[[UIAlertView alloc] initWithTitle:nil message:@"清除缓存?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil] autorelease];
    [tips show];
}
#pragma mark--推送设置
-(void)isGetNotifation:(UISwitch *)sender
{
    if (sender.on == YES) {
        UIAlertView *tips = [[[UIAlertView alloc] initWithTitle:nil message:@"已开启推送" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] autorelease];
        [tips show];
    }else
    {
        UIAlertView *tips = [[[UIAlertView alloc] initWithTitle:nil message:@"已关闭推送" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] autorelease];
        [tips show];
    }
}
#pragma mark--千万关于我们
-(void)goToAboutUSPage
{
    AboutUSViewController *usPage = [[AboutUSViewController alloc] init];
    [self.navigationController pushViewController:usPage animated:YES];
    [usPage release];
}
#pragma mark--意见反馈
-(void)goToFeedBack
{
    FeedBackpage *feed = [[FeedBackpage alloc] init];
    [self.navigationController pushViewController:feed animated:YES];
    [feed release];
}
#pragma mark--给个好评
-(void)givePraise
{
    NSString *url = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d",626186545];//评论
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}
#pragma mark--alertView的代理方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        UIAlertView *tips = [[[UIAlertView alloc] initWithTitle:nil message:@"已清除缓存" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] autorelease];
        [tips show];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
