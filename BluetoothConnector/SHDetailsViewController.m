//
//  SHDetailsViewController.m
//  BluetoothConnector
//
//  Created by guillaume chieb bouares on 27/01/2016.
//  Copyright (c) 2016 me.shemana. All rights reserved.
//

#import "SHDetailsViewController.h"

@interface SHDetailsViewController ()

@end

@implementation SHDetailsViewController
@synthesize deviceName = deviceName_;
@synthesize deviceRRSI = deviceRSSI_;
@synthesize deviceIndex = deviceIndex_;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = deviceName_;
    CBPeripheral *p = [self.ble.peripherals objectAtIndex:self.deviceIndex];
    [self.ble connectPeripheral:p];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
