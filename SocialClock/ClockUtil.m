//
//  ClockUtil.m
//  SocialClock
//
//  Created by Takeshi Kawai on 12/01/22.
//  Copyright (c) 2012年 None. All rights reserved.
//

#import "ClockUtil.h"

@implementation ClockUtil
#pragma mark -
#pragma mark Clock

-(void)runTimer:(UILabel*)label
{
    // 1.0秒おきのタイマー
    myTicker = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                target:self
                                              selector:@selector(showActivity:)
                                              userInfo:label
                                               repeats:YES];
}

-(void)showActivity:(NSTimer *)timer
{
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    NSDate *date = [NSDate date];
    
    // This will produce a time that looks like "12:15:00 PM".
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    
    UILabel* label = [timer userInfo];
    // This sets the label with the updated time.
    [label setText:[formatter stringFromDate:date]];
}

@end
