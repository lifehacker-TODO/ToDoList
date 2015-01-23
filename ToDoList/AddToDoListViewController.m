//
//  AddToDoListViewController.m
//  ToDoList
//
//  Created by 鹤楠 on 15/1/23.
//  Copyright (c) 2015年 hippo. All rights reserved.
//

#import "AddToDoListViewController.h"

@interface AddToDoListViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFiled;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation AddToDoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if (sender != self.doneButton) return;
    
    if (self.textFiled.text.length != 0) {
        self.toDoItem = [[ToDoItem alloc] init];
        self.toDoItem.itemName = self.textFiled.text;
        self.toDoItem.completed = NO;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
