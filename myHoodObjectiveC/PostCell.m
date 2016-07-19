//
//  PostCell.m
//  myHoodObjectiveC
//
//  Created by Shawn on 6/19/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"
#import "DataService.h"

@interface PostCell()

@end

@implementation PostCell
@synthesize postImg;
@synthesize descLbl;
@synthesize titleLbl;

- (void)awakeFromNib {
    [super awakeFromNib];
    self.postImg.layer.cornerRadius = (self.postImg.frame.size.width)/2;
    self.postImg.clipsToBounds = true;
}

-(void)configureCell:(nonnull Post*)post {
    [self.titleLbl  setText:post.title];
    [self.descLbl  setText:post.postDesc];
    DataService *dataService = [DataService instance];
    self.postImg.image = [dataService imageForPath:post.imagePath];
}





//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
