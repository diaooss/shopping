//
//  DetailViewController.h
//  Shopping
//
//  Created by huanfang_liu on 13-10-22.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *detailTab;
}

@end
