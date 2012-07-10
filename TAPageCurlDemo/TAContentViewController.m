//
//  Copyright (c) 2012 Tim Arnold
//
//  https://github.com/timarnold/Sudoku
//

#import "TAContentViewController.h"
#import "TAContainerViewController.h"
#import <MapKit/MapKit.h>

@implementation TAContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    
    self.view.frame = CGRectMake(0.f, 0.f, 320.f, 416.f);
    self.view.backgroundColor = [UIColor yellowColor];

    MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:mapView];
}

@end