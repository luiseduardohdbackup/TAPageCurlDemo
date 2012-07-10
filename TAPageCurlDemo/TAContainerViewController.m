//
//  Copyright (c) 2012 Tim Arnold
//
//  https://github.com/timarnold/Sudoku
//

#import "TAContainerViewController.h"
#import "TAContentViewController.h"

@interface TAContainerViewController ()

- (void)showUnder;
- (void)hideUnder;
- (void)showOrHideUnder:(id)sender;

@property (nonatomic) TAContentViewController *contentVC;
@property (nonatomic) TAUnderCurlViewController *underCurlVC;

@property (nonatomic) UIButton *pageCurlButton;
@property (nonatomic, assign) BOOL pageCurled;

@end

@implementation TAContainerViewController

@synthesize underCurlVC = _underCurlVC;
@synthesize contentVC = _contentVC;

@synthesize pageCurled = _pageCurled;
@synthesize pageCurlButton = _pageCurlButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage *curlImage = [UIImage imageNamed:@"UIButtonBarPageCurlBlackOpaque.png"];
        UIImage *curlSelectedImage = [UIImage imageNamed:@"UIButtonBarPageCurlSelected.png"];
        
        _underCurlVC = [[TAUnderCurlViewController alloc] init];
        _underCurlVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
        _underCurlVC.delegate = self;
        
        _contentVC = [[TAContentViewController alloc] initWithNibName:@"TAContentViewController" bundle:nil];
                
        _pageCurlButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _pageCurlButton.bounds = CGRectMake( 0, 0, curlImage.size.width, curlImage.size.height );
        _pageCurlButton.imageEdgeInsets = UIEdgeInsetsMake(1, 0, -1, 0);
        [_pageCurlButton setImage:curlImage forState:UIControlStateNormal];
        [_pageCurlButton setImage:curlSelectedImage forState:UIControlStateSelected];
        [_pageCurlButton addTarget:self action:@selector(showOrHideUnder:) forControlEvents:UIControlEventTouchUpInside];

        UIBarButtonItem *curlBBI = [[UIBarButtonItem alloc] initWithCustomView:self.pageCurlButton];
        curlBBI.width = 34.f;
        
        UIToolbar *toolbar = [[UIToolbar alloc] init];
        toolbar.frame = CGRectMake(0.f, 480.f - 44.f - 20.f, 320.f, 44.f);
        toolbar.barStyle = UIBarStyleBlackOpaque;
        toolbar.items = [NSArray arrayWithObjects:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], 
                              curlBBI, nil];
        
        [self.view addSubview:toolbar];        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.contentVC.view];
}

#pragma mark - Private methods

- (void)showUnder {
    [self.contentVC presentModalViewController:self.underCurlVC animated:YES];

    self.pageCurled = YES;
    self.pageCurlButton.selected = YES;
}

- (void)hideUnder {
    [self.contentVC dismissModalViewControllerAnimated:YES];
}

- (void)showOrHideUnder:(id)sender {
    if (NO == self.pageCurled) {
        [self showUnder];
    } else {
        [self hideUnder];
    }    
}

#pragma mark - TAUnderCurlViewControllerDelegate methods

- (void)underCurlViewControllerWillDisappear:(TAUnderCurlViewController *)underCurlVC {
    self.contentVC.view.frame = CGRectMake(0.f, 0.f, 320.f, 416.f);
    
    self.pageCurled = NO;
    self.pageCurlButton.selected = NO;
}

@end