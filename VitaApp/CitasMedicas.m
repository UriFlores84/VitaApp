//
//  CitasMedicas.m
//  VitaApp
//
//  Created by Uri Flores on 15/06/14.
//  Copyright (c) 2014 AngelHack. All rights reserved.
//

#import "CitasMedicas.h"
#import "MCSwipeTableViewCell.h"
#import "CitasMedicas2.h"



static NSUInteger const kMCNumItems = 7;

@interface CitasMedicas ()<MCSwipeTableViewCellDelegate, UIAlertViewDelegate>

@property (nonatomic, assign) NSUInteger nbItems;
@property (nonatomic, strong) MCSwipeTableViewCell *cellToDelete;


@end

@implementation CitasMedicas



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _nbItems = kMCNumItems;

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _nbItems;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    MCSwipeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[MCSwipeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        // iOS 7 separator
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            cell.separatorInset = UIEdgeInsetsZero;
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UITableViewDataSource

- (void)configureCell:(MCSwipeTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIView *checkView = [self viewWithImageName:@"check"];
    UIColor *greenColor = [UIColor colorWithRed:85.0 / 255.0 green:213.0 / 255.0 blue:80.0 / 255.0 alpha:1.0];
    
    UIView *crossView = [self viewWithImageName:@"cross"];
    UIColor *redColor = [UIColor colorWithRed:232.0 / 255.0 green:61.0 / 255.0 blue:14.0 / 255.0 alpha:1.0];
    
    UIView *clockView = [self viewWithImageName:@"clock"];
    UIColor *yellowColor = [UIColor colorWithRed:254.0 / 255.0 green:217.0 / 255.0 blue:56.0 / 255.0 alpha:1.0];
    
    UIView *listView = [self viewWithImageName:@"list"];
    UIColor *brownColor = [UIColor colorWithRed:206.0 / 255.0 green:149.0 / 255.0 blue:98.0 / 255.0 alpha:1.0];
    
    // Setting the default inactive state color to the tableView background color
    [cell setDefaultColor:tableView.backgroundView.backgroundColor];
    
    [cell setDelegate:self];
    
    if (indexPath.row % kMCNumItems == 0) {
        [cell.textLabel setText:@"15 de Junio 2014 18:00 PM"];
        [cell.detailTextLabel setText:@"Visita con el Médico"];
        
        [cell setSwipeGestureWithView:crossView color:redColor mode:MCSwipeTableViewCellModeExit state:MCSwipeTableViewCellState1 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
            NSLog(@"Did swipe \"Cross\" cell");
            
            [self deleteCell:cell];
        }];
    }
    
    else if (indexPath.row % kMCNumItems == 1) {
        [cell.textLabel setText:@"15 de Junio 2014 18:00 PM"];
        [cell.detailTextLabel setText:@"Visita con el Médico"];
        
        [cell setSwipeGestureWithView:crossView color:redColor mode:MCSwipeTableViewCellModeExit state:MCSwipeTableViewCellState1 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
            NSLog(@"Did swipe \"Cross\" cell");
            
            [self deleteCell:cell];
        }];
    }
    
    else if (indexPath.row % kMCNumItems == 2) {
        [cell.textLabel setText:@"15 de Junio 2014 18:00 PM"];
        [cell.detailTextLabel setText:@"Visita con el Médico"];
        
        
        [cell setSwipeGestureWithView:crossView color:redColor mode:MCSwipeTableViewCellModeExit state:MCSwipeTableViewCellState1 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
            NSLog(@"Did swipe \"Cross\" cell");
            
            [self deleteCell:cell];
        }];
    }
    
    else if (indexPath.row % kMCNumItems == 3) {
        [cell.textLabel setText:@"15 de Junio 2014 18:00 PM"];
        [cell.detailTextLabel setText:@"Visita con el Médico"];
        
        
        [cell setSwipeGestureWithView:crossView color:redColor mode:MCSwipeTableViewCellModeExit state:MCSwipeTableViewCellState1 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
            NSLog(@"Did swipe \"Cross\" cell");
            
            [self deleteCell:cell];
        }];
    }
    
    else if (indexPath.row % kMCNumItems == 4) {
        [cell.textLabel setText:@"15 de Junio 2014 18:00 PM"];
        [cell.detailTextLabel setText:@"Visita con el Médico"];
        
        [cell setSwipeGestureWithView:crossView color:redColor mode:MCSwipeTableViewCellModeExit state:MCSwipeTableViewCellState1 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
            NSLog(@"Did swipe \"Cross\" cell");
            
            [self deleteCell:cell];
        }];
    }
    
    else if (indexPath.row % kMCNumItems == 5) {
        [cell.textLabel setText:@"15 de Junio 2014 18:00 PM"];
        [cell.detailTextLabel setText:@"Visita con el Médico"];
        
        
        [cell setSwipeGestureWithView:crossView color:redColor mode:MCSwipeTableViewCellModeExit state:MCSwipeTableViewCellState1 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
            NSLog(@"Did swipe \"Cross\" cell");
            
            [self deleteCell:cell];
        }];
    }
    
    else if (indexPath.row % kMCNumItems == 6) {
        [cell.textLabel setText:@"15 de Junio 2014 18:00 PM"];
        [cell.detailTextLabel setText:@"Visita con el Médico"];
        
        
        [cell setSwipeGestureWithView:crossView color:redColor mode:MCSwipeTableViewCellModeExit state:MCSwipeTableViewCellState1 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
            NSLog(@"Did swipe \"Cross\" cell");
            
            [self deleteCell:cell];
        }];
    }
}


-(IBAction)CrearCita
{
    CitasMedicas2 * viewController = [[CitasMedicas2 alloc] init];
    
    
    [self.navigationController pushViewController:viewController animated:YES];


}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  //  MCTableViewController *tableViewController = [[MCTableViewController alloc] init];
  //  [self.navigationController pushViewController:tableViewController animated:YES];
}

#pragma mark - MCSwipeTableViewCellDelegate


// When the user starts swiping the cell this method is called
- (void)swipeTableViewCellDidStartSwiping:(MCSwipeTableViewCell *)cell {
    // NSLog(@"Did start swiping the cell!");
}

// When the user ends swiping the cell this method is called
- (void)swipeTableViewCellDidEndSwiping:(MCSwipeTableViewCell *)cell {
    // NSLog(@"Did end swiping the cell!");
}

// When the user is dragging, this method is called and return the dragged percentage from the border
- (void)swipeTableViewCell:(MCSwipeTableViewCell *)cell didSwipeWithPercentage:(CGFloat)percentage {
    // NSLog(@"Did swipe with percentage : %f", percentage);
}

#pragma mark - Utils

- (void)reload:(id)sender {
    _nbItems = kMCNumItems;
    [tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)deleteCell:(MCSwipeTableViewCell *)cell {
    NSParameterAssert(cell);
    
    _nbItems--;
    NSIndexPath *indexPath = [tableView indexPathForCell:cell];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (UIView *)viewWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeCenter;
    return imageView;
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    // No
    if (buttonIndex == 0) {
        [_cellToDelete swipeToOriginWithCompletion:^{
            NSLog(@"Swiped back");
        }];
        _cellToDelete = nil;
    }
    
    // Yes
    else {
        _nbItems--;
        [tableView deleteRowsAtIndexPaths:@[[tableView indexPathForCell:_cellToDelete]] withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
