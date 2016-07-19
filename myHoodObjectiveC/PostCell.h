//
//  PostCell.h
//  myHoodObjectiveC
//
//  Created by Shawn on 6/19/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "DataService.h"
@class Post;


@interface PostCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *postImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;

-(void)configureCell:(Post*)post;
@end
