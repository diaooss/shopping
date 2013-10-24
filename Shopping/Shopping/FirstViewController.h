//
//  FirstViewController.h
//  Shopping
//
//  Created by huanfang_liu on 13-10-21.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "ViewPagerController.h"
#import "ContentViewController.h"
@interface FirstViewController : ViewPagerController<contentDelegate>
@property(nonatomic,retain)NSArray *titleArry;//一级分类的数组
@property(nonatomic,assign)int selected;//分类被选中的标示
@end
