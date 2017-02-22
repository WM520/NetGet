//
//  WMConnection.m
//  多线程
//
//  Created by wangmiao on 2017/2/15.
//  Copyright © 2017年 wangmiao. All rights reserved.
//

#import "WMConnection.h"

@implementation WMConnection
+ (instancetype)resquest:(NSString *)requestUrl
                 succeed:(succeed)succeedBlock
                   error:(error)errorBlock
{
    return [[self alloc] initWithRequest:requestUrl
                                 succeed:succeedBlock
                                   error:errorBlock];
}

- (instancetype)initWithRequest:(NSString *)requestUrl
                        succeed:(succeed)succeedBlock
                          error:(error)errorBlock
{
    NSURL *url = [NSURL URLWithString:requestUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    if ((self = [super initWithRequest:request delegate:self startImmediately:NO])) {
        data_ = [[NSMutableData alloc] init];
        succeedBlock_ = [succeedBlock copy];
        errorBlock_ = [errorBlock copy];
        
        [self start];
    }
    return self;
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [data_ setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [data_ appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    succeedBlock_(data_);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    errorBlock_(error);
}

@end
