//
//  Copyright (c) 2012 Tim Arnold
//
//  https://github.com/timarnold/Sudoku
//

#import <UIKit/UIKit.h>

@class TAUnderCurlViewController;

@protocol TAUnderCurlViewControllerDelegate <NSObject>

- (void)underCurlViewControllerWillDisappear:(TAUnderCurlViewController *)underCurlVC;

@end

@interface TAUnderCurlViewController : UIViewController

@property (nonatomic, weak) id<TAUnderCurlViewControllerDelegate> delegate;

@end