//
//  IngresoLogin.m
//  VitaApp
//
//  Created by Uri Flores on 14/06/14.
//  Copyright (c) 2014 AngelHack. All rights reserved.
//

#import "IngresoLogin.h"
#import "AFViewShaker.h"
#import "MenuPrincipal.h"

@interface IngresoLogin ()

@property (nonatomic, strong) IBOutletCollection(UIView) NSArray * allTextFields;


@end

@implementation IngresoLogin

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

-(IBAction)regresarmenu:(id)sender
{

    [self.navigationController popViewControllerAnimated:YES];

}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationBeginsFromCurrentState:YES];
    
    self.view.frame = CGRectMake(self.view.frame.origin.x, (0), self.view.frame.size.width, self.view.frame.size.height);
    
	self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y - 100.0), self.view.frame.size.width, self.view.frame.size.height);

	[UIView commitAnimations];
}


-(IBAction)cerrartexto:(id)sender
{
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationBeginsFromCurrentState:YES];
	self.view.frame = CGRectMake(self.view.frame.origin.x, (0), self.view.frame.size.width, self.view.frame.size.height);
	[UIView commitAnimations];


}

- (IBAction)validarDatos:(UIButton *)sender {
    
    NSString *usuariotemporal =[[NSString alloc]init];
    
    NSString *contrasenatemporal =[[NSString alloc]init];
    
    usuariotemporal = usuario.text;
    contrasenatemporal=contrasena.text;
    
    if ([usuariotemporal isEqualToString:@"uri.flores@live.com"]) {
        
        if ([contrasenatemporal isEqualToString:@"uvmpuebla"]) {
            
            [self iramenu];
            
            
        }
        
        else{
        
            [AZNotification showNotificationWithTitle:@"Lo sentimos, Tus datos no son correctos" controller:self notificationType:AZNotificationTypeWarning];
        
        }
    }
    
    else{
    
        [AZNotification showNotificationWithTitle:@"Lo sentimos, Tus datos no son correctos" controller:self notificationType:AZNotificationTypeWarning];
    }
    
}

-(IBAction)iramenu
{
    
    MenuPrincipal * viewController = [[MenuPrincipal alloc] init];
    
    
    [self.navigationController pushViewController:viewController animated:YES];

}


@end
