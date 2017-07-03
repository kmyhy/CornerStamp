//
//  ViewController.m
//  CornerStamp
//
//  Created by qq on 2017/6/30.
//  Copyright © 2017年 qq. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CornerStamp.h"

@interface ViewController (){
    BOOL added;
}
@property (strong, nonatomic) IBOutlet UIView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CornerStamp* stamp = [[CornerStamp alloc]initWithFrame:CGRectMake(67, 267, 240, 128)];
    
    stamp.text = @"特价";
    stamp.textColor = [UIColor whiteColor];
    stamp.fontSize = 14;
    stamp.barWidth = 200;
    stamp.barHeight = 30;
    stamp.fillColor = [UIColor redColor];
    stamp.backgroundColor = [UIColor colorWithRed:256 green:0 blue:0 alpha:0.2];
    
    stamp.offset= CGPointMake(30, 30);
    
    [self.view addSubview: stamp];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)action:(UIButton*)sender {
    if(added){
        [self.view removeStamp];
    }else{
        [self.view addStamp:@"推荐" frame:sender.frame];
    }
    added = !added;
}


@end
