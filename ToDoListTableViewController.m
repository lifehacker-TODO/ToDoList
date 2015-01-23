//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by 鹤楠 on 15/1/23.
//  Copyright (c) 2015年 hippo. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoListViewController.h"

@interface ToDoListTableViewController ()

@property NSMutableArray *toDoItems;

@end

@implementation ToDoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toDoItems = [[NSMutableArray alloc] init];
    
    [self loadInitialData];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) loadInitialData {
    ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.itemName=@"Buy Milk";
    [self.toDoItems addObject:item1];
    ToDoItem *item2 = [[ToDoItem alloc] init];
    item2.itemName = @"Fuck the LAW!";
    [self.toDoItems addObject:item2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.toDoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    ToDoItem *toDoItems = [self.toDoItems objectAtIndex:indexPath.row];
    
    cell.textLabel.text = toDoItems.itemName;
    
    if (toDoItems.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    

    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark tableView delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    ToDoItem *tapedItem = [self.toDoItems objectAtIndex:indexPath.row];
    
    tapedItem.completed = !tapedItem.completed;
    
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    
    
    
}

-(IBAction)unwindToList:(UIStoryboardSegue *)segue{
    
    AddToDoListViewController *source = [segue sourceViewController];
    
    ToDoItem *item =  source.toDoItem;
    
    if (item!=nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
    
    
    
}

@end
