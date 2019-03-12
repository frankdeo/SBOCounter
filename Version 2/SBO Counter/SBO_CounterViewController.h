//
//  SBO_CounterViewController.h
//  SBO Counter
//
//  Created by Frank Deo on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface SBO_CounterViewController : UIViewController <ADBannerViewDelegate> {

    ADBannerView *bannerView;
    BOOL bannerIsVisible;
    
    IBOutlet UILabel *strikesLabel;
    IBOutlet UILabel *ballsLabel;
    IBOutlet UILabel *outsLabel;
    
}

- (IBAction) strikeTapped:(id)sender;
- (IBAction) ballTapped:(id)sender;
- (IBAction) outTapped:(id)sender;
- (IBAction) resetTapped:(id)sender;

@property (nonatomic,assign) BOOL bannerIsVisible;

@end
