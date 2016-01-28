//
//  SHDetailsViewController.h
//  BluetoothConnector
//
//  Created by guillaume chieb bouares on 27/01/2016.
//  Copyright (c) 2016 me.shemana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHDetailsViewController : UIViewController {
    @public
    NSString* deviceName_;
    NSString* deviceRSSI_;
    
}

@property (nonatomic,strong) NSString* deviceName;
@property (nonatomic,strong) NSString* deviceRRSI;
@end
