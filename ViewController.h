//
//  ViewController.h
//  UITextView的创建与使用
//
//  Created by 陈家庆 on 15-2-9.
//  Copyright (c) 2015年 shikee_Chan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextViewDelegate>{
    
    UILabel *_placeholderLabel;
    
}

@property(nonatomic,strong)UITextView *textView;

@end
