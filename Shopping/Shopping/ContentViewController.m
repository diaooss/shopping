//
//  ContentViewController.m
//  Shopping
//
//  Created by huanfang_liu on 13-10-21.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "ContentViewController.h"
#import "MainCell.h"
@interface ContentViewController ()
@end
@implementation ContentViewController
- (void)dealloc
{
    [_refreshFooterView release];
    [homeTab release];

    [_refreshHeaderView  release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    homeTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height-120) style:UITableViewStylePlain];
    homeTab.dataSource = self;
    homeTab.delegate = self;
    [self.view addSubview:homeTab];
    homeTab.showsVerticalScrollIndicator = NO;
    [self createHeaderView];
    [self setFooterView];
    
}
#pragma mark--tableviewcell的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reUseName = @"ues";
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseName];
    if (cell == nil) {
        cell = [[[MainCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reUseName] autorelease];
    }
    int flag = indexPath.row%7;
    switch (flag) {
        case 0:
            cell.fromLab.text = @"来自易讯商城";
            cell.titleLab.text = @"折扣汇尊享:低至五折,买1000立减100,更有超值豪礼等您来拿.";
            break;
        case 1:
            cell.titleLab.text = @"1449.99包邮:最高减$200+大礼包满$500减$75,买$1000减$200优惠+免运费";
            cell.fromLab.text = @"来自京东商城";
            break;
        case 2:
            cell.titleLab.text = @"光棍节狂欢:最高减$200+大礼包满$500减$75,买$1000减$200优惠+免运费";
            cell.fromLab.text = @"来自淘宝商城";
            break;
        case 3:
            cell.fromLab.text = @"来自一号店";
            cell.titleLab.text = @"何止是包邮:爱上一匹野马,只能没有草原,11.11日,数码百货,低至一折,全民狂欢";
            break;
        case 4:
            cell.fromLab.text = @"来自苏宁易购";
            cell.titleLab.text = @"对不起,是我们太便宜!全场五折封顶!部分商品,买一送一!全场买$1000减$200优惠+免运费";
            break;
        case 5:
            cell.fromLab.text = @"来自国美在线";
            cell.titleLab.text = @"折扣汇:自营家电百货,最高减$200+大礼包,全场免运费";
            break;
        case 6:
            cell.fromLab.text = @"来自折扣汇自营";
            cell.titleLab.text = @"折扣汇:全新ipad air ipadmini视网膜版,全球同步预售开启,即刻预定,立减$200+配件大礼包,支持货到付款.";
            break;

        default:
            break;
    }
    int index = indexPath.row%10;
    NSString *imageName = [NSString stringWithFormat:@"%d.png",index];
    cell.imageView.image  = [UIImage imageNamed:imageName];
    cell.reviewLab.text =  @"7";
    cell.praiseLab.text = @"17";
    cell.updateTimeLab.text = @"一个小时前";
    return cell;
}
#pragma mark--选中cell触发,代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellDelegate &&[self.cellDelegate respondsToSelector:@selector(postTheGoodsID:)]) {
        [self.cellDelegate postTheGoodsID:@"商品ID信息"];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//初始化刷新视图
//＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
#pragma methods for creating and removing the header view
-(void)createHeaderView{
    if (_refreshHeaderView && [_refreshHeaderView superview]) {
        [_refreshHeaderView removeFromSuperview];
    }
	_refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:
                          CGRectMake(0.0f, 0.0f - self.view.bounds.size.height,
                                     self.view.frame.size.width, self.view.bounds.size.height)];
    _refreshHeaderView.delegate = self;
	[homeTab addSubview:_refreshHeaderView];
    [_refreshHeaderView refreshLastUpdatedDate];
}
-(void)removeHeaderView{
    if (_refreshHeaderView && [_refreshHeaderView superview]) {
        [_refreshHeaderView removeFromSuperview];
    }
    _refreshHeaderView = nil;
}
-(void)setFooterView{
    // if the footerView is nil, then create it, reset the position of the footer
    CGFloat height = MAX(homeTab.contentSize.height, homeTab.frame.size.height);
    if (_refreshFooterView && [_refreshFooterView superview]) {
        // reset position
        _refreshFooterView.frame = CGRectMake(0.0f,
                                              height,
                                              homeTab.frame.size.width,
                                              homeTab.bounds.size.height);
    }else {
        // create the footerView
        _refreshFooterView = [[EGORefreshTableFooterView alloc] initWithFrame:
                              CGRectMake(0.0f, height,
                                         homeTab.frame.size.width, self.view.bounds.size.height)];
        _refreshFooterView.delegate = self;
        [homeTab addSubview:_refreshFooterView];
    }
    if (_refreshFooterView) {
        [_refreshFooterView refreshLastUpdatedDate];
    }
}
-(void)removeFooterView{
    if (_refreshFooterView && [_refreshFooterView superview]) {
        [_refreshFooterView removeFromSuperview];
    }
    _refreshFooterView = nil;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}
#pragma mark force to show the refresh headerView
-(void)showRefreshHeader:(BOOL)animated{
	if (animated)
	{
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];
		homeTab.contentInset = UIEdgeInsetsMake(60.0f, 0.0f, 0.0f, 0.0f);
        // scroll the table view to the top region
        [homeTab scrollRectToVisible:CGRectMake(0, 0.0f, 1, 1) animated:NO];
        [UIView commitAnimations];
	}
	else
	{
        homeTab.contentInset = UIEdgeInsetsMake(60.0f, 0.0f, 0.0f, 0.0f);
		[homeTab scrollRectToVisible:CGRectMake(0, 0.0f, 1, 1) animated:NO];
	}
    
    [_refreshHeaderView setState:EGOOPullRefreshLoading];
}
//===============
//刷新delegate
#pragma mark -
#pragma mark data reloading methods that must be overide by the subclass

-(void)beginToReloadData:(EGORefreshPos)aRefreshPos{
	
	//  should be calling your tableviews data source model to reload
	_reloading = YES;
    
    if (aRefreshPos == EGORefreshHeader) {
        // pull down to refresh data
        [self performSelector:@selector(refreshView) withObject:nil afterDelay:2.0];
    }else if(aRefreshPos == EGORefreshFooter){
        // pull up to load more data
        [self performSelector:@selector(getNextPageView) withObject:nil afterDelay:2.0];
    }
	// overide, the actual loading data operation is done in the subclass
}
#pragma mark method that should be called when the refreshing is finished
- (void)finishReloadingData{
	//  model should call this when its done loading
	_reloading = NO;
	if (_refreshHeaderView) {
        [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:homeTab];
    }
    if (_refreshFooterView) {
        [_refreshFooterView egoRefreshScrollViewDataSourceDidFinishedLoading:homeTab];
        [self setFooterView];
    }
    [homeTab reloadData];
    // overide, the actula reloading tableView operation and reseting position operation is done in the subclass
}
#pragma mark UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	if (_refreshHeaderView) {
        [_refreshHeaderView egoRefreshScrollViewDidScroll:homeTab];
    }
	if (_refreshFooterView) {
        [_refreshFooterView egoRefreshScrollViewDidScroll:homeTab];
        [self setFooterView];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	if (_refreshHeaderView) {
        [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    }
	if (_refreshFooterView) {
        [_refreshFooterView egoRefreshScrollViewDidEndDragging:scrollView];
    }
}
#pragma mark EGORefreshTableDelegate Methods
- (void)egoRefreshTableDidTriggerRefresh:(EGORefreshPos)aRefreshPos{
	
	[self beginToReloadData:aRefreshPos];
}
- (BOOL)egoRefreshTableDataSourceIsLoading:(UIView*)view{
	
	return _reloading; // should return if data source model is reloading
}
// if we don't realize this method, it won't display the refresh timestamp
- (NSDate*)egoRefreshTableDataSourceLastUpdated:(UIView*)view{
	return [NSDate date]; // should return date data source was last changed
}
//刷新调用的方法----------下拉刷新
-(void)refreshView{
        [self testFinishedLoadData];
}
//加载调用的方法----------上拉加载
-(void)getNextPageView{
    [self removeFooterView];
    [self testFinishedLoadData];
}-(void)testFinishedLoadData{
    [self finishReloadingData];
    [self setFooterView];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];//可以成功取消全部延迟方法。
}
@end
