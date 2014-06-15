//
//  RecordatorioMedicamentos.h
//  VitaApp
//
//  Created by Uri Flores on 15/06/14.
//  Copyright (c) 2014 AngelHack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "IBActionSheet.h"


@interface RecordatorioMedicamentos : UIViewController<UIActionSheetDelegate, IBActionSheetDelegate>

{

     IBOutlet UITableView *tableView;
    int valor;


}
@end
