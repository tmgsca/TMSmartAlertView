//
//  TMViewController.m
//  TMSmartAlertView
//
//  Created by Thiago Magalhães on 12/05/14.
//  Copyright (c) 2014 7Links. All rights reserved.
//

#import "TMViewController.h"

@interface TMViewController ()

@end

@implementation TMViewController

TMSmartAlertView * alertView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void) yesButtonClicked
{
    NSLog(@"YES");
}

- (void) cancelButtonClicked
{
    NSLog(@"CANCEL");
    [alertView dismiss];
}
- (IBAction)showOkAlert:(id)sender
{
    alertView = [[TMSmartAlertView alloc] initWithTitle:@"Titulo" text:@"Texto de conteúdo do alerta." cancelButtonTitle:@"Cancelar" cancelButtonSelector:@selector(cancelButtonClicked) xibName:nil target:self];
    
    [alertView show];
}

- (IBAction)showYesOrNoAlert:(id)sender
{
    alertView = [[TMSmartAlertView alloc] initWithTitle:@"Titulo" text:@"Texto de conteúdo do alerta." cancelButtonTitle:@"Não" cancelButtonSelector:@selector(cancelButtonClicked) yesButtonTitle:@"Sim" yesButtonSelector:@selector(yesButtonClicked) xibName:nil target:self];
    
    [alertView show];
}

@end
