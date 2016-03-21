//
//  ViewController.m
//  AFNTest—3.0
//
//  Created by Elaine on 16--21.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

- (IBAction)loadDataButtonClicked;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//  加载数据  <GET方法请求>
- (void)loadData1
{
    NSString *url = [NSString stringWithFormat:@"http://apidate.shidaiyinuo.com/index.php?api=0&version=three&app=patclinic&method=clinicMyDoc&checkcode=abc&from=1&uid=20036&ishistory=0"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSLog(@"----%@", responseDict);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"----%@", error);
    }];
}

//  加载数据 <POST方式>
- (void)loadData2
{
    NSString *url = [NSString stringWithFormat:@"http://apidate.shidaiyinuo.com/index.php?api=0&version=three&app=patclinic&method=clinicMyDoc&checkcode=abc&from=1&uid=20036&ishistory=0"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:url parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSLog(@"----%@", responseDict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"----%@", error);
    }];
}


- (IBAction)loadDataButtonClicked {
    [self loadData2];
}
@end
