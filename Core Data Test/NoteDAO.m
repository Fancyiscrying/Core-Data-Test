//
//  NoteDAO.m
//  Core Data Test
//
//  Created by Fancy on 16/2/26.
//  Copyright © 2016年 Fancy. All rights reserved.
//

#import "NoteDAO.h"
#import "NoteManagedObject.h"

@implementation NoteDAO
{
    Note *note;


}

- (NSMutableArray *)findAll
{
    
    NSManagedObjectContext *cxt = [self managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Note" inManagedObjectContext:cxt];//实体关联的描述类
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];//数据提取请求类
    fetchRequest.entity = entity;
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];//排序描述类
    NSArray *sortDescriptors = @[sortDescriptor];
    fetchRequest.sortDescriptors =  sortDescriptors;
    NSError *error = nil;
    NSArray *listData = [cxt executeFetchRequest:fetchRequest error:&error];
    NSMutableArray *reListData = [[NSMutableArray alloc] init];
    for (NoteManagedObject *mo in listData) {
        
        note = [[Note alloc]initWithDate:mo.date content: mo.content];
        [reListData addObject:note];
        
    }
    


    return reListData;


}

- (Note*) findByID:(Note *)model
{
    NSManagedObjectContext *cxt = [self managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Note" inManagedObjectContext:cxt];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest .entity = entity;
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"date=%@",model.date];
    NSError *error;
    NSArray *listData = [cxt executeFetchRequest:fetchRequest error:&error];
    if ([listData count]>0) {
        NoteManagedObject *mo = [listData lastObject];
        note =[[Note alloc] initWithDate:mo.date content:mo.content];
        return note;
    }

    return nil;
}

- (int) create:(Note *)model
{
    NSManagedObjectContext *cxt =[self managedObjectContext];//管理对象上下文
    NoteManagedObject *note =[NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:cxt];
    [note setValue:model.content forKey:@"content"];
    [note setValue:model.date forKey:@"date"];
    NSError *error =nil;
    if ([cxt hasChanges]&& ![cxt save:&error]) {
        NSLog(@"%@插入数据失败：%@",error,[error userInfo]);
        
        return -1;
    }
    

    
    return 0;
}
- (int) remove:(Note *)model
{

    
    NSManagedObjectContext *cxt = [self managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Note" inManagedObjectContext:cxt];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDescription];
    
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"date= %@",model.date];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *listData = [cxt executeFetchRequest:fetchRequest error:&error];
    
    if ([listData count] >0) {
        NoteManagedObject *note =[listData lastObject];
        [self.managedObjectContext deleteObject:note];
        error =nil;
        
        if ([cxt hasChanges]&&![cxt save:&error]) {
            NSLog(@"删除数据失败:%@,%@",error,[error userInfo]);
            return -1;
        }
    }
    
    


    return 0;



}
- (int) modify:(Note *)model
{


    NSManagedObjectContext *cxt = [self managedObjectContext];
    NSEntityDescription *entityDescription =[NSEntityDescription entityForName:@"Note" inManagedObjectContext:cxt];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];//数据提取类
    [fetchRequest setEntity:entityDescription];
    
    NSPredicate *predicate =[ NSPredicate predicateWithFormat:@"date = %@",model.date];
    [fetchRequest setPredicate:predicate];
    
    NSError *error =  nil;
    NSArray *listData = [cxt executeFetchRequest:fetchRequest error:&error];
    if ([listData count]>0) {
        NoteManagedObject *note =[listData lastObject];
    note.content = model.content;
        error = nil;
        
        if ([cxt hasChanges]&&![cxt save:&error]) {
            NSLog(@"修改数据失败:%@,%@",error,[error userInfo]);
            return -1;
            
        }
    }
    
    
    

    return 0;
}





@end
