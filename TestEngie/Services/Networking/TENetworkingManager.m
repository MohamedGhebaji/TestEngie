//
//  TENetworkingManager.m
//  TestEngie
//
//  Created by Mohamed on 18/05/2017.
//  Copyright © 2017 Mohamed. All rights reserved.
//

#import "TENetworkingManager.h"
#import "TEUser.h"
#import "TEConstants.h"

@implementation TENetworkingManager
+ (void)subscribeWithUser:(TEUser *)user completionHandler:(TESubscribeUserCompletionHandler)completion {
    NSError *error = nil;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURL *url = [NSURL URLWithString:BaseURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSDictionary *params = @{@"user": [user toDictionary]};
    NSData *postData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
    [request setHTTPBody:postData];
    if (!error) {
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error) {
                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (!error) {
                        TEUser *user = [[TEUser alloc] initWithDictionary:dictionary];
                        completion(user, nil);
                    } else {
                        completion(nil, error);
                    }
                });
            }
        }];
        [postDataTask resume];
    }
}
@end
