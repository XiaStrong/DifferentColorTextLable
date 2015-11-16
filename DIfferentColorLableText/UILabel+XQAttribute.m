//
//  UILabel+XQAttribute.m
//  DIfferentColorLableText
//
//  Created by Xia_Q on 15/11/16.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import "UILabel+XQAttribute.h"

@implementation UILabel (XQAttribute)

+(NSMutableAttributedString *)changeText:(NSString *)text fromContent:(NSString *)content withColor:(UIColor *)color
{
    NSMutableAttributedString *s=[[NSMutableAttributedString alloc]initWithString:content];
    
    NSMutableArray *arr=[[NSMutableArray alloc]initWithArray: [self getRangeStr:content findText:text]];
    
    
    for (int i=0; i<arr.count; i++) {
        
        NSString *r=arr[i];
        
        NSLog(@"%d",r.intValue);
        NSRange myRange={r.intValue,text.length};
        [s addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:myRange];//字体颜色
        //        [s addAttribute:NSBackgroundColorAttributeName  value:[UIColor yellowColor] range:myRange];//背景颜色
        [s addAttribute:NSFontAttributeName  value:[UIFont boldSystemFontOfSize:17] range:myRange];
        
    }
    
    return s;
    
}


//计算一段话里面有多少个指定字段的方法
+ (NSMutableArray *)getRangeStr:(NSString *)text findText:(NSString *)findText
{
    
    NSMutableArray *arrayRanges = [NSMutableArray arrayWithCapacity:20];//初始可变数组的长度为20
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


@end
