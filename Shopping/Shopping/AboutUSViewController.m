//
//  AboutUSViewController.m
//  Shopping
//
//  Created by huanfang_liu on 13-10-22.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "AboutUSViewController.h"

@interface AboutUSViewController ()

@end

@implementation AboutUSViewController

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
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"关于我们";
    
    UIImageView *resultImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height-110)];
    resultImg.userInteractionEnabled = YES;
    resultImg.image = [UIImage  imageNamed:@"Default.png"];
    resultImg.tag = 1000;
    [self.view addSubview:resultImg];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(80, 250, 160, 60);
    [btn setTitleColor:[[UIColor greenColor] colorWithAlphaComponent:0.6] forState:UIControlStateNormal];
    [btn setTitle:@"版本更新" forState:UIControlStateNormal];
    [resultImg addSubview:btn];
    btn.showsTouchWhenHighlighted = YES;
    [btn addTarget:self action:@selector(checkVersions) forControlEvents:UIControlEventTouchUpInside];
    
    [resultImg release];

	// Do any additional setup after loading the view.
}

-(void)checkVersions
{
    UIAlertView *tips = [[[UIAlertView alloc] initWithTitle:nil message:@"😊已是最新版." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] autorelease];
    [tips show];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
