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
#import "DetailViewController.h"
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
    self.tabBarItem.badgeValue = @"1";
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
}
#pragma mark--前往搜索页面
-(void)GgoToSearchPage
{
    SearchingViewController *searchPage = [[SearchingViewController alloc] init];
    [self.navigationController pushViewController:searchPage animated:YES];
    [searchPage release];
}
#pragma mark--二级分类页面
-(void)getChildCategory
{
    if (_selected>=2) {
    ChildViewController *childCateGoryPage = [[ChildViewController alloc] init];
        childCateGoryPage.navigationItem.title = [_titleArry objectAtIndex:_selected];
        switch (_selected) {
            case 2:
                childCateGoryPage.detailCateGoryArry = [NSArray arrayWithObjects: @"箱包",@"衣服鞋子",nil];
                break;
            case 3:
                childCateGoryPage.detailCateGoryArry = [NSArray arrayWithObjects: @"美容护肤",@"保健品",nil];
                break;
            case 4:
                childCateGoryPage.detailCateGoryArry = [NSArray arrayWithObjects: @"珠宝",@"手表",@"配饰",nil];
                break;
            case 5:
                childCateGoryPage.detailCateGoryArry = [NSArray arrayWithObjects: @"浴室用品",@"厨房用品",@"吸尘储物",@"床上用品",nil];
                break;
            case 6:
                childCateGoryPage.detailCateGoryArry = [NSArray arrayWithObjects: @"家用电器",@"家具装饰",nil];
                break;
            case 7:
                childCateGoryPage.detailCateGoryArry = [NSArray arrayWithObjects: @"手机",@"平板电脑",@"电脑整机",@"外设及配件",@"照相摄像",@"游戏设备",@"家庭影音",nil];
                break;
            case 8:
                childCateGoryPage.detailCateGoryArry = [NSArray arrayWithObjects: @"家用运动设备",@"户外设备",nil];
                break;
            case 9:
                childCateGoryPage.detailCateGoryArry = [NSArray arrayWithObjects: @"婴儿食品",@"母婴用品",@"益智玩具",@"服饰鞋帽",nil];
                break;
            case 10:
                childCateGoryPage.detailCateGoryArry = [NSArray arrayWithObjects: @"书籍",@"影视",@"音乐",nil];
                break;
            default:
                break;
        }
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
    return 11;
}
#pragma mark--在此设定一级分类title
- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index {
    UILabel *label = [UILabel new];
    self.titleArry = [NSArray arrayWithObjects:@"最新",@"最热",@"服饰箱包",@"美容保健",@"珠宝首饰",@"日用百货",@"家具电器",@"电子数码",@"运动户外",@"母婴儿童",@"书籍影视", nil];
    label.text = [_titleArry objectAtIndex:index];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:13.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [label sizeToFit];
    return label;
}
#pragma mark--此处设置选择一级标题后 内容页面的内容切换和展示
- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    if (index==0) {
        ContentViewController *contentPage = [[ContentViewController alloc] init];
        contentPage.cellDelegate = self;
        return [contentPage autorelease];
    }
    ContentViewController *contentPage = [[ContentViewController alloc] init];
    contentPage.cellDelegate = self;
    return [contentPage autorelease];
}
#pragma mark--通过代理获得cell对应的商品ID信息
-(void)postTheGoodsID:(NSString *)ID
{
    NSLog(@"代理值是:%@",ID);
    DetailViewController *detailPage = [[DetailViewController alloc] init];
    detailPage.navigationItem.title = ID;
    detailPage.hidesBottomBarWhenPushed = YES;
   [self.navigationController pushViewController:detailPage animated:YES];
    [detailPage release];
}
#pragma mark--一级标题变动时的监督
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
