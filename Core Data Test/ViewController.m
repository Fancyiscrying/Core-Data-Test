//
//  ViewController.m
//  Core Data Test
//
//  Created by Fancy on 16/2/26.
//  Copyright © 2016年 Fancy. All rights reserved.
//

#import "ViewController.h"
#import "Note.h"
#import "NoteDAO.h"

@interface ViewController ()
- (IBAction)commit:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *ContentTf;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     NSLog(@"%@",[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject]);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)commit:(id)sender {
    NSDateFormatter *dateformatter =[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date =[NSDate date];
    NSString *string = [dateformatter stringFromDate:date];
     NSDate *datenow =[ dateformatter dateFromString:string];
    NSLog(@"当前时间为：%@",datenow);
    NSLog(@"当前系统时间为：%@",string);
    if ([self.ContentTf.text isEqualToString:@""] ==YES) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"请输入便签内容！！！" preferredStyle:UIAlertControllerStyleAlert];
        // Create the actions.
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            NSLog(@"点击了确定按钮");
        }];
        
      
        // Add the actions.
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else
    {
        
    NoteDAO *noteDao = [[NoteDAO alloc] init];
    Note *note = [[Note alloc] initWithDate:datenow content:self.ContentTf.text];
    if ([noteDao create:note] == 0) {
        NSLog(@"插入数据成功");
        
        UIStoryboard *storyboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *subviewController =[ storyboard instantiateViewControllerWithIdentifier:@"subview"];
        [self.navigationController pushViewController:subviewController animated:YES];
    }
    else
    {
    
        NSLog(@"插入数据失败");
    }
    
    }
    
}
@end
