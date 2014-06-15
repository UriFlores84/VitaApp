//
//  IngresoLogin.h
//  VitaApp
//
//  Created by Uri Flores on 14/06/14.
//  Copyright (c) 2014 AngelHack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AZNotification.h"
#import "AZNotificationView.h"

@interface IngresoLogin : UIViewController
{
    UIDynamicAnimator *_animator;
    UIGravityBehavior *_gravity;
    
    IBOutlet UITextField *usuario;
    IBOutlet UITextField *contrasena;
}


@end
