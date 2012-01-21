//
//  SCAppDelegate.h
//  SocialClock
//
//  Created by Takeshi Kawai on 12/01/22.
//  Copyright (c) 2012年 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"
#import "SCViewController.h"

@interface SCAppDelegate : UIResponder <UIApplicationDelegate,FBSessionDelegate>
{
    Facebook    *facebook;
    SCViewController    *viewController;
    
}

@property (nonatomic, retain) Facebook  *facebook;
@property (nonatomic, retain) SCViewController  *viewController;
@property (strong, nonatomic) UIWindow *window;

@end
