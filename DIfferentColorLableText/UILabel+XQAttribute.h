//
//  UILabel+XQAttribute.h
//  DIfferentColorLableText
//
//  Created by Xia_Q on 15/11/16.
//  Copyright (c) 2015年 XiaQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (XQAttribute)


/*
 text:要找的字段
 content:从哪段文字里面找
 color：将要修改的颜色
 */


//将一段话里面的部分相同字改变颜色
+(NSMutableAttributedString *)changeText:(NSString *)text fromContent:(NSString *)content withColor:(UIColor *)color;


@end
