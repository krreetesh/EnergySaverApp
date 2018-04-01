//
//  ViewController.m
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    // Create the data model: Page Title = Labels on each page. Page Images = Images on each page.
    _pageTitles = @[@"Do you want to contribute your share towards making a Greener World ?", @"So you want to! \n How about an easy way to do this ? ", @" Welcome aboard! \n Now we'll help you to check your daily wastage of Energy in different forms! \n Happy Conservation!"];
    _pageImages = @[@"page1.jpg", @"page2.jpg", @"page3.jpg"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Size of the Frame - PageContentViewController that is the 'Page' on each Page Control
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height + 40);  // Keep this size above +37
    
    // "Get Started" - Button Gradient
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = _getStartbtn.layer.bounds;
    
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[UIColor colorWithWhite:1.0f alpha:0.1f].CGColor,
                            (id)[UIColor colorWithWhite:0.4f alpha:0.5f].CGColor,
                            nil];
    
    gradientLayer.locations = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0f],
                               [NSNumber numberWithFloat:1.0f],
                               nil];
    
    gradientLayer.cornerRadius = _getStartbtn.layer.cornerRadius;
    [_getStartbtn.layer addSublayer:gradientLayer];
    
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    [self.view bringSubviewToFront:self.pageControl];                   // Bringing  "DOTS"  &  "GET STARTED" Button on top of everything.
    [self.view bringSubviewToFront:self.getStartbtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}




// Two Required Methods for <UIPageViewControllerDataSource> Protocol: viewControllerBeforeViewController & viewControllerAfterViewController

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound))
    {
        return nil;
    }
    
    index--;
    [self.pageControl setCurrentPage:index];                    // Mapping the frame to that particular Page-Control
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound)
    {
        return nil;
    }
    
    index++;
    [self.pageControl setCurrentPage:index];                    // Mapping the frame to that particular Page-Control

    
    if ( index == [self.pageTitles count] )
    {
        // LAST-SCREEN!
        
        [UIView animateWithDuration:0.25 delay:0.45 options:nil animations:^{_getStartbtn.alpha = 1.0;}         // "Get Started" Button appears after a delay!
         
                         completion:^(BOOL finished)
                         {
                             // if you want to do anything when animation is done, do it here!
                         }
         ];
        
        /* -ALTERNATE: We can automatically Move to LOGIN SCREEN after end of the tutorial screen.
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *viewLogin = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self presentViewController:viewLogin animated:YES completion:nil];                     */
    }
    return [self viewControllerAtIndex:index];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count]))
    {
        return nil;
    }
    
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    
    pageContentViewController.imageFile = self.pageImages[index];           // To Set the Image
    pageContentViewController.titleText = self.pageTitles[index];           // To Set the Label
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
