//
//  ContentViewController.h
//  Shopping
//
//  Created by huanfang_liu on 13-10-21.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)NSArray *detailCateGoryArry;
@end
