//
//  ContactosEmergencia.m
//  VitaApp
//
//  Created by Uri Flores on 15/06/14.
//  Copyright (c) 2014 AngelHack. All rights reserved.
//

#import "ContactosEmergencia.h"
#import "ACETelPrompt.h"


@interface ContactosEmergencia ()

@end

@implementation ContactosEmergencia

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
    
    UISwipeGestureRecognizer *gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeRight:)];
    [gestureRecognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:gestureRecognizer];
    // Do any additional setup after loading the view from its nib.
}

- (void)oneFingerSwipeRight:(UISwipeGestureRecognizer*)recognizer {
    // Insert your own code to handle swipe right
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

-(IBAction)regresar:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)callNumber:(id)sender
{
    UILabel *telefono =[[UILabel alloc]init];
    
    telefono.text=@"22215917342";
    
    [ACETelPrompt callPhoneNumber:telefono.text
                             call:^(NSTimeInterval duration) {
                                 NSLog(@"User made a call of %.1f seconds", duration);
                                 
                             } cancel:^{
                                 NSLog(@"User cancelled the call");
                             }];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
