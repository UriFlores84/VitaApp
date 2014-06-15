//
//  Tutorial.m
//  VitaApp
//
//  Created by Uri Flores on 14/06/14.
//  Copyright (c) 2014 AngelHack. All rights reserved.
//

#import "Tutorial.h"
#import <QuartzCore/QuartzCore.h>
#import "Bienvenido.h"




@interface Tutorial ()
{
    UIView *rootView;

}

@end

@implementation Tutorial

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
    
    
    rootView = self.navigationController.view;
    
    [self showIntroWithCrossDissolve];
    // Do any additional setup after loading the view from its nib.
}

- (void)showIntroWithCrossDissolve {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.bgImage = [UIImage imageNamed:@"FondoTutorial1.png"];
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.bgImage = [UIImage imageNamed:@"FondoTutorial2.png"];
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.bgImage = [UIImage imageNamed:@"FondoTutorial3.png"];
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.bgImage = [UIImage imageNamed:@"FondoTutorial4.png"];
    
    EAIntroPage *page5 = [EAIntroPage page];
    page5.bgImage = [UIImage imageNamed:@"FondoTutorial5.png"];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page3,page4,page5]];
    
    [intro setDelegate:self];
    [intro showInView:rootView animateDuration:0.3];
    
}

- (void)introDidFinish:(EAIntroView *)introView {
   // NSLog(@"introDidFinish callback");
    
    Bienvenido * viewController = [[Bienvenido alloc] init];
    
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
