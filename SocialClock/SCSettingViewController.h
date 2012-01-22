//
//  SCSettingViewController.h
//  SocialClock
//
//  Created by Takeshi Kawai on 12/01/22.
//  Copyright (c) 2012年 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCSettingViewController : UIViewController
{
    IBOutlet UIButton *logoutButton;
}

- (IBAction)logoutButtonClicked:(id)sender;

@end
