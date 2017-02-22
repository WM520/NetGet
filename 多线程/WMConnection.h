//
//  WMConnection.h
//  多线程
//
//  Created by wangmiao on 2017/2/15.
//  Copyright © 2017年 wangmiao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^succeed)(id respont);
typedef void(^error)(NSError *error);

@interface WMConnection : NSURLConnection<NSURLConnectionDelegate>

{
    NSMutableData *data_;
    succeed succeedBlock_;
    error errorBlock_;
}


+ (instancetype)resquest:(NSString *)requestUrl
                 succeed:(succeed)succeedBlock
                   error:(error)errorBlock;

- (instancetype)initWithRequest:(NSString *)requestUrl
                        succeed:(succeed)succeedBlock
                          error:(error)errorBlock;


@end
