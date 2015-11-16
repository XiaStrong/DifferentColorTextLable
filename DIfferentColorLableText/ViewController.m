//
//  ViewController.m
//  DIfferentColorLableText
//
//  Created by Xia_Q on 15/7/17.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str=@"你好你好呼啦啦哈哈哈哈哈哈你好你好呼啦啦哈哈哈哈哈哈你好你好呼啦啦哈哈哈哈哈哈你好你好呼啦啦哈哈哈哈哈哈你好你好呼啦啦哈哈哈哈哈哈你好你好呼啦啦哈哈哈哈哈哈你好你好呼啦啦哈哈哈哈哈哈你好你好呼啦啦哈哈哈哈哈哈你好你好呼啦啦哈哈哈哈哈哈你好你好呼啦啦哈哈哈哈哈哈你好你好呼啦啦哈哈哈哈哈哈你好你好呼啦啦哈哈哈哈哈哈你好你好呼啦啦哈哈哈哈哈哈你好你好呼啦啦哈哈哈哈哈哈你好你好呼啦啦哈哈哈哈哈哈";
    
    NSString *str1=@"呼啦啦";
    
    

    NSMutableAttributedString *s1=[UILabel changeText:str1 fromContent:str withColor:[UIColor greenColor]];
    
    _ColorLable.attributedText=s1;


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
