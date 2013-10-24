//
//  SearchingViewController.h
//  Shopping
//
//  Created by huanfang_liu on 13-10-21.
//  Copyright (c) 2013年 huanfang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchingViewController : UIViewController<UISearchBarDelegate,UISearchDisplayDelegate>
{
    UISearchBar * _searchBar;//搜索条
}
@end
