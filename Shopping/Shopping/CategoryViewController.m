//
//  CategoryViewController.m
//  Shopping
//
//  Created by huangfangwang on 13-10-22.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "CategoryViewController.h"
#import "ChooseViewController.h"
@interface CategoryViewController ()
{
    NSMutableArray * _nameArry1;
    NSMutableArray * _nameArry2;
}
@end

@implementation CategoryViewController

-(void)dealloc
{
    [_nameArry1 release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    _nameArry1  = [[NSMutableArray arrayWithObjects:@"全部",@"服饰箱包",@"美容保健",@"珠宝首饰",@"日用杂货",@"家具电器",@"电子数码",@"运动户外",@"母婴儿童",@"书籍影视", nil] retain];
    _nameArry2  = [[NSMutableArray arrayWithObjects:@"全部",@"CK",@"IPhone",@"华为",@"特步",@"老板牌",@"三星",@"骆驼", nil] retain];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UITableView * tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:tabView];
    [tabView setDelegate:self];
    [tabView setDataSource:self];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.mark) {
        return [_nameArry1 count];
    }return [_nameArry2 count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * mark = @"m";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:mark];
    if (cell==nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:mark] autorelease];
    }
    if (self.mark) {
        [cell.textLabel setText:[_nameArry1 objectAtIndex:indexPath.row]];
    }else{
        [cell.textLabel setText:[_nameArry2 objectAtIndex:indexPath.row]];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    ChooseViewController * choose = [[self.navigationController viewControllers] objectAtIndex:1];
    if (self.mark) {
        [choose setCategory:cell.textLabel.text];
    }else
    {
        [choose setBrand:cell.textLabel.text];
    }
    [self.navigationController popToViewController:choose animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
