//
//  NameCell.h
//  Shopping
//
//  Created by huangfangwang on 13-10-22.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NameCellDeletage <NSObject>

-(void)getWords:(NSString *)word;

@end
@interface NameCell : UITableViewCell<UITextFieldDelegate>
@property(nonatomic,retain)UITextField * nametext;
@property(nonatomic,assign)id<NameCellDeletage>delegate;
@end
