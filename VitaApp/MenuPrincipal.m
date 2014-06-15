//
//  MenuPrincipal.m
//  VitaApp
//
//  Created by Uri Flores on 15/06/14.
//  Copyright (c) 2014 AngelHack. All rights reserved.
//

#import "MenuPrincipal.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
#import "btSimpleSideMenu.h"
#import "MPSkewedCell.h"
#import "MPSkewedParallaxLayout.h"

#import "CitasMedicas.h"
#import "RecordatorioMedicamentos.h"
#import "ContactosEmergencia.h"
#import "DiarioComidas.h"
#import "Ejercicio.h"

static NSString *kCell=@"cell";


#define PARALLAX_ENABLED 1


@interface MenuPrincipal ()<btSimpleSideMenuDelegate>

@property(nonatomic)btSimpleSideMenu *sideMenu;



@end

@implementation MenuPrincipal

@synthesize sideMenu;

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
    
    choosed=-1;
    self.navigationController.navigationBarHidden=YES;
    
#ifndef PARALLAX_ENABLED
    // you can use that if you don't need parallax
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.itemSize=CGSizeMake(self.view.width, 230);
    layout.minimumLineSpacing=-layout.itemSize.height/3; // must be always the itemSize/3
    //use the layout you want as soon as you recalculate the proper spacing if you made different sizes
#else
    
    MPSkewedParallaxLayout *layout=[[MPSkewedParallaxLayout alloc] init];
    
    
#endif
    
    
    _collectionView=[[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.backgroundColor=[UIColor whiteColor];
    [_collectionView registerClass:[MPSkewedCell class] forCellWithReuseIdentifier:kCell];
    [self.view addSubview:_collectionView];
    
    }



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return choosed>=0 ? 1 : 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MPSkewedCell* cell = (MPSkewedCell *) [collectionView dequeueReusableCellWithReuseIdentifier:kCell forIndexPath:indexPath];
    
    cell.image=[UIImage imageNamed:[NSString stringWithFormat:@"%li",(long) (choosed>=0 ? choosed : indexPath.item%5+1)]];
    
    NSString *text;
    
    NSInteger index=choosed>=0 ? choosed : indexPath.row%5;
    
    switch (index) {
        case 0:
            text=@"Agenda de \n Citas Médicas";
            break;
        case 1:
            text=@"Recordatorio de\n Medicamentos";
            break;
        case 2:
            text=@"Contactos de \n Emergencias";
            break;
        case 3:
            text=@"Diario de\n Comidas";
            break;
        case 4:
            text=@"Rutinas de\n  Ejercicio";
            break;
        default:
            break;
            
    }
    
    cell.text=text;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
   
    
      choosed=-1;
    
   
    
    
    
   

    
    
    if (indexPath.item == 0) {
        
        
        CitasMedicas * viewController = [[CitasMedicas alloc] init];
        
        
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
    else if (indexPath.item == 1) {
        
       
        
        RecordatorioMedicamentos * viewController = [[RecordatorioMedicamentos alloc] init];
        
        
        [self.navigationController pushViewController:viewController animated:YES];
    }

    
    if (indexPath.item == 2) {
        
        
        
        ContactosEmergencia * viewController = [[ContactosEmergencia alloc] init];
        
        
        [self.navigationController pushViewController:viewController animated:YES];
    }

    
    if (indexPath.item == 3) {
        
        
        
        DiarioComidas * viewController = [[DiarioComidas alloc] init];
        
        
        [self.navigationController pushViewController:viewController animated:YES];
    }

    
    if (indexPath.item == 4) {
        
        
        
        Ejercicio * viewController = [[Ejercicio alloc] init];
        
        
        [self.navigationController pushViewController:viewController animated:YES];
    }

    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
