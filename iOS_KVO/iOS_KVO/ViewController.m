//
//  ViewController.m
//  iOS_KVO
//
//  Created by 李小龙 on 2019/6/5.
//  Copyright © 2019 李小龙. All rights reserved.
//

#import "ViewController.h"
#import "LPProduct.h"
#import <Network/Network.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //例一
    LPProduct *product1 = [LPProduct new];
    product1.price = 1.0;
    NSLog(@"price 1: %@",[product1 valueForKeyPath:@"price"]);
    [product1 setValue:@100 forKeyPath:@"price"];
    NSLog(@"price 1 change: %@",[product1 valueForKeyPath:@"price"]);
    
    //例二
    product1.factory = [LPFactory  new];
    [product1 setValue:@"make in japan" forKeyPath:@"factory.name"];
    NSLog(@"price 1 facyory name: %@",[product1 valueForKeyPath:@"factory.name"]);
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(doAnything) userInfo:nil repeats:NO];
    // 将定时器添加到runloop中
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    // 在线程中使用定时器，如果不启动run loop，timer的事件是不会响应的，而子线程中runloop默认没有启动
    // 让线程执行一个周期性的任务，如果不启动run loop， 线程跑完就可能被系统释放了
    [[NSRunLoop currentRunLoop] run];//如果没有这句，doAnything将不会执行！！
    
}

- (void)testNetwork{
    NSArray *typeStrings2G = @[CTRadioAccessTechnologyEdge,
                              CTRadioAccessTechnologyGPRS,
                              CTRadioAccessTechnologyCDMA1x];
    NSArray *typeStrings3G = @[CTRadioAccessTechnologyHSDPA,CTRadioAccessTechnologyHSDPA,
                              CTRadioAccessTechnologyWCDMA,
                              CTRadioAccessTechnologyHSUPA,
                              CTRadioAccessTechnologyCDMAEVDORev0,
                              CTRadioAccessTechnologyCDMAEVDORevA,
                              CTRadioAccessTechnologyCDMAEVDORevB,
                              CTRadioAccessTechnologyeHRPD];
    NSArray *typeStrings4G = @[CTRadioAccessTechnologyLTE];
    // 该 API 在 iOS7 以上系统才有效
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        CTTelephonyNetworkInfo *teleInfo = [[CTTelephonyNetworkInfo alloc] init];
        NSString *accessString = teleInfo.currentRadioAccessTechnology;
        if ([typeStrings4G containsObject:accessString]) {
            NSLog(@"4G网络");
        } else if ([typeStrings3G containsObject:accessString]) {
            NSLog(@"3G网络");
        } else if ([typeStrings2G containsObject:accessString]) {
            NSLog(@"2G网络");
        } else {
            NSLog(@"未知网络");
        }
    }else {
        NSLog(@"未知网络");
    }
    
}


@end
