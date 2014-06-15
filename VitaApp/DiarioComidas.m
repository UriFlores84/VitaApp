//
//  DiarioComidas.m
//  VitaApp
//
//  Created by Uri Flores on 15/06/14.
//  Copyright (c) 2014 AngelHack. All rights reserved.
//

#import "DiarioComidas.h"
#import "DIDatepicker.h"
#import "SimpleCam.h"

@interface DiarioComidas ()<SimpleCamDelegate>

@property (weak, nonatomic) IBOutlet DIDatepicker *datepicker;
@property (weak, nonatomic) IBOutlet UILabel *selectedDateLabel;

@property (strong, nonatomic) IBOutlet UIImageView * imgView;
@property (strong, nonatomic) UILabel * tapLabel;
@property (nonatomic,strong) SimpleCam *simpleCam;
@property (nonatomic) BOOL takePhotoImmediately;

@end

@implementation DiarioComidas

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
    
    
    [self.datepicker addTarget:self action:@selector(updateSelectedDate) forControlEvents:UIControlEventValueChanged];
    
    //    [self.datepicker fillDatesFromCurrentDate:14];
    //    [self.datepicker fillCurrentWeek];
    //    [self.datepicker fillCurrentMonth];
    [self.datepicker fillCurrentYear];
    [self.datepicker selectDateAtIndex:0];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)oneFingerSwipeRight:(UISwipeGestureRecognizer*)recognizer {
    // Insert your own code to handle swipe right
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (void)updateSelectedDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"EEEEddMMMM" options:0 locale:nil];
    
    self.selectedDateLabel.text = [formatter stringFromDate:self.datepicker.selectedDate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

-(IBAction)regresar:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark ACTIONSHEET

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.takePhotoImmediately = NO;
    switch (buttonIndex) {
        case 0: //
        {
            self.takePhotoImmediately = YES;
            
            SimpleCam * simpleCam = [SimpleCam new];
            simpleCam.delegate= self;
            // [simpleCam setHideCaptureButton:YES];
            // [simpleCam setHideBackButton:YES];
            simpleCam.hideAllControls = YES;
            [simpleCam setDisablePhotoPreview:YES];
            [self presentViewController:simpleCam animated:YES completion:nil];
        }
            break;
            
        case 1:
        {
            self.takePhotoImmediately = YES;
            
            SimpleCam * simpleCam = [SimpleCam new];
            simpleCam.delegate= self;
            // [simpleCam setHideCaptureButton:YES];
            // [simpleCam setHideBackButton:YES];
            simpleCam.hideAllControls = YES;
            [simpleCam setDisablePhotoPreview:YES];
            [self presentViewController:simpleCam animated:YES completion:nil];
        }
            break;
            
        case 2: // overlay
        {
            self.simpleCam = [SimpleCam new];
            self.simpleCam.delegate= self;
            [self.simpleCam setHideAllControls:YES];
            [self.simpleCam setDisablePhotoPreview:YES];
            
            CGRect frame;
            frame.size = CGSizeMake(self.view.frame.size.width, 120);
            frame.origin.x = 0;
            frame.origin.y = self.view.frame.size.height -frame.size.height;
            UIView *overlayView = [[UIView alloc] initWithFrame:frame];
            overlayView.backgroundColor = [UIColor blackColor];
            overlayView.alpha = 0.3;
            overlayView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            
            UIImage *image = [UIImage imageNamed:@"shutter"];
            frame.size = image.size;
            frame.origin.x = (overlayView.frame.size.width -frame.size.width)/2;
            frame.origin.y = (overlayView.frame.size.height -frame.size.height)/2;
            UIButton *button = [[UIButton alloc] initWithFrame:frame];
            [button setImage:image forState:UIControlStateNormal];
            [button addTarget:self action:@selector(actionPhoto) forControlEvents:UIControlEventTouchUpInside];
            button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
            [overlayView addSubview:button];
            [self.simpleCam.view addSubview:overlayView];
            
            [self presentViewController:self.simpleCam animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark PRIVATE

- (void)actionPhoto
{
    [self.simpleCam  capturePhoto];
}

#pragma mark TAP RECOGNIZER

- (IBAction) handleTap {
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"¿Qué tipo de alimento es?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Desayuno",@"Comida",@"Cena", nil];
    [sheet showInView:self.view];
    
    
}

#pragma mark SIMPLE CAM DELEGATE

- (void) simpleCam:(SimpleCam *)simpleCam didFinishWithImage:(UIImage *)image {
    
    if (image) {
        // simple cam finished with image
        
        _imgView.image = image;
        //_tapLabel.hidden = NO;
    }
    else {
        // simple cam finished w/o image
        
        _imgView.image = nil;
        //_tapLabel.hidden = NO;
    }
    
    
    [simpleCam closeWithCompletion:^{
        NSLog(@" ");
    }];
}

- (void) simpleCamDidLoadCameraIntoView:(SimpleCam *)simpleCam {
    NSLog(@"Camera loaded ... ");
    
    if (self.takePhotoImmediately) {
        [simpleCam capturePhoto];
    }
}


@end
