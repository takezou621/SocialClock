//
//  SCViewController.h
//  SocialClock
//
//  Created by Takeshi Kawai on 12/01/22.
//  Copyright (c) 2012年 None. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Facebook.h"

@interface SCViewController : UIViewController
{
//    Facebook    *facebook;
    IBOutlet UIButton *logoutButton;
}

//@property(nonatomic,retain)Facebook *facebook;
- (IBAction)logoutButtonClicked:(id)sender;

@end
