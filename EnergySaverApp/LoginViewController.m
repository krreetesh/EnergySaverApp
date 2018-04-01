//
//  LoginViewController.m
//  EnergySaverApp
//
//  Created by Admin on 24/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //FB Login Design
    _fbLoginButton.layer.cornerRadius = 5;
    _fbLoginButton.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    _fbLoginButton.layer.shadowOpacity = 1.0;
    _fbLoginButton.layer.shadowOffset = CGSizeMake(2.0, 2.0);

    CAGradientLayer *gradientLayerFB = [CAGradientLayer layer];
    
    gradientLayerFB.frame = _fbLoginButton.layer.bounds;
    gradientLayerFB.colors = [NSArray arrayWithObjects:
                            (id)[UIColor colorWithWhite:1.0f alpha:0.1f].CGColor,
                            (id)[UIColor colorWithWhite:0.4f alpha:0.5f].CGColor,
                            nil];
    gradientLayerFB.locations = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0f],
                               [NSNumber numberWithFloat:1.0f],
                               nil];
    gradientLayerFB.cornerRadius =_fbLoginButton.layer.cornerRadius;
    [_fbLoginButton.layer addSublayer:gradientLayerFB];

    //GMAIL Login Design
    _gmailLoginButton.layer.cornerRadius = 5;
    _gmailLoginButton.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    _gmailLoginButton.layer.shadowOpacity = 1.0;
    _gmailLoginButton.layer.shadowOffset = CGSizeMake(2.0, 2.0);
    
    CAGradientLayer *gradientLayerGmail = [CAGradientLayer layer];
    
    gradientLayerGmail.frame = _gmailLoginButton.layer.bounds;
    gradientLayerGmail.colors = [NSArray arrayWithObjects:
                              (id)[UIColor colorWithWhite:1.0f alpha:0.1f].CGColor,
                              (id)[UIColor colorWithWhite:0.4f alpha:0.5f].CGColor,
                              nil];
    gradientLayerGmail.locations = [NSArray arrayWithObjects:
                                 [NSNumber numberWithFloat:0.0f],
                                 [NSNumber numberWithFloat:1.0f],
                                 nil];
    gradientLayerGmail.cornerRadius =_gmailLoginButton.layer.cornerRadius;
    [_gmailLoginButton.layer addSublayer:gradientLayerGmail];
    
    _introLabel.alpha=0;
    [self showLabel];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showLabel
{
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(targetMethod:) userInfo:nil repeats:NO];
}

- (IBAction)btn:(id)sender {
}

-(void)targetMethod:(NSTimer*)timer
{
    [UIView animateWithDuration:1 delay:0.07 options:nil animations:^{_introLabel.alpha = 1.0;}
                     completion:^(BOOL finished){}
    ];
}
@end
