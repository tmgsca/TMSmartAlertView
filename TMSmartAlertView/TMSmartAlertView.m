//
//  TMSmartAlertView.m
//  TMSmartAlertView
//
//  Created by Thiago Magalhães on 12/05/14.
//  Copyright (c) 2014 7Links. All rights reserved.
//

#import "TMSmartAlertView.h"

@implementation TMSmartAlertView

UIWindow * window;
UIView *  modalBackground;

- (TMSmartAlertView *) init
{
    if(!self.defaultXib)
        
    {
        self.defaultXib = @"TMDefaultAlertView";
    }
    
    if(!self.cornerRadius)
    {
        self.cornerRadius = 5.0f;
    }
    
    self.alpha = 0.0f;
    
    self = [[[NSBundle mainBundle] loadNibNamed:self.defaultXib owner:self options:nil] objectAtIndex:0];

    [self initWindow];
    
    [self setCenter:[[UIApplication sharedApplication] keyWindow].center];
    
    [self.layer setCornerRadius:self.cornerRadius];
    
    return self;
}

- (TMSmartAlertView *) initWithTitle: (NSString *) title  text: (NSString *) text  cancelButtonTitle: (NSString *) cancelButtonTitle cancelButtonSelector: (SEL) cancelButtonSelector xibName: (NSString *) xibName target: (UIViewController *) target
{
    if(xibName){
        
        self.defaultXib = xibName;
        
    }
    
    if(!self.defaultXib)
        
    {
        self.defaultXib = @"TMDefaultOkAlertView";
    }
    
    self = [[[NSBundle mainBundle] loadNibNamed:self.defaultXib owner:self options:nil] objectAtIndex:0];
    
    [self initWindow];
    
    [self setCenter:[[UIApplication sharedApplication] keyWindow].center];
    
    if(!self.cornerRadius)
    {
        self.cornerRadius = 5.0f;
    }
    
    [self.layer setCornerRadius:self.cornerRadius];
    
    self.alpha = 0.0f;
    
    for (UIView * subview in [self subviews]) {
        switch (subview.tag) {
            case 0:
                self.titleLabel = (UILabel *) subview;
                break;
            case 1:
                self.textLabel = (UILabel *) subview;
                break;
            case 2:
                self.cancelButton = (UIButton *) subview;
                break;
            case 3:
                self.yesButton = (UIButton *) subview;
                break;
            default:
                break;
        }
    }
    
    self.titleLabel.text = title;
    
    self.textLabel.text = text;
    
    [self.cancelButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
    
    if(cancelButtonSelector){
        
        [self.cancelButton addTarget:target action:cancelButtonSelector forControlEvents:UIControlEventTouchUpInside];
        
    } else {
        
        [self.cancelButton addTarget:self action:@selector(defaultCancelButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return self;
}

- (TMSmartAlertView *) initWithTitle: (NSString *) title  text: (NSString *) text  cancelButtonTitle: (NSString *) cancelButtonTitle cancelButtonSelector: (SEL) cancelButtonSelector yesButtonTitle: (NSString *) yesButtonTitle yesButtonSelector: (SEL) yesButtonSelector xibName: (NSString *) xibName target: (UIViewController *) target
{
    if(xibName){
        
        self.defaultXib = xibName;
        
    }
    
    if(!self.defaultXib)
        
    {
        self.defaultXib = @"TMDefaultAlertView";
    }
    
    self = [[[NSBundle mainBundle] loadNibNamed:self.defaultXib owner:self options:nil] objectAtIndex:0];
    
    [self initWindow];
    
    [self setCenter:[[UIApplication sharedApplication] keyWindow].center];
    
    [self.layer setCornerRadius:5.0f];
    
    self.alpha = 0.0f;
    
    for (UIView * subview in [self subviews]) {
        switch (subview.tag) {
            case 0:
                self.titleLabel = (UILabel *) subview;
                break;
            case 1:
                self.textLabel = (UILabel *) subview;
                break;
            case 2:
                self.cancelButton = (UIButton *) subview;
                break;
            case 3:
                self.yesButton = (UIButton *) subview;
                break;
            default:
                break;
        }
    }
    
    self.titleLabel.text = title;
    
    self.textLabel.text = text;
    
    [self.cancelButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
    
    if(cancelButtonSelector){
        
        [self.cancelButton addTarget:target action:cancelButtonSelector forControlEvents:UIControlEventTouchUpInside];
        
    } else {
        
        [self.cancelButton addTarget:self action:@selector(defaultCancelButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
    }

    [self.yesButton setTitle:yesButtonTitle forState:UIControlStateNormal];
    
    if(yesButtonSelector){
        
        [self.yesButton addTarget:target action:yesButtonSelector forControlEvents:UIControlEventTouchUpInside];
        
    } else {
        
        [self.yesButton addTarget:self action:@selector(defaultYesButtonSelector) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return self;
}

- (void) initWindow
{
    window = [[UIWindow alloc] initWithFrame:[[UIApplication sharedApplication] keyWindow].frame];
    
    modalBackground = [[UIView alloc] initWithFrame:window.bounds];
    
    [modalBackground setBackgroundColor: [UIColor blackColor]];
    
    [modalBackground setAlpha: 0.0];
    
    [window addSubview:modalBackground];
    
    [window addSubview:self];
}

- (void) show
{
    if(!window){
        
        [self initWindow];
    }
    
    [window makeKeyAndVisible];
    
    self.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.transform = CGAffineTransformIdentity;
        modalBackground.alpha = 0.4;
        self.alpha = 1.0;
    } completion:^(BOOL finished){
        self.alpha = 0.9f;
    }];
}

- (void) dismiss
{
    self.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        modalBackground.alpha = 0.0;
        self.alpha = 0.0;
    } completion:^(BOOL finished){
        window = nil;
    }];
}

- (void) defaultCancelButtonAction
{
    [self dismiss];
}

- (void) defaultYesButtonSelector
{
    [self dismiss];
}

@end
