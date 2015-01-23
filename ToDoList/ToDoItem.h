//
//  ToDoItem.h
//  ToDoList
//
//  Created by 鹤楠 on 15/1/24.
//  Copyright (c) 2015年 hippo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;

@property BOOL *completed;

@property NSData *creationDate;

@end
