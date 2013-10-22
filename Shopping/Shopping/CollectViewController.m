//
//  CollectViewController.m
//  Shopping
//
//  Created by huanfang_liu on 13-10-18.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "CollectViewController.h"
#import "MainCell.h"
@interface CollectViewController ()

@end

@implementation CollectViewController
- (void)dealloc
{
    [_refreshHeaderView release];
    [_refreshFooterView release];
    [collectTab release];
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
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    self.navigationItem.title = @"收藏";
    
    [self.navigationItem setRightBarButtonItem:self.editButtonItem];
    
    collectTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height-90) style:UITableViewStylePlain];
    collectTab.dataSource = self;
    collectTab.delegate = self;
    [self.view addSubview:collectTab];
    collectTab.showsVerticalScrollIndicator = NO;
    [self createHeaderView];
    [self setFooterView];
    

	// Do any additional setup after loading the view.
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
  

    [collectTab setEditing:editing animated:YES];
    [super setEditing:editing animated:YES];

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark--cell删除
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
#pragma mark--cell删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
       
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"取消收藏";
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reUseName = @"ues";
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseName];
    if (cell == nil) {
        cell = [[[MainCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reUseName] autorelease];
    }
    if (indexPath.row%3 == 0) {
        cell.fromLab.text = @"来自易讯商城";
        cell.goodsImg.image = [UIImage imageNamed:@"21-136-11028.png"];
    }else if (indexPath.row%2==0) {
        cell.goodsImg.image = [UIImage imageNamed:@"21-049-10217-01.png"];
        cell.fromLab.text = @"来自京东商城";
    }else
    {
        cell.goodsImg.image = [UIImage imageNamed:@"21-136-11028.png"];
        cell.fromLab.text = @"来自淘宝商城";
    }
    cell.titleLab.text = @"买$1000减$200优惠+免运费,买$1000减$200优惠+免运费,买$1000减$200优惠+免运费";
    cell.reviewLab.text =  @"7";
    cell.praiseLab.text = @"17";
    cell.updateTimeLab.text = @"一个小时前";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//初始化刷新视图
//＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
#pragma mark
#pragma methods for creating and removing the header view

-(void)createHeaderView{
    if (_refreshHeaderView && [_refreshHeaderView superview]) {
        [_refreshHeaderView removeFromSuperview];
    }
	_refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:
                          CGRectMake(0.0f, 0.0f - self.view.bounds.size.height,
                                     self.view.frame.size.width, self.view.bounds.size.height)];
    _refreshHeaderView.delegate = self;
    
	[collectTab addSubview:_refreshHeaderView];
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
    CGFloat height = MAX(collectTab.contentSize.height, collectTab.frame.size.height);
    if (_refreshFooterView && [_refreshFooterView superview]) {
        // reset position
        _refreshFooterView.frame = CGRectMake(0.0f,
                                              height,
                                              collectTab.frame.size.width,
                                              collectTab.bounds.size.height);
    }else {
        // create the footerView
        _refreshFooterView = [[EGORefreshTableFooterView alloc] initWithFrame:
                              CGRectMake(0.0f, height,
                                         collectTab.frame.size.width, self.view.bounds.size.height)];
        _refreshFooterView.delegate = self;
        [collectTab addSubview:_refreshFooterView];
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

#pragma mark-
#pragma mark force to show the refresh headerView
-(void)showRefreshHeader:(BOOL)animated{
	if (animated)
	{
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];
		collectTab.contentInset = UIEdgeInsetsMake(60.0f, 0.0f, 0.0f, 0.0f);
        // scroll the table view to the top region
        [collectTab scrollRectToVisible:CGRectMake(0, 0.0f, 1, 1) animated:NO];
        [UIView commitAnimations];
	}
	else
	{
        collectTab.contentInset = UIEdgeInsetsMake(60.0f, 0.0f, 0.0f, 0.0f);
		[collectTab scrollRectToVisible:CGRectMake(0, 0.0f, 1, 1) animated:NO];
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

#pragma mark -
#pragma mark method that should be called when the refreshing is finished
- (void)finishReloadingData{
	
	//  model should call this when its done loading
	_reloading = NO;
    
	if (_refreshHeaderView) {
        [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:collectTab];
    }
    
    if (_refreshFooterView) {
        [_refreshFooterView egoRefreshScrollViewDataSourceDidFinishedLoading:collectTab];
        [self setFooterView];
    }
    [collectTab reloadData];
    // overide, the actula reloading tableView operation and reseting position operation is done in the subclass
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	if (_refreshHeaderView) {
        [_refreshHeaderView egoRefreshScrollViewDidScroll:collectTab];
    }
	if (_refreshFooterView) {
        [_refreshFooterView egoRefreshScrollViewDidScroll:collectTab];
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
