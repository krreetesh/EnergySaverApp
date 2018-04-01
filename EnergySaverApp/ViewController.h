//
//  ViewController.h
//  EnergySaverApp
//
//  Created by Admin on 23/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface ViewController : UIViewController <UIPageViewControllerDataSource>

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;            // For those page-dots (Here 3 dots!)
@property (weak, nonatomic) IBOutlet UIButton *getStartbtn;                 // This button will appear on the last screen

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;                          // Page Labels
@property (strong, nonatomic) NSArray *pageImages;                          // Page Backgrounds

@end

