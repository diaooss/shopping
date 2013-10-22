//
//  CollectViewController.h
//  Shopping
//
//  Created by huanfang_liu on 13-10-18.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableFooterView.h"
#import "EGORefreshTableHeaderView.h"

@interface CollectViewController : UIViewController<EGORefreshTableDelegate,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView *collectTab;
    //EGOHeader
    EGORefreshTableHeaderView *_refreshHeaderView;
    //EGOFoot
    EGORefreshTableFooterView *_refreshFooterView;
    //
    BOOL _reloading;//状态提示
}

@end
