//
//  ContentViewController.h
//  Shopping
//
//  Created by huanfang_liu on 13-10-21.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableFooterView.h"
#import "EGORefreshTableHeaderView.h"
@protocol contentDelegate <NSObject>
-(void)postTheGoodsID:(NSString *)ID;//代理方法,让内容视图中的cell把值传递到外部视图中,以推进页面
@end
@interface ContentViewController : UIViewController<EGORefreshTableDelegate,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView *homeTab;
    //EGOHeader
    EGORefreshTableHeaderView *_refreshHeaderView;
    //EGOFoot
    EGORefreshTableFooterView *_refreshFooterView;
    //
    BOOL _reloading;//状态提示
}
@property(nonatomic,assign)id <contentDelegate> cellDelegate;//指定代理
@end

