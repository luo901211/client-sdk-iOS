//
//  GYMainViewController.m
//  AdSDK
//
//  Created by luo on 15/11/20.
//  Copyright © 2015年 Goyoo. All rights reserved.
//

#import "ViewController.h"
#import "Qoncrete.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    Qoncrete *client = [Qoncrete sharedSingleton];
    client.sourceID = @"b4baaf8d-d771-406d-885d-5dd1fcb48823";
    client.apiToken = @"fdb6cabc-ad71-48a5-8f9d-56b2375acf16";
    client.errorLogger = ^(NSDictionary *err){
        NSLog(@"err: %@",err);
    };
    
    //    client.autoBatch = NO;
    //    client.batchSize = 20;
    client.retryOnTimeout = 3;
    [client endConfig];
    
    
    for (int i = 0; i < 2; i ++) {
        [client send:@{@"name": [NSString stringWithFormat:@"mingxia____%d",i]}];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
