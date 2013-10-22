//
//  ChildViewController.m
//  Shopping
//
//  Created by huanfang_liu on 13-10-21.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "ChildViewController.h"
#import "ContentViewController.h"

@interface ChildViewController ()<ViewPagerDelegate,ViewPagerDataSource>

@end

@implementation ChildViewController
- (void)dealloc
{
    self.detailCateGoryArry = nil;

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
    self.dataSource = self;
    self.delegate = self;
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - ViewPagerDataSource
- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager {
    return [_detailCateGoryArry count];
}
- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    
    UILabel *label = [UILabel new];
    label.text = [_detailCateGoryArry objectAtIndex:index];
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
