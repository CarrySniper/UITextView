//
//  ViewController.m
//  UITextView的创建与使用
//
//  Created by 陈家庆 on 15-2-9.
//  Copyright (c) 2015年 shikee_Chan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.title = @"UITextView的创建与使用";
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 80, self.view.frame.size.width-80, 100)];
    [self.view addSubview:self.textView];
    self.textView.delegate = self;
    
    //修复文本框是偏移（下移）
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    //设置文本
//    self.textView.text = @"我是UITextView，大家欢迎使用。";
    //设置文字对齐方式属性
    self.textView.textAlignment = NSTextAlignmentLeft;
    //设置文字对齐方
    //设置文字颜色属性
    self.textView.textColor = [UIColor purpleColor];
    //设置文字字体属性
    self.textView.font = [UIFont systemFontOfSize:12.0f];
    //设置编辑使能属性,是否允许编辑（=NO时，只用来显示，依然可以使用选择和拷贝功能）
    self.textView.editable = YES;
    //设置背景颜色属性
    self.textView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //设置圆角、边框属性
    self.textView.layer.cornerRadius = 6.0f;
    self.textView.layer.borderWidth = 2;
    self.textView.layer.borderColor = [[UIColor colorWithRed:200.0/255 green:50/255 blue:10/255 alpha:1] CGColor];
    
    //添加按钮及监听
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(CGRectGetMaxX(self.textView.frame)+10, 80, 50, 30);
    addButton.backgroundColor = [UIColor purpleColor];
    [addButton setTitle:@"添加" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    //模仿UTextField的placeholder属性
    _placeholderLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.textView.frame), 20)];
    _placeholderLabel.backgroundColor = [UIColor clearColor];
    _placeholderLabel.textColor = [UIColor grayColor];
    _placeholderLabel.text = @"请输入内容";
    _placeholderLabel.font = self.textView.font;
    [self.textView addSubview:_placeholderLabel];
    
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    NSLog(@"将要开始编辑？");
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    NSLog(@"将要结束编辑？");
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"开始编辑。");
    _placeholderLabel.text = @"";
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    NSLog(@"结束编辑。");
    
    //模仿UTextField的placeholder属性
    if (self.textView.text.length == 0) {
        _placeholderLabel.text = @"请输入内容";
    }else{
        _placeholderLabel.text = @"";
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSLog(@"将要改变内容？");
    
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView{
    NSLog(@"改变内容。");
}

- (void)textViewDidChangeSelection:(UITextView *)textView{
    NSLog(@"选中内容。");
}

#pragma mark- 按钮点击事件实现方法
- (void)btnClick:(UIButton*)sender{
    NSLog(@"添加内容：你好，我好，大家好！");
    
    self.textView.text = [self.textView.text stringByAppendingString:@"你好，我好，大家好！\n"];
    
    NSRange range = NSMakeRange([self.textView.text length]- 1, 1);
    [self.textView scrollRangeToVisible:range];
    
    [self.view endEditing:YES];
}

/*
 **监听点击事件，当点击非textfiled位置的时候，所有输入法全部收缩
 */
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
