//
//  SubViewController.m
//  Core Data Test
//
//  Created by Fancy on 16/2/26.
//  Copyright © 2016年 Fancy. All rights reserved.
//

#import "SubViewController.h"
#import "NoteDAO.h"
#import "Note.h"

@interface SubViewController () <UITableViewDelegate,UITableViewDataSource>
- (IBAction)modifyNote:(id)sender;
- (IBAction)deleteNote:(id)sender;

- (IBAction)findAllNote:(id)sender;
@property (strong, nonatomic) UITableView *tableview;
@property NSMutableString *Mutablestring;
@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _Mutablestring =[[NSMutableString alloc] init];
    self.tableview = [[UITableView alloc] initWithFrame:CGRectMake(20, 15, 360, 352)];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
cell.textLabel.text = @"sabi";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
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
    
    NoteDAO *noteDao = [[NoteDAO alloc] init];
    
    NSMutableArray *arry = [[NSMutableArray alloc] init];
    
    arry = [noteDao findAll];
    for (Note *note in arry) {
        NSLog(@"%@",note.content);
        NSDateFormatter *dateformatter =[[NSDateFormatter alloc] init];
        [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *string = [dateformatter stringFromDate:note.date];
        NSLog(@"%@",string);
        [_Mutablestring appendString:@"日期："];
        [_Mutablestring appendString:string];
        [_Mutablestring appendString:@"  内容："];
        [_Mutablestring appendString:note.content];
    }
    NSLog(@"--------------------%@",_Mutablestring);
    
    UIAlertController *alertcontroller =[ UIAlertController alertControllerWithTitle:@"提示" message:_Mutablestring preferredStyle:   UIAlertControllerStyleAlert];
    UIAlertAction *cancelaction =[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alertcontroller addAction:cancelaction];
    [self presentViewController:alertcontroller animated:YES completion:nil];
    
    
    

    
    
    
}
@end
