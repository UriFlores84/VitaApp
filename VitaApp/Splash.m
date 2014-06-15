//
//  Splash.m
//  VitaApp
//
//  Created by Uri Flores on 14/06/14.
//  Copyright (c) 2014 AngelHack. All rights reserved.
//

#import "Splash.h"
#import "Tutorial.h"


@interface Splash ()

@end

@implementation Splash

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
    
    
      [self.navigationController setNavigationBarHidden:YES];
    
    
    [self performSelector:@selector(tutorial:)
               withObject:nil
               afterDelay:3.5f];
    
  

    // Do any additional setup after loading the view from its nib.
}


-(IBAction)tutorial:(id)sender
{
    
    Tutorial * viewController = [[Tutorial alloc] init];
    
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
