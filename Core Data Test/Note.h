//
//  Note.h
//  Core Data Test
//
//  Created by Fancy on 16/2/26.
//  Copyright © 2016年 Fancy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject
{
    NSString *_content;
    NSDate *_date;
}
@property (nonatomic, retain)NSString *content;
@property (nonatomic ,retain)NSDate *date;


- (id)initWithDate :(NSDate *)date content : (NSString *)content;
@end
