//
//  SHHomeViewController.h
//  BluetoothConnector
//
//  Created by guillaume chieb bouares on 21/01/2016.
//  Copyright (c) 2016 me.shemana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleTableViewCell.h"
#import "SHDetailsViewController.h"
#import "BLE.h"
@interface SHHomeViewController : UIViewController <UITableViewDelegate, UITableViewDelegate, BLEDelegate>{
    IBOutlet UIActivityIndicatorView *activityScanning;
    NSMutableArray *mDevices_;
    NSMutableArray *deviceData_;
    NSMutableArray *rssiInfo_;
}
@property(nonatomic,strong)BLE *ble;
@property (strong, nonatomic) NSMutableArray *mDevices;
@property (strong, nonatomic) NSMutableArray *deviceName;
@property (strong, nonatomic) NSMutableArray *rssiInfo;
@property (strong, nonatomic) IBOutlet UIButton *scanButton;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
