//
//  TMSmartAlertView.h
//  TMSmartAlertView
//
//  Created by Thiago Magalhães on 12/05/14.
//  Copyright (c) 2014 7Links. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMSmartAlertView : UIView

@property (strong, nonatomic) NSString * defaultXib;
@property CGFloat cornerRadius;

@property (strong, nonatomic) UILabel * titleLabel;
@property (strong, nonatomic) UILabel * textLabel;
@property (strong, nonatomic) UIButton * cancelButton;
@property (strong, nonatomic) UIButton * yesButton;

- (TMSmartAlertView *) init;

- (TMSmartAlertView *) initWithTitle: (NSString *) title  text: (NSString *) text  cancelButtonTitle: (NSString *) cancelButtonTitle cancelButtonSelector: (SEL) cancelButtonSelector xibName: (NSString *) xibName target: (UIViewController *) target;

- (TMSmartAlertView *) initWithTitle: (NSString *) title  text: (NSString *) text  cancelButtonTitle: (NSString *) cancelButtonTitle cancelButtonSelector: (SEL) cancelButtonSelector yesButtonTitle: (NSString *) yesButtonTitle yesButtonSelector: (SEL) yesButtonSelector xibName: (NSString *) xibName target: (UIViewController *) target;

- (void) initWindow;

- (void) show;

- (void) dismiss;

@end
