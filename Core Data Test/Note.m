//
//  Note.m
//  Core Data Test
//
//  Created by Fancy on 16/2/26.
//  Copyright © 2016年 Fancy. All rights reserved.
//

#import "Note.h"

@implementation Note


@synthesize date = _date;
@synthesize content = _content;

- (id)initWithDate:(NSDate *)date content:(NSString *)content
{
    self = [super init];
    if (self) {
        self.date = date;
        self.content  = content;
    }


    return self;



}
@end
