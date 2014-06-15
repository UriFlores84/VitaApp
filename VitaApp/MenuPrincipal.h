//
//  MenuPrincipal.h
//  VitaApp
//
//  Created by Uri Flores on 15/06/14.
//  Copyright (c) 2014 AngelHack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Frame.h"

@interface MenuPrincipal : UIViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
{
    UICollectionView *_collectionView;
    
    NSInteger choosed;



}

@end
