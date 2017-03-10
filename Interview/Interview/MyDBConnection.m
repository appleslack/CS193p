//
//  MyDBConnection.m
//  Interview
//
//  Created by Stuart Slack on 1/27/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "MyDBConnection.h"

#define kDefaultDBConnectionPoolSize     2

@implementation MyDBManager

// 1.  Create a singleton method that returns a shared MyDBManager
+(MyDBManager *) sharedDBManager
{
    
}

// 2.  Fill out this initializer that creates a pool of MyDBConnections give by poolsize
-(instancetype) initWithPoolSize:(int64_t) poolSize
{
    
}

// 3.  Return the current pool size
-(int64_t) poolSize
{
}

// 3.  Fill out this method that either creates a pool of MyDBConnection and "connects" them
//     to the DB server.
//
// Note: Pools can be resized up or down
// Note: If sizing up, always reuses MyDBConnections that are already connected
-(void) createPoolOfSize:(int64_t) poolSize
{
    
}

@end

@implementation MyDBConnection

-(void) connectToServer
{
    _isConnected = true;
}

-(NSString *) doQuery
{
    return @"The Query Result";
}

#if 0
-(void) runQueryAsyncReplyWhenDone
{

}
#endif

@end
