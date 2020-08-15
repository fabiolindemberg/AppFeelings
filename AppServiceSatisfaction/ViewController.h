//
//  ViewController.h
//  AppServiceSatisfaction
//
//  Created by Fabio Lindemberg on 15/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum Feeling {
    angry,
    indiferent,
    good,
    well,
} Feeling;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textFieldComment;
@property (weak, nonatomic) IBOutlet UIImageView *imgeFeelings;
@property (weak, nonatomic) IBOutlet UIButton *buttonDone;
@property (weak, nonatomic) IBOutlet UIView *viewBackground;
@property (weak, nonatomic) IBOutlet UISlider *sliderOfFeelings;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottonConstraint;
@end

