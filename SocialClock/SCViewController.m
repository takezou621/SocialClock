//
//  SCViewController.m
//  SocialClock
//
//  Created by Takeshi Kawai on 12/01/22.
//  Copyright (c) 2012年 None. All rights reserved.
//

#import "SCViewController.h"
#import "ClockUtil.h"
#import "AlarmUtil.h"

@implementation SCViewController

//@synthesize facebook;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ClockUtil* clockUtil = [[ClockUtil alloc] init];
    [clockUtil runTimer:clockLabel];
}

- (void)viewDidUnload
{

    [clockLabel release];
    clockLabel = nil;
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc 
{
    [clockLabel release];
    [super dealloc];
}

- (IBAction)fireAction:(id)sender {
    AlarmUtil *alarmUtil = [[[AlarmUtil alloc] init] autorelease];
    [alarmUtil fire];
}
@end
