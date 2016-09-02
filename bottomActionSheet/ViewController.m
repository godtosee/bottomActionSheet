//
//  ViewController.m
//  bottomActionSheet
//
//  Created by 霍长裕 on 16/9/2.
//  Copyright © 2016年 MrHuo. All rights reserved.
//

#import "ViewController.h"
#import "HCYBottomActionSheet.h"
@interface ViewController ()<HCYBottomActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(200, 150, 100, 30)];
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn setTitle:@"放开我" forState:UIControlStateHighlighted];
    [btn setBackgroundColor:[UIColor redColor]];
    btn.tag = 99;
    [btn addTarget:self action:@selector(pushVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(200, 350, 100, 30)];
    [btn1 setTitle:@"点我" forState:UIControlStateNormal];
    [btn1 setTitle:@"放开我" forState:UIControlStateHighlighted];
    [btn1 setBackgroundColor:[UIColor redColor]];
    btn1.tag = 100;
    [btn1 addTarget:self action:@selector(pushVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)pushVC:(UIButton*)btn
{
    if (btn.tag == 100)
    {
        NSArray *array = @[@"相册",@"打开相机"];
        HCYBottomActionSheet *actionsheet = [[HCYBottomActionSheet alloc]initwithArray:array];
        actionsheet.delegate = self;
        actionsheet.viewTitle = @"是否打开相册";
        actionsheet.contentColor = [UIColor lightGrayColor];
        actionsheet.contentFont = [UIFont systemFontOfSize:16];
        actionsheet.cancleColor = [UIColor redColor];
        [actionsheet showActionSheet];
        
    }
    
    else if (btn.tag == 99)
    {
        NSArray *array = @[@"马蓉",@"潘金兰",@"武松",@"赵四"];
        HCYBottomActionSheet *actionsheet = [[HCYBottomActionSheet alloc]initwithArray:array];
        actionsheet.delegate = self;
        actionsheet.contentColor = [UIColor greenColor];
        actionsheet.cancleColor = [UIColor redColor];
        [actionsheet showActionSheet];
        
        //删除所有userdefault配置信息
        NSString *appDomain = [[NSBundle mainBundle]bundleIdentifier];
        [[NSUserDefaults standardUserDefaults]removePersistentDomainForName:appDomain];
        [[NSUserDefaults standardUserDefaults]synchronize];

    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
