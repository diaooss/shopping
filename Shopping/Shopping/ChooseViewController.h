//
//  ChooseViewController.h
//  Shopping
//
//  Created by huangfangwang on 13-10-22.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NameCell.h"

@interface ChooseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,NameCellDeletage>
@property (nonatomic,copy)NSString * keyWord;//关键词
@property (nonatomic,copy)NSString * category;//分类
@property (nonatomic,copy)NSString * brand;//品牌
@property(nonatomic,assign)BOOL isShowDeleteButton;

@end
