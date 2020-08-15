//
//  ViewController.m
//  AppServiceSatisfaction
//
//  Created by Fabio Lindemberg on 15/08/20.
//  Copyright © 2020 Fabio Lindemberg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.buttonDone.layer.cornerRadius = 6;
    [self congigSlider];
    [self configKeyboard];
}

#pragma mark - Custom Methods

- (void) congigSlider {

    self.sliderOfFeelings.maximumValue = 3;
    self.sliderOfFeelings.minimumValue = 0;
    self.sliderOfFeelings.value = good;
    [self setFeeling:good];
}

- (IBAction)done:(id)sender {
    
    self.textFieldComment.text = @"";
    [self dismissKeyboard];
}

- (IBAction)feelingsChange:(UISlider*)sender {
    [self setFeeling:(int)sender.value];
}

- (void) setFeeling:(Feeling) feeling {
    
    UIColor *goodColor = [UIColor colorWithDisplayP3Red:177.0/255.0 green:251.0/255.0 blue:114.0/255.0 alpha:1];
    UIColor *angryColor = [UIColor colorWithDisplayP3Red:254.0/255.0 green:178.0/255.0 blue:234.0/255.0 alpha:1];
    UIColor *indiferentColor = [UIColor colorWithDisplayP3Red:215.0/255.0 green:193.0/255.0 blue:87.0/255.0 alpha:1];
    UIColor *veryWell = [UIColor colorWithDisplayP3Red:152.0/255.0 green:248.0/255 blue:245.0/255.0 alpha:1];
    
    switch (feeling) {
        case angry:
            [self changeColorAnimatedly: angryColor];
            self.imgeFeelings.image = [UIImage imageNamed: @"angry"];
            break;
        case indiferent:
            [self changeColorAnimatedly: indiferentColor];
            self.imgeFeelings.image = [UIImage imageNamed: @"indiferent"];
            break;
        case good:
            [self changeColorAnimatedly: goodColor];
            self.imgeFeelings.image = [UIImage imageNamed: @"good"];
            break;
        case well:
            [self changeColorAnimatedly: veryWell];
            self.imgeFeelings.image = [UIImage imageNamed: @"veryWell"];
            break;
    }
}

- (void) changeColorAnimatedly: (UIColor *) color {
    [UIView animateWithDuration: 0.5 animations:^{
        self.viewBackground.backgroundColor = color;
    }];
}

#pragma mark - Handle Keyboard

- (void) configKeyboard {
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(dismissKeyboard)];
    [self.viewBackground addGestureRecognizer: tap];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidAppear:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void) keyboardDidAppear: (NSNotification*) notification {
    
    CGFloat keyboardHeigth = CGRectGetHeight([[notification.userInfo objectForKey: UIKeyboardFrameEndUserInfoKey] CGRectValue]);
    [UIView animateWithDuration: 1.0 animations:^{
        self.bottonConstraint.constant = keyboardHeigth;
    }];
}

- (void) keyboardWillHide: (NSNotification*) notification {
    
    [UIView animateWithDuration: 1.0 animations:^{
        self.bottonConstraint.constant = 0;
    }];
}

- (void) dismissKeyboard {
    [self.view endEditing:YES];
}
@end
