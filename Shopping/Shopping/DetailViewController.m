//
//  DetailViewController.m
//  Shopping
//
//  Created by huanfang_liu on 13-10-22.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIViewAdditions.h"
@interface DetailViewController ()

@end

@implementation DetailViewController
- (void)dealloc
{
    [detailTab release];
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
-(void)loadView
{
    self.view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.view.backgroundColor = [UIColor yellowColor];
    detailTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320,self.view.bounds.size.height-112) style:UITableViewStylePlain];
    detailTab.delegate = self;
    detailTab.dataSource = self;
    [self.view addSubview:detailTab];
    /*/配置toolbar/*/
    UIToolbar *toolsView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, detailTab.bottom, 320, self.view.height-detailTab.height-44)];
    
    UIButton *reviewBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    
    reviewBtn.frame = CGRectMake(10, 2, 28, 28);
    [reviewBtn setBackgroundImage:[UIImage imageNamed:@"toolbar_comment_ios6.png"] forState:UIControlStateNormal];
    UIBarButtonItem *revireBar = [[[UIBarButtonItem alloc] initWithCustomView:reviewBtn] autorelease];
    
    [toolsView setItems:[NSArray arrayWithObjects:revireBar, nil] animated:YES];
    [self.view addSubview:toolsView];
    [toolsView release];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
#pragma mark--tableviewcell的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    if (section == 0) {
        return 0;
    }
    return 35;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    UIView *headerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 35)] autorelease];
//    headerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"category_tabbar_background.png"]];
    UILabel *dLab = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 35)] autorelease];
    dLab.text = @"    评论";
    dLab.font = [UIFont systemFontOfSize:15];
    dLab.textAlignment = NSTextAlignmentLeft;
    dLab.layer.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.4].CGColor;
    dLab.layer.borderWidth = 0.3;
    [headerView addSubview:dLab];
   
    UIImageView *bgImg = [[[UIImageView alloc] initWithFrame:CGRectMake(30, 27, 14, 8)] autorelease];
    [headerView addSubview:bgImg];
    bgImg.image = [UIImage imageNamed:@"comment_arrow.png"];
    
    return headerView;
    

    
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseName = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseName];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseName] autorelease];
    }
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.imageView.image = [UIImage imageNamed:@"8.png"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            case 1:
                cell.textLabel.text = @"多点触摸屏第三代核心显卡无线/HD高清摄像头USB3.0/Win8i3-3217/4G/500G商品名字,描述等";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            case 2:
                cell.textLabel.text = @"商品的详细描述等";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

                break;
            default:
                break;
        }
    }
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
