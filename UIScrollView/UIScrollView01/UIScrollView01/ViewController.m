//
//  ViewController.m
//  UIScrollView01
//
//  Created by mac on 15/10/30.
//  Copyright © 2015年 LQ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //创建scroll
    scrollView=[[UIScrollView alloc]init];
    scrollView.frame=CGRectMake(20, 50, 374, 636);
    scrollView.backgroundColor=[UIColor redColor];
    [self.view addSubview:scrollView];
    
    
    /*------scrollview上面添加子控件-------*/
    for (int i =0; i<4; i++) {
        UIImageView *imageView=[[UIImageView alloc]init];
        imageView.frame=CGRectMake(0 , 636*i , 374, 636);
        NSString *imageName=[NSString stringWithFormat:@"%d.jpg",i];
        imageView.image=[UIImage  imageNamed:imageName];
        [scrollView  addSubview:imageView];
        
            }
    
    
    //设置scrollview
    scrollView.contentSize=CGSizeMake(374, 636*4);
    scrollView.pagingEnabled=YES;
    
    
    //设置代理
    scrollView.delegate=self;//将本类的对象self与scrollview相关联
    
    
    //定时器让scrollview自己滚动
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeScrollView) userInfo:nil repeats:YES];

    

//给speed赋值
    speed=636;



}



#pragma mark--scrollView协议方法
//只要触动scrollView任何偏移量的改变  此方法就会被调用
- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    
   // NSLog(@"-----++++++scrollViewDidScroll");
    
    //0---374*3    0---1
    
    //self.view.alpha =  scrollView.contentOffset.x/374*3;
    //self.view.backgroundColor =[UIColor colorWithWhite:1 alpha:1-scrollView.contentOffset.x/(374*3)];
}
//scrollView将要开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

    NSLog(@"将要开始拖动");
}
//scrollview将要开始减速
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"将要开始减速了");
}
//scrollview停止减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"停止减速了");
    
    
}

//这些方法有什么用？？？
//当滑动一张scrollview的图片的时候改变背景颜色
//需求

#pragma mark--定时器方法
- (void)changeScrollView{
    
    self.view.backgroundColor=[UIColor  colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];

    
    [UIView animateWithDuration:1 animations:^{
        scrollView.contentOffset=CGPointMake(0, scrollView.contentOffset.y+speed);

     }];
       
       if (scrollView.contentOffset.y==0||scrollView.contentOffset.y==636*3) {
        speed=-speed;
    }
 

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
