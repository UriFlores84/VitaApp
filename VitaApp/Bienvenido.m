//
//  Bienvenido.m
//  VitaApp
//
//  Created by Uri Flores on 14/06/14.
//  Copyright (c) 2014 AngelHack. All rights reserved.
//

#import "Bienvenido.h"
#import "IngresoLogin.h"

@interface Bienvenido ()

@end

@implementation Bienvenido

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)ingresologin:(id)sender
{

   IngresoLogin * viewController = [[IngresoLogin alloc] init];
    
    
    [self.navigationController pushViewController:viewController animated:YES];

}

@end
