//
//  ViewController.m
//  多线程
//
//  Created by wangmiao on 2017/2/14.
//  Copyright © 2017年 wangmiao. All rights reserved.
//

#import "ViewController.h"
#import "WMConnection.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"111111 %@", [NSThread currentThread]);
    dispatch_queue_t queue = dispatch_queue_create("cz", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"222222 %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"xxxxxxxxx %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"gggggggg %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"ffffffffff %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"tttttt %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"hhhhhhh %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"jjjjjjjjjj %@", [NSThread currentThread]);
    });
    
    WMConnection *con = [WMConnection resquest:@"http://op.juhe.cn/onebox/news/query" succeed:^(id respont) {
        NSLog(@"%@---------", respont);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:respont options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@-----", dic);
    } error:^(NSError *error) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
