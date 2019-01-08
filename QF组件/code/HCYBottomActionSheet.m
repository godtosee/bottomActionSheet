//
//  HCYBottomActionSheet.m
//  pickerText
//
//  Created by 霍长裕 on 16/9/2.
//  Copyright © 2016年 霍长裕. All rights reserved.
//

#import "HCYBottomActionSheet.h"

@implementation HCYBottomActionSheet

-(instancetype)initwithArray:(NSArray *)array
{
    if (self == [super init])
    {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        self.frame = keyWindow.bounds;
        
        self.dataCount = array;
        
        CGRect frame = self.frame;
        
        frame.size.height = [UIScreen mainScreen].bounds.size.height - self.tableY;
        
        self.backgroundColor = [UIColor clearColor];
        
        self.bgBlackView  = [[UIView alloc]initWithFrame:frame];
        self.bgBlackView .backgroundColor = [UIColor blackColor];
        self.bgBlackView .alpha = 0.6;
        
        self.actionSheetTable.frame = CGRectMake(0,keyWindow.bounds.size.height,self.frame.size.width, 0);
        
        [self.actionSheetTable reloadData];
        

        [self addObserver:self forKeyPath:@"tableY" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideActionSheet)];
        [self.bgBlackView  addGestureRecognizer:tap];
        
        
        self.contentColor = [UIColor blackColor];
        self.contentFont = [UIFont systemFontOfSize:16];
        self.contentHeight = 45.0f;
        self.cancleColor = [UIColor grayColor];
        
    }
    
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
}
-(void)setViewTitle:(NSString *)viewTitle
{
    _viewTitle = viewTitle;

    if ([_viewTitle length]!=0||_viewTitle !=nil)
    {
        //创建tableView  header
    }
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"tableY"]) {
        
        NSLog(@"%lf",self.tableY);
    }
}

#pragma mark -tableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0 == section?0:5;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *customer = [[UIView alloc]initWithFrame:CGRectMake(0,0,self.frame.size.width,5)];
    customer.backgroundColor =[UIColor colorWithWhite:1 alpha:0.6];
    return customer;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  self.contentHeight;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0 == section? _dataCount.count:1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.section)
    {
        static NSString *identifier = @"HCYBottomActionSheetCell";
        HCYBottomActionSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell)
        {
            cell = [[HCYBottomActionSheetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.actionsheet.text = _dataCount[indexPath.row];
            
            cell.actionsheet.textColor = self.contentColor;
            
            //去除底部横线
            if (indexPath.row != [_dataCount count]-1)
            {
                UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0,self.contentHeight-0.5,[UIScreen mainScreen].bounds.size.width, 0.5)];
                lineView.backgroundColor = [UIColor lightGrayColor];
                [cell.contentView addSubview:lineView];
                
            }

        }
        return cell;
    }
   else
   {
       static NSString *identifier = @"HCYBottomActionSheetCell2";
       HCYBottomActionSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
       if (!cell)
       {
           cell = [[HCYBottomActionSheetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
           cell.actionsheet.text = @"取消";
           cell.actionsheet.textColor = self.cancleColor;
           
           UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0,self.contentHeight-0.5,[UIScreen mainScreen].bounds.size.width, 0.5)];
           lineView.backgroundColor = [UIColor lightGrayColor];
           [cell.contentView addSubview:lineView];
       }
       return cell;
  
  
   }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (0 == indexPath.section) {
        
        if (self.delegate &&[self.delegate respondsToSelector:@selector(selectIndex:selectTitle:)])
        {
            [self.delegate selectIndex:indexPath.row selectTitle:self.dataCount[indexPath.row]];
        }
    }
    [self hideActionSheet];
}

-(UITableView*)actionSheetTable
{
    if (!_actionSheetTable)
    {
        _actionSheetTable= [[UITableView alloc]initWithFrame:CGRectZero];
        _actionSheetTable.delegate = self;
        _actionSheetTable.dataSource =self;
        _actionSheetTable.scrollEnabled = NO;
        _actionSheetTable.backgroundColor = [UIColor lightGrayColor];
        [_actionSheetTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    }
    
    return _actionSheetTable;
}
#pragma mark show or hide

-(void)showActionSheet
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    CGFloat y = keyWindow.bounds.size.height;
  
    [self addSubview: self.bgBlackView];
    [self addSubview:self.actionSheetTable];
    [keyWindow addSubview:self];
    self.tableY = [self.dataCount count]* self.contentHeight+self.contentHeight;
    [UIView animateWithDuration:0.13 animations:^{

      self.actionSheetTable.frame = CGRectMake(0,y-self.tableY-5,self.frame.size.width,self.tableY+5);
       
   } completion:^(BOOL finished) {

   }];
 
    
}

-(void)hideActionSheet
{
    CGFloat y = [UIApplication sharedApplication].keyWindow.bounds.size.height;
    
    [UIView animateWithDuration:0.13 animations:^{
        
        self.actionSheetTable.frame = CGRectMake(0,y,self.frame.size.width, self.tableY);
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"tableY"];
}

@end

@implementation HCYBottomActionSheetCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.actionsheet = [[UILabel alloc]initWithFrame:CGRectMake(0, 10,[UIScreen mainScreen].bounds.size.width,20)];
        
        self.actionsheet.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.actionsheet];
        
        
    }
    return self;
}

@end
