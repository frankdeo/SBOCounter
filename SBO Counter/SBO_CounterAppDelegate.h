//
//  SBO_CounterAppDelegate.h
//  SBO Counter
//
//  Created by Frank Deo on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SBO_CounterViewController;

@interface SBO_CounterAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SBO_CounterViewController *viewController;

@end
