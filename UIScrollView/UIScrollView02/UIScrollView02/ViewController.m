//
//  ViewController.m
//  UIScrollView02
//
//  Created by mac on 15/11/2.
//  Copyright © 2015年 LQ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    move=374;
    
    //创建一个scrollView动画
    scrollView  = [[UIScrollView alloc]init];
    scrollView.frame =CGRectMake(20, 50, 374, 636);
    scrollView.backgroundColor=[UIColor  magentaColor];
    [self.view   addSubview:scrollView];
    
    //for循环
    for ( int i=0; i<4; i++) {
        UIImageView *imageView=[[UIImageView  alloc]init];
        imageView.frame=CGRectMake(374*i , 0, 374, 636);
        NSString *imageName =[NSString stringWithFormat:@"%d.jpg",i ];
        imageView.image=[UIImage imageNamed:imageName];
        [scrollView  addSubview:imageView];
        
        
    }
    //设置scrollview动画
    scrollView.contentSize=CGSizeMake(374*4, 636);//内容大小
    scrollView.pagingEnabled=YES;//整张滑动
    
    
    
    //设置代理
    scrollView.delegate=self;//将本类的对象self与scrollview相关联
    
    //设置定时器让scrollview自己滚动
    [NSTimer  scheduledTimerWithTimeInterval:2 target:self selector:@selector(change) userInfo:nil repeats:YES];
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    NSLog(@"将要被拖动了！");
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

    NSLog(@"将要开始减速了");
    

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    NSLog(@"将要停止减速了");

}

- (void)change{

       self.view.backgroundColor=[UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    [UIView animateWithDuration:1 animations:^{//动画的最终状态
        scrollView.contentOffset=CGPointMake(scrollView.contentOffset.x+move, 0);
   
        if (scrollView.contentOffset.x==0||scrollView.contentOffset.x==374*3) {
            move =-move;
            
            NSLog(@"------%f",scrollView.contentOffset.x);
        }

    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
