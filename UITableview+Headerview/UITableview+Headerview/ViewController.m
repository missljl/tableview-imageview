//
//  ViewController.m
//  UITableview+Headerview
//
//  Created by 1111 on 2017/7/22.
//  Copyright © 2017年 ljl. All rights reserved.
//



#define RATE SCREEN_WIDTH/320.0

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define IMAGEHEIGHT    370
#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIImageView *headerview;
@property(nonatomic,assign)CGRect tr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //调整内边距
    self.tableView.contentInset = UIEdgeInsetsMake(IMAGEHEIGHT, 0, 0, 0);
    
    self.tableView.contentOffset = CGPointMake(0, -IMAGEHEIGHT);
     [self.tableView insertSubview:self.headerview atIndex:0];

}
-(UIImageView*)headerview{
    
    if (!_headerview) {
        _headerview= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, IMAGEHEIGHT)];
        _headerview.image = [UIImage imageNamed:@"7875011481266122.jpg"];
        _headerview.backgroundColor = [UIColor blueColor];

    }
    
    
    return _headerview;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 200;


}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    static  NSString *cellid =@"cell";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell==nil) {
        
        
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellid];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d",arc4random() % 100];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    
    
    return cell;

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
//滑动头部视图滑动系数1不动，递减
        const CGFloat speed =0.8; // speed <= 1
        
        CGRect org = CGRectMake(0, -IMAGEHEIGHT, self.view.frame.size.width, IMAGEHEIGHT);
   

//    NSLog(@"%2f",f);
        org.origin.y = scrollView.contentOffset.y * speed - IMAGEHEIGHT * (1 - speed);
        _tr = org;
    
    
    
    
    
    
    
}
//init初始化不会出发
//但是initwithframe进行初始化，当rect的值部位cgrectzero时会触发
//addsubview会触发
//设置frame时会触发,前提是frame发生了变化
//滚动scrollview触发
// layoutSubviews, 当我们在某个类的内部调整子视图位置时，需要调用。
-(void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
   self.headerview.frame = _tr;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
