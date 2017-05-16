//
//  ViewController.m
//  testSpeedometer
//
//  Created by Chris Paveglio on 2/11/17.
//  Copyright © 2017 Chris Paveglio/ paveglio.com . All rights reserved.
//

#import "ViewController.h"
#import "PAVSpeedometerView.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet PAVSpeedometerView *speedoView;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.speedoView setTimeDuration:5.0];
    [self.speedoView setBackgroundImageFileName:@"SpeedoView-Front"];
    [self.speedoView setPointerFileName:@"SolidPointer"];
    [self.speedoView setPointerIsInBack:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startSpeedoAnimation:(id)sender {
    [self.speedoView startAnimation];
}

- (IBAction)resetSpeedoAnimation:(id)sender {
    [self.speedoView resetPointerPosition];
}

@end
