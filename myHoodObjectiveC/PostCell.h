//
//  PostCell.h
//  myHoodObjectiveC
//
//  Created by Shawn on 6/19/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Post;


@interface PostCell : UITableViewCell

-(void)configureCell:(nonnull Post*)post;
@end
