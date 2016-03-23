//
//  ViewController.h
//  UIScrollView01
//
//  Created by mac on 15/10/30.
//  Copyright © 2015年 LQ. All rights reserved.
//

#import <UIKit/UIKit.h>
//类声明的尖括号   代表当前类所遵循的协议
//2声明协议  

@interface ViewController : UIViewController<UIScrollViewDelegate>{

    UIScrollView  *scrollView;
    float speed;

}


@end

