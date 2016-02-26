//
//  SubViewController.m
//  Core Data Test
//
//  Created by Fancy on 16/2/26.
//  Copyright © 2016年 Fancy. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()
- (IBAction)modifyNote:(id)sender;
- (IBAction)deleteNote:(id)sender;

- (IBAction)findAllNote:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
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

- (IBAction)modifyNote:(id)sender {
    
    
}

- (IBAction)deleteNote:(id)sender {
}

- (IBAction)findAllNote:(id)sender {
}
@end
