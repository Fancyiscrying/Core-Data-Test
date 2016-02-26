//
//  NoteDAO.h
//  Core Data Test
//
//  Created by Fancy on 16/2/26.
//  Copyright © 2016年 Fancy. All rights reserved.
//

#import "CoreDataDAO.h"
#import "Note.h"

@interface NoteDAO : CoreDataDAO


- (NSMutableArray *)findAll;

- (Note*) findByID:(Note *)model;
- (int) create:(Note *)model;
- (int) remove:(Note *)model;
- (int) modify:(Note *)model;











@end
