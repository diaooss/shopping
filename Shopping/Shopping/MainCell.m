//
//  MainCell.m
//  Shopping
//
//  Created by huanfang_liu on 13-10-22.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import "MainCell.h"
#import "UIViewAdditions.h"
#define padding 5
@implementation MainCell
- (void)dealloc
{
    [_goodsImg release];
    [_titleLab release];
    [_isHotImg release];
    [_praiseImg release ];
    [_praiseLab release];
    [_reviewImg release];
    [_reviewLab release];
    [_fromLab release];
    [_updateTimeLab release];
    [_isReadedImg release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _goodsImg = [[UIImageView alloc] init];
        _goodsImg.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_goodsImg];
        
        _titleLab = [[UILabel alloc] init];
        _titleLab.backgroundColor = [UIColor clearColor];
        _titleLab.highlightedTextColor = [UIColor whiteColor];
        _titleLab.font = [UIFont systemFontOfSize:15];
        _titleLab.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        _titleLab.numberOfLines = 0;
        _titleLab.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_titleLab];
        
        _fromLab = [[UILabel alloc] init];
        _fromLab.backgroundColor = [UIColor clearColor];
        _fromLab.highlightedTextColor = [UIColor whiteColor];
        _fromLab.font = [UIFont systemFontOfSize:12];
        _fromLab.textColor = [[UIColor redColor] colorWithAlphaComponent:0.6];
        _fromLab.numberOfLines = 0;
        _fromLab.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_fromLab];
        
        _isHotImg = [[UIImageView alloc] init];
        _isHotImg.backgroundColor  = [UIColor clearColor];
        _isHotImg.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_isHotImg];

        _praiseImg = [[UIImageView alloc] init];
        _praiseImg.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_praiseImg];
        
        _praiseLab = [[UILabel alloc] init];
        _praiseLab.backgroundColor = [UIColor clearColor];
        _praiseLab.highlightedTextColor = [UIColor whiteColor];
        _praiseLab.font = [UIFont systemFontOfSize:11];
        _praiseLab.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        _praiseLab.numberOfLines = 0;
        _praiseLab.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_praiseLab];
        
        _reviewImg = [[UIImageView alloc] init];
        _reviewImg.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_reviewImg];
        
        _reviewLab = [[UILabel alloc] init];
        _reviewLab.backgroundColor = [UIColor clearColor];
        _reviewLab.highlightedTextColor = [UIColor whiteColor];
        _reviewLab.font = [UIFont systemFontOfSize:11];
        _reviewLab.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        _reviewLab.numberOfLines = 0;
        _reviewLab.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_reviewLab];
        
        _updateTimeLab = [[UILabel alloc] init];
        _updateTimeLab.backgroundColor = [UIColor clearColor];
        _updateTimeLab.highlightedTextColor = [UIColor whiteColor];
        _updateTimeLab.font = [UIFont systemFontOfSize:12];
        _updateTimeLab.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        _updateTimeLab.numberOfLines = 0;
        _updateTimeLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_updateTimeLab];

        self.selectedBackgroundView = [[[UIView alloc] initWithFrame:self.bounds] autorelease];
        self.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:32/255.0 green:232/255.0 blue:172/255.0 alpha:0.7];
        

        
               
        // Initialization code
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGSize size = self.bounds.size;
    _goodsImg.frame = CGRectMake(10, 10, 100, 100);
    _titleLab.frame = CGRectMake(padding+5+100, padding+5, size.width-120, (size.height-20)/2);
    
    _fromLab.frame = CGRectMake(_titleLab.left, _titleLab.bottom+5, 100, 20);
    _isHotImg.frame = CGRectMake(_fromLab.right+30, _fromLab.top, 14, 14);
    _isHotImg.image = [UIImage imageNamed:@"deal_hot.png"];
    _reviewImg.frame = CGRectMake(_fromLab.left, _fromLab.bottom+10, 12, 12);
    _reviewImg.image = [UIImage imageNamed:@"deal_comment_icon.png"];
    _reviewLab.frame = CGRectMake(_reviewImg.right+2, _reviewImg.top-5, 30, 20);
    _praiseImg.frame = CGRectMake(_reviewLab.right+20, _reviewImg.top, 12, 12);
    _praiseImg.image = [UIImage imageNamed:@"deal_like_icon.png"];
    _praiseLab.frame = CGRectMake(_praiseImg.right+2, _praiseImg.top-5, 30, 20);
    _updateTimeLab.frame = CGRectMake(_praiseLab.right+20, _praiseLab.top, 70, 20);

    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
