//
//  FirstViewController.m
//  Shopping
//
//  Created by huanfang_liu on 13-10-21.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "FirstViewController.h"
#import "ContentViewController.h"
#import "ViewPagerController.h"
#import "SearchingViewController.h"
#import "ChildViewController.h"
@interface FirstViewController ()<ViewPagerDelegate,ViewPagerDataSource>


@end

@implementation FirstViewController
- (void)dealloc
{
    self.titleArry = nil;
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
- (void)viewDidLoad
{
    
    self.navigationItem.title = @"折扣汇";
    
    UIBarButtonItem *searBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(GgoToSearchPage)];
    self.navigationItem.leftBarButtonItem = searBar;
    [searBar release];
    
    UIBarButtonItem *cateBar = [[UIBarButtonItem alloc] initWithTitle:@"子类" style:UIBarButtonItemStyleDone target:self action:@selector(getChildCategory)];
    self.navigationItem.rightBarButtonItem = cateBar;
    [cateBar release];
    _selected = 0;
    
    self.dataSource = self;
    self.delegate = self;
    
        
    [super viewDidLoad];

	// Do any additional setup after loading the view.
}
-(void)GgoToSearchPage
{
    SearchingViewController *searchPage = [[SearchingViewController alloc] init];
    [self.navigationController pushViewController:searchPage animated:YES];
    [searchPage release];
    
}
-(void)getChildCategory
{
    if (_selected>=2) {
    ChildViewController *childCateGoryPage = [[ChildViewController alloc] init];
    [self.navigationController pushViewController:childCateGoryPage animated:YES];
    [childCateGoryPage release];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - ViewPagerDataSource
- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return 10;
}
- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    
    UILabel *label = [UILabel new];
    self.titleArry = [NSArray arrayWithObjects:@"最新",@"最热",@"服饰箱包",@"电子",@"美容保健",@"运动户外",@"家居",@"食品",@"旅游",@"金融", nil];
    label.text = [_titleArry objectAtIndex:index];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:13.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [label sizeToFit];
    return label;

    
}

- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    if (index==0) {
        ContentViewController *cvc = [[ContentViewController alloc] init];
        return [cvc autorelease];

        
    }
    ContentViewController *cvc = [[ContentViewController alloc] init];
    return [cvc autorelease];

}
- (void)viewPager:(ViewPagerController *)viewPager didChangeTabToIndex:(NSUInteger)index
{
    NSLog(@"didChanged");
    NSLog(@"当前的分类是:%@",[_titleArry objectAtIndex:index]);
    _selected = index;

}

#pragma mark - ViewPagerDelegate
- (CGFloat)viewPager:(ViewPagerController *)viewPager valueForOption:(ViewPagerOption)option withDefault:(CGFloat)value {
    
    switch (option) {
        case ViewPagerOptionStartFromSecondTab:
            return 1.0;
            break;
        case ViewPagerOptionCenterCurrentTab:
            return 0.0;
            break;
        case ViewPagerOptionTabLocation:
            return 1.0;
            break;
        default:
            break;
    }
    
    return value;
}
- (UIColor *)viewPager:(ViewPagerController *)viewPager colorForComponent:(ViewPagerComponent)component withDefault:(UIColor *)color {
    
    switch (component) {
        case ViewPagerIndicator:
            return [[UIColor redColor] colorWithAlphaComponent:0.64];
            break;
        default:
            break;
    }
    
    return color;
}

@end
