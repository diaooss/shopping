//
//  MainCell.h
//  Shopping
//
//  Created by huanfang_liu on 13-10-22.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCell : UITableViewCell
@property(nonatomic,retain)UIImageView *goodsImg;//缩略图
@property(nonatomic,retain)UILabel *titleLab;//标题
@property(nonatomic,retain)UILabel *fromLab;//商品来源
@property(nonatomic,retain)UIImageView *isHotImg;//火热标志
@property(nonatomic,retain)UIImageView *reviewImg;//评论图标
@property(nonatomic,retain)UILabel *reviewLab;//评论数量
@property(nonatomic,retain)UIImageView *praiseImg;//赞图标
@property(nonatomic,retain)UILabel *praiseLab;//赞数量
@property(nonatomic,retain)UILabel *updateTimeLab;//更新时间
@property(nonatomic,retain)UIImageView *isReadedImg;//是否已读标示.

@end
