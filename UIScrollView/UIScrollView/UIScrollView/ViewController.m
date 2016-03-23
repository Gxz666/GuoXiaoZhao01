//
//  ViewController.m
//  UIScrollView
//
//  Created by mac on 15/10/29.
//  Copyright © 2015年 LQ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    /*1.--创建---*///UIScrollView滚动视图
    UIScrollView *scroll =[[UIScrollView alloc]init];
    scroll.frame=CGRectMake(20, 20, 374, 700);
    scroll.backgroundColor =[UIColor yellowColor];
    [self.view addSubview:scroll];
    
    
    //2.scrollview上面可以添加子视图  也就是说可以添加label button  等UI控件   这个地方   我们以imagView举例子
    //创建四张视图  依次并排    并且添加到scroll上面
    
    for (int i =0; i<4; i++) {
        //控制某段代码重复执行的次数
        UIImageView *imageView =[[UIImageView alloc]init];
        imageView.frame =CGRectMake(374*i, 0, 374, 700);
        NSString *imageName=[NSString stringWithFormat:@"%d.jpg",i ];
        imageView.image =[UIImage imageNamed:imageName];
        [scroll  addSubview:imageView];//将 创建好的图片添加到scroll上
    }
    //3.配置scroll
    scroll.contentSize=CGSizeMake(374*4, 700);
    //设置scroll内容的大小  就是scroll能往左滑动最大的尺寸以及上下能滑动的最大尺寸 默认为0
    
    scroll.pagingEnabled =YES;//整张滑动
    //scroll支持放大缩小   但是如果设置成放大缩小之后就不能滑动  如果能滑动  就不能放大缩小（已经被解决--逻辑代码）
    //隐藏显示滚动条
    scroll.showsHorizontalScrollIndicator=NO;
    
    //bounces默认为YES设置为NO取消反弹效果
    scroll.bounces =NO;
    
    //用户的交互性  如果设为NO 那么就不能得到响应
    scroll.userInteractionEnabled=YES;
    //重要！！！偏移量
   // scroll.contentOffset=CGPointMake(374, 0);
    //可以让scrollview里面的内容位置发生变化
    
    
    //作业：
   // 1.完成12个球运动
   // 2.完成一个scrollview只可以上下互动
    //3.完成scrollview自动滑动
    //4.每滑动一张变一种颜色
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
