//
//  ChooseViewController.m
//  Shopping
//
//  Created by huangfangwang on 13-10-22.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "ChooseViewController.h"
#import "CategoryViewController.h"
#import "PushCenterViewController.h"
@interface ChooseViewController ()
{
    UITableView * _tabView;
}

@end

@implementation ChooseViewController

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
	// Do any additional setup after loading the view.
    _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [_tabView setDelegate:self];
    [_tabView setDataSource:self];
    [self.view addSubview:_tabView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray * name = [NSArray arrayWithObjects:@"关键词",@"分类",@"品牌", nil];
    
    if (indexPath.row == 0) {
        NameCell * firstCell = [[[NameCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil] autorelease];
        [firstCell setDelegate:self];
        [firstCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        [firstCell.textLabel setText:[name objectAtIndex:indexPath.row]];
        [firstCell.nametext setText:self.keyWord];
        [firstCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        if (self.isShowDeleteButton) {
            [firstCell.nametext becomeFirstResponder];
        }
        return firstCell;
    }else{
        static NSString * mark = @"mark";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:mark];
        if (cell==nil) {
            cell =[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:mark] autorelease];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            
        }
        [cell.textLabel setText:[name objectAtIndex:indexPath.row]];
        [cell.detailTextLabel setText:@"ffffff"];
        switch (indexPath.row) {
            case 1:
                [cell.detailTextLabel setText:self.category];
                break;
                case 2:
                [cell.detailTextLabel setText:self.brand];
                break;
            default:
                break;
        }
    
        return cell;
    }
}
-(void)getWords:(NSString *)word
{
    self.keyWord = word;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
{
    return 100.0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
    [backView becomeFirstResponder];
    [backView setUserInteractionEnabled:YES];
    UIButton * saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [saveButton setShowsTouchWhenHighlighted:YES];
    [saveButton setBackgroundColor:[UIColor greenColor]];
    [saveButton setFrame:CGRectMake(10, 10, 300, 40)];;
    [backView addSubview:saveButton];
    [saveButton addTarget:self action:@selector(saveAndBack) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton * deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    [deleteButton setBackgroundColor:[UIColor redColor]];
    [deleteButton setShowsTouchWhenHighlighted:YES];
    [deleteButton setFrame:CGRectMake(10,60, 300, 40)];
    [deleteButton setHidden:self.isShowDeleteButton];//是否显示
    [backView addSubview:deleteButton];
    [deleteButton addTarget:self action:@selector(deleteOne) forControlEvents:UIControlEventTouchUpInside];
    return [backView autorelease];
}
-(void)saveAndBack
{
    PushCenterViewController * push = [self.navigationController.viewControllers objectAtIndex:0];
    NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithCapacity:2];
    if ([self.keyWord length]<1) {
        self.keyWord = @"Iphone";
    }
    [dic setValue:self.keyWord forKey:@"one"];
    [dic setValue:self.category forKey:@"tow"];
    [dic setValue:self.brand forKey:@"there"];
    [push.contentArry addObject:dic];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)deleteOne
{
    UIAlertView * alter =[[UIAlertView alloc]initWithTitle:@"确定删除?" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alter show];
    [alter release];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return;
    }
    CategoryViewController * cate = [[CategoryViewController alloc]init];
    switch (indexPath.row) {
        case 1:
            [cate setMark:YES];
            break;
            [cate setMark:NO];
        default:
            break;
    }
    [self.navigationController pushViewController:cate animated:YES];
    [cate release];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_tabView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
