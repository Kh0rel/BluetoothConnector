//
//  SHHomeViewController.h
//  BluetoothConnector
//
//  Created by guillaume chieb bouares on 21/01/2016.
//  Copyright (c) 2016 me.shemana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleTableViewCell.h"
@interface SHHomeViewController : UIViewController <UITableViewDelegate, UITableViewDelegate>{
    
    NSArray *tableData_;
    NSArray *rssiInfo_;
}

@end
