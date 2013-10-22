//
//  SetShowCell.m
//  Shopping
//
//  Created by huangfangwang on 13-10-22.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "SetShowCell.h"

@implementation SetShowCell

-(void)dealloc
{
    [_label3 release];
    [_label2 release];
    [_label1 release];
    [super dealloc];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.label1 = [[UILabel alloc]init];
        [self.contentView addSubview:_label1];
        [_label1 setFont:[UIFont systemFontOfSize:14]];
        [_label1 release];
        
        self.label2 = [[UILabel alloc]init];
        [self.contentView addSubview:_label2];
        [_label2 setFont:[UIFont systemFontOfSize:14]];
        [_label2 release];
        
        self.label3 = [[UILabel alloc]init];
        [self.contentView addSubview:_label3];
        [_label3 setFont:[UIFont systemFontOfSize:14]];
        [_label3 release];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGSize main = self.frame.size;
    [_label1 setFrame:CGRectMake(0, 0, main.width, main.height/3)];
    [_label2 setFrame:CGRectMake(0, main.height/3, main.width, main.height/3)];
    [_label3 setFrame:CGRectMake(0, main.height*2/3, main.width, main.height/3)];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
