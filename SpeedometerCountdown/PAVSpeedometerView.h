//
//  PAVSpeedometer.h
//  SpeedometerCountdown
//
//  Created by Chris Paveglio on 2/11/17.
//  Copyright © 2017 Chris Paveglio/ paveglio.com . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAVSpeedometerView : UIView

/** File name for the image to use, with numbers and/or area for countdown to be visible */
@property (nonatomic, strong) NSString *backgroundImageFileName;
/** File name for image of pointer or countdown color to be used */
@property (nonatomic, strong) NSString *pointerFileName;

/** Pointer can be in back or in front of main image */
@property (nonatomic, assign) BOOL pointerIsInBack;

/** Time of the countdown animation */
@property (nonatomic, assign) NSUInteger timeDuration;

- (void)startAnimation;
- (void)stopAnimation;
- (void)resetPointerPosition;

@end
