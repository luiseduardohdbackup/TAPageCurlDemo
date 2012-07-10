//
//  Copyright (c) 2012 Tim Arnold
//
//  https://github.com/timarnold/Sudoku
//

#import "TAUnderCurlViewController.h"

@implementation TAUnderCurlViewController

@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor underPageBackgroundColor];    
}

- (void)viewWillDisappear:(BOOL)animated {
    if ([self.delegate respondsToSelector:@selector(underCurlViewControllerWillDisappear:)]) {
        [self.delegate underCurlViewControllerWillDisappear:self];
    }

    [super viewWillDisappear:animated];
}

@end