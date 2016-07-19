//
//  TableViewController.m
//  myHoodObjectiveC
//
//  Created by Shawn on 7/3/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

#import "TableViewController.h"
#import "DataService.h"
#import "Post.h"
#import "PostCell.h"

@interface TableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray *postsArray;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    ds = [DataService instance];
    [[DataService instance] loadPosts];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(onPostsLoaded:) name:@"postsLoaded" object:nil ];
//    self.postsArray = [[NSArray alloc] init];
//    self.postsArray = [[DataService instance] loadedPosts];
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    Post *post = ds.loadedPosts[indexPath.row];

    if (cell) {
        [cell configureCell:post];
        return cell;
    } else {
        cell = [[PostCell alloc] init];
        [cell configureCell:post];
        return cell;
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {    
        return ds.loadedPosts.count ;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 87.0;
}
    

-(void) onPostsLoaded:(NSNotification *) notif {
        [self.tableView reloadData];
}


@end
