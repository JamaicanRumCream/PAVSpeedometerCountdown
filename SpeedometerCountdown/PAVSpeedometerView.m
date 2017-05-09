//
//  PAVSpeedometerView.m
//  SpeedometerCountdown
//
//  Created by Chris Paveglio on 2/11/17.
//  Copyright © 2017 Chris Paveglio/ paveglio.com . All rights reserved.
//

#import "PAVSpeedometerView.h"


float PAVDegreesToRadians(float degrees) { return degrees * (M_PI / 180); };

@interface PAVSpeedometerView ()

@property (nonatomic, strong) UIImageView *pointerView;
@property (nonatomic, strong) UIImageView *backgroundView;

@end


@implementation PAVSpeedometerView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

/** Setup put the pieces in position but can't set the images until the setters take care of them */
- (void)setup {
    self.backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    self.backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.backgroundView];
    
    //the pointer view starts at the 'max time' position, which is at the right, at 135°
    //and the image size must be 2x the width of the frame, and center point positioned
    //at vertical distance of 1/2 the width
    self.pointerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame) * 2, CGRectGetWidth(self.frame) * 2)];
    self.pointerView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetWidth(self.frame) / 2);
    self.pointerView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:self.pointerView];
    
    //rotate the view to it's initial "max time" state
    CGAffineTransform pointerTransform = CGAffineTransformRotate(CGAffineTransformIdentity, PAVDegreesToRadians(135.0));
    [self.pointerView setTransform:pointerTransform];
    
    [self setClipsToBounds:YES];
}

- (void)setupSpeedometerWithNumberImageName:(NSString *)numberImageName pointerImageName:(NSString *)pointerImageName pointerInBack:(BOOL)inBack animationDuration:(CGFloat)duration {
    [self setBackgroundImageFileName:numberImageName];
    [self setPointerFileName:pointerImageName];
    [self setPointerIsInBack:inBack];
    [self setTimeDuration:duration];
}

- (void)startAnimation {
    [UIView animateWithDuration:self.timeDuration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        CGAffineTransform pointerTransform = CGAffineTransformRotate(CGAffineTransformIdentity, PAVDegreesToRadians(45.0));
        [self.pointerView setTransform:pointerTransform];
    } completion:^(BOOL finished) {
        //nuttin honey
    }];
}

/** Stops the animation immediately and leaves the pointer in the position it was at that very moment */
- (void)stopAnimation {
    self.pointerView.layer.transform = self.pointerView.layer.presentationLayer.transform;
    [self.pointerView.layer removeAllAnimations];
}

- (void)resetPointerPosition {
    [self.pointerView.layer removeAllAnimations];
    
    CGAffineTransform pointerTransform = CGAffineTransformRotate(CGAffineTransformIdentity, PAVDegreesToRadians(135.0));
    [self.pointerView setTransform:pointerTransform];
}



#pragma mark - Property Overrides / Setters

- (void)setPointerIsInBack:(BOOL)pointerIsInBack {
    _pointerIsInBack = pointerIsInBack;
    if (_pointerIsInBack) {
        [self sendSubviewToBack:self.pointerView];
    }
}

- (void)setBackgroundImageFileName:(NSString *)backgroundImageFileName {
    _backgroundImageFileName = backgroundImageFileName;
    self.backgroundView.image = [UIImage imageNamed:_backgroundImageFileName];
}

- (void)setPointerFileName:(NSString *)pointerFileName {
    _pointerFileName = pointerFileName;
    self.pointerView.image = [UIImage imageNamed:_pointerFileName];
}



@end
