//
//  AlarmUtil.m
//  SocialClock
//
//  Created by Takeshi Kawai on 12/01/22.
//  Copyright (c) 2012年 None. All rights reserved.
//

#import "AlarmUtil.h"

@implementation AlarmUtil
@synthesize player = _player;

-(void)fire
{
    // TODO: アラームなのでマナーモードでも鳴らすようにAudioSessionを設定すべし
    NSString *path = [[NSBundle mainBundle] pathForResource:@"gtr1" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    // PLAY
    [_player play];
}

-(void)snooz
{
    
}
@end
