//
//  MyDBConnection.h
//  Interview
//
//  Created by Stuart Slack on 1/27/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDBManager  : NSObject

+(MyDBManager *) sharedDBManager;
-(int64_t) poolSize;
-(void) createPoolOfSize:(int64_t) poolSize;

@property (strong)  NSArray *dbPool;

@end

@interface MyDBConnection : NSObject

-(void) connectToServer;

@property () BOOL isConnected;
@property (strong)  dispatch_queue_t queryQueue;

@end
