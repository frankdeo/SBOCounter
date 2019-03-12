//
//  SBO_CounterViewController.m
//  SBO Counter
//
//  Created by Frank Deo on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SBO_CounterViewController.h"

@implementation SBO_CounterViewController

@synthesize bannerIsVisible;

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    strikesLabel.text = @"0";
    ballsLabel.text = @"0";
    outsLabel.text = @"0";
    
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        banner.frame = CGRectOffset(banner.frame, 0, 50);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        banner.frame = CGRectOffset(banner.frame, 0, -50);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }
}

- (IBAction) strikeTapped:(id)sender {
    if ([strikesLabel.text isEqualToString:@"0"])
        strikesLabel.text = @"1";
    else if ([strikesLabel.text isEqualToString:@"1"])
        strikesLabel.text = @"2";
    else if ([strikesLabel.text isEqualToString:@"2"]) {
        strikesLabel.text = @"0";
        ballsLabel.text = @"0";
        if ([outsLabel.text isEqualToString:@"0"])
            outsLabel.text = @"1";
        else if ([outsLabel.text isEqualToString:@"1"])
            outsLabel.text = @"2";
        else if ([outsLabel.text isEqualToString:@"2"])
            outsLabel.text = @"0";
    }
}

- (IBAction) ballTapped:(id)sender {
    if ([ballsLabel.text isEqualToString:@"0"])
        ballsLabel.text = @"1";
    else if ([ballsLabel.text isEqualToString:@"1"])
        ballsLabel.text = @"2";
    else if ([ballsLabel.text isEqualToString:@"2"])
        ballsLabel.text = @"3";
    else if ([ballsLabel.text isEqualToString:@"3"]) {
        ballsLabel.text = @"0";
        strikesLabel.text = @"0";
    }
}

- (IBAction) outTapped:(id)sender {
    if ([outsLabel.text isEqualToString:@"0"])
        outsLabel.text = @"1";
    else if ([outsLabel.text isEqualToString:@"1"])
        outsLabel.text = @"2";
    else if ([outsLabel.text isEqualToString:@"2"])
        outsLabel.text = @"0";
}

- (IBAction) resetTapped:(id)sender {
    
    strikesLabel.text = @"0";
    ballsLabel.text = @"0";
    outsLabel.text = @"0";
    
}

@end
