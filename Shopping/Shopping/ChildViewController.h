//
//  ChildViewController.h
//  Shopping
//
//  Created by huanfang_liu on 13-10-21.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "ViewPagerController.h"
#import "ContentViewController.h"
@interface ChildViewController : ViewPagerController<contentDelegate>
@property(nonatomic,retain)NSArray *detailCateGoryArry;//对应的子分类的标签

@end
