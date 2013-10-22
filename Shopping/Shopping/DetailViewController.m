//
//  DetailViewController.m
//  Shopping
//
//  Created by huanfang_liu on 13-10-22.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    UITableView *detailTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320,self.view.bounds.size.height-44) style:UITableViewStylePlain];
    detailTab.delegate = self;
    detailTab.dataSource = self;
    [self.view addSubview:detailTab];
    [detailTab release];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }
    
    return 7;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
