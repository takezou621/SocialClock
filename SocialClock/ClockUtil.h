//
//  ClockUtil.h
//  SocialClock
//
//  Created by Takeshi Kawai on 12/01/22.
//  Copyright (c) 2012年 None. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClockUtil : NSObject
{
    NSTimer         *myTicker;  
}

- (void) runTimer:(UILabel*)label;
- (void) showActivity:(NSTimer*)timer;

@end
