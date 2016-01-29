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

- (void)viewDidLoad {
    [super viewDidLoad];
    ble = [[BLE alloc] init];
    [ble controlSetup];
    
    ble.delegate = self;
    
    self.mDevices = [[NSMutableArray alloc] init];
    self.deviceName = [[NSMutableArray alloc] init];
    deviceData_ = [NSMutableArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", nil];
    rssiInfo_ = [NSMutableArray arrayWithObjects:@"voila",@"encore",@"xD",@"une idée", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [deviceData_ count];
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
    
    cell.nameDevice.text = [deviceData_ objectAtIndex:indexPath.row];
    cell.rssiRange.text = [rssiInfo_ objectAtIndex:indexPath.row];
    
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
    v.deviceName = [deviceData_ objectAtIndex:index];
    [self.navigationController pushViewController:v animated:YES];
    
}
@end
