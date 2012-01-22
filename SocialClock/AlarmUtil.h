//
//  AlarmUtil.h
//  SocialClock
//
//  Created by Takeshi Kawai on 12/01/22.
//  Copyright (c) 2012年 None. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AlarmUtil : NSObject{
    AVAudioPlayer*  _player;
}

@property(nonatomic,retain)AVAudioPlayer *player;

/**
 アラームを鳴らしたり、スヌーズ処理したり
 */
-(void)fire;
-(void)snooz;
@end
