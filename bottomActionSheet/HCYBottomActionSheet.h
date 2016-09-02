//
//  HCYBottomActionSheet.h
//  pickerText
//
//  Created by 霍长裕 on 16/9/2.
//  Copyright © 2016年 霍长裕. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HCYBottomActionSheetCell;
@protocol  HCYBottomActionSheetDelegate<NSObject>
@optional
-(void)selectIndex:(NSInteger)index selectTitle:(NSString*)selectTitle;

@end

@interface HCYBottomActionSheet : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray *dataCount;

@property (nonatomic,strong)UITableView *actionSheetTable;

@property (nonatomic,strong)UIView *bgBlackView ;
//kvo监听tableview高度
@property (nonatomic,assign)CGFloat tableY;
@property (nonatomic,weak)id<HCYBottomActionSheetDelegate>delegate;

/**
 *  自定义高度 颜色等 待完善
 */
@property (nonatomic,strong)UIColor *contentColor;
@property (nonatomic,strong)UIFont  *contentFont;
@property (nonatomic,assign)CGFloat  contentHeight;
@property (nonatomic,strong)UIColor *cancleColor;

//自定义标题 可自行完善
@property (nonatomic,strong)NSString *viewTitle;
@property (nonatomic,strong)UIView *sheetHeadView;


-(instancetype)initwithArray:(NSArray *)array;
//显示
-(void)showActionSheet;
//隐藏
-(void)hideActionSheet;


@end


@interface  HCYBottomActionSheetCell: UITableViewCell

@property(nonatomic,strong)UILabel *actionsheet;

@end