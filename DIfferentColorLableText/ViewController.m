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
    
    
    NSMutableAttributedString *s=[[NSMutableAttributedString alloc]initWithString:str];

    
    NSMutableArray *arr= [self getRangeStr:str findText:str1];
    NSLog(@"%@",arr);
    
    for (int i=0; i<arr.count; i++) {
        
        NSString *r=arr[i];
        
        NSLog(@"%d",r.intValue);
        NSRange myRange={r.intValue,str1.length};
        [s addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:myRange];//字体颜色
//        [s addAttribute:NSBackgroundColorAttributeName  value:[UIColor yellowColor] range:myRange];//背景颜色
        [s addAttribute:NSFontAttributeName  value:[UIFont boldSystemFontOfSize:17] range:myRange];
        
    }
    
    _ColorLable.attributedText=s;


}


- (NSMutableArray *)getRangeStr:(NSString *)text findText:(NSString *)findText
{
    NSMutableArray *arrayRanges = [NSMutableArray arrayWithCapacity:20];
    if (findText == nil && [findText isEqualToString:@""]) {
        return nil;
    }
    NSRange rang = [text rangeOfString:findText];
    if (rang.location != NSNotFound && rang.length != 0) {
        [arrayRanges addObject:[NSNumber numberWithInteger:rang.location]];
        NSRange rang1 = {0,0};
        NSInteger location = 0;
        NSInteger length = 0;
        for (int i = 0;; i++)
        {
            if (0 == i) {
                location = rang.location + rang.length;
                length = text.length - rang.location - rang.length;
                rang1 = NSMakeRange(location, length);
            }else
            {
                location = rang1.location + rang1.length;
                length = text.length - rang1.location - rang1.length;
                rang1 = NSMakeRange(location, length);
            }
            rang1 = [text rangeOfString:findText options:NSCaseInsensitiveSearch range:rang1];
            if (rang1.location == NSNotFound && rang1.length == 0) {
                break;
            }else
                [arrayRanges addObject:[NSNumber numberWithInteger:rang1.location]];
        }
        return arrayRanges;
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
