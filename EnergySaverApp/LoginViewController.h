//
//  LoginViewController.h
//  EnergySaverApp
//
//  Created by Admin on 24/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *fbLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *gmailLoginButton;

@property (weak, nonatomic) IBOutlet UILabel *introLabel;
-(void)showLabel;

- (IBAction)btn:(id)sender;

@end
