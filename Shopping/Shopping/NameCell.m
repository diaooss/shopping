//
//  NameCell.m
//  Shopping
//
//  Created by huangfangwang on 13-10-22.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "NameCell.h"

@implementation NameCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.nametext = [[UITextField alloc]init];
        [self.contentView addSubview:_nametext];
        [_nametext setFont:[UIFont systemFontOfSize:16]];
        [_nametext setTextColor:[UIColor blackColor]];
        [_nametext setReturnKeyType:UIReturnKeyDone];
        [_nametext setTextAlignment:NSTextAlignmentRight];
        [_nametext setPlaceholder:@"比如iphone"];
        [_nametext setDelegate:self];
        [_nametext release];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [_nametext setFrame:CGRectMake(100,10, self.frame.size.width-150, self.frame.size.height-20)];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_nametext resignFirstResponder];
    if (self.delegate &&[self.delegate respondsToSelector:@selector(getWords:)]) {
        [self.delegate getWords:textField.text];
    }
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(getWords:)]) {
        [self.delegate getWords:textField.text];
    }
}
@end
