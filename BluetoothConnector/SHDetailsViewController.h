//
//  SHDetailsViewController.h
//  BluetoothConnector
//
//  Created by guillaume chieb bouares on 27/01/2016.
//  Copyright (c) 2016 me.shemana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLE.h"
@interface SHDetailsViewController : UIViewController<BLEDelegate> {
    @public
    NSString* deviceName_;
    NSString* deviceRSSI_;
    NSUInteger deviceIndex_;
    
}

@property (nonatomic,strong) NSString* deviceName;
@property (nonatomic,strong) NSString* deviceRRSI;
@property (nonatomic,assign) NSUInteger deviceIndex;
@property (nonatomic,strong) BLE *ble;
@end
