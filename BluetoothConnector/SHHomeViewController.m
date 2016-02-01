//
//  SHHomeViewController.m
//  BluetoothConnector
//
//  Created by guillaume chieb bouares on 21/01/2016.
//  Copyright (c) 2016 me.shemana. All rights reserved.
//

#import "SHHomeViewController.h"

@implementation SHHomeViewController
@synthesize ble;
@synthesize mDevices = mDevices_;
@synthesize deviceName = deviceData_;
@synthesize rssiInfo = rssiInfo_;
@synthesize scanButton;
- (void)viewDidLoad {
    [super viewDidLoad];
    ble = [[BLE alloc] init];
    [ble controlSetup];
    self.title = @"Bluetooth Connector";
    ble.delegate = self;
    
    self.mDevices = [[NSMutableArray alloc] init];
    self.deviceName = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.deviceName count];
}
- (IBAction)scanClicked:(id)sender {
    if (ble.activePeripheral)
        if(ble.activePeripheral.state == CBPeripheralStateConnected)
        {
            [[ble CM] cancelPeripheralConnection:[ble activePeripheral]];
            return;
        }
    
    if (ble.peripherals)
        ble.peripherals = nil;
    
    [ble findBLEPeripherals:3];
    
    [NSTimer scheduledTimerWithTimeInterval:(float)3.0 target:self selector:@selector(connectionTimer:) userInfo:nil repeats:NO];
    [activityScanning startAnimating];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SimpleTableViewCell *cell = (SimpleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.nameDevice.text = [self.deviceName objectAtIndex:indexPath.row];
    cell.rssiRange.text = [self.rssiInfo objectAtIndex:indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    SHDetailsViewController* v = [SHDetailsViewController new];
    v.deviceIndex = index;
    v.deviceName = [self.deviceName objectAtIndex:index];
    v.deviceRRSI = [self.rssiInfo objectAtIndex:index];
    v.ble        = self.ble;
    [self.navigationController pushViewController:v animated:YES];
    
}
-(void) connectionTimer:(NSTimer *)timer
{
    
    [scanButton setEnabled:YES];
    
    
    [self.mDevices removeAllObjects];
    [self.deviceName removeAllObjects];
    
    int i;
    for (i = 0; i < ble.peripherals.count; i++)
    {
        CBPeripheral *p = [ble.peripherals objectAtIndex:i];
        
        if (p.identifier.UUIDString != nil)
        {
            if (p.name != nil) {
                [self.deviceName insertObject:p.name atIndex:i];
            } else {
                [self.deviceName insertObject:@"RedBear Device" atIndex:i];
            }
        }
        else
        {
            [self.deviceName insertObject:@"RedBear Device" atIndex:i];
        }
    }
    [self.tableView reloadData];
    [activityScanning stopAnimating];
}


@end
