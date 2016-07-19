//
//  DataService.h
//  myHoodObjectiveC
//
//  Created by Shawn on 6/15/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Post.h"

@interface DataService : NSObject

@property(nonatomic,strong)NSMutableArray *loadedPosts;


//- (UIImage*)imageForPath;
- (NSString*)documentsPathForFileNameWithName: (NSString*)name;
+ (id) instance;
- (NSString*)saveImageAndCreatePathWithimage: (UIImage*) Image;
- (UIImage*)imageForPath: (NSString*)path;
- (void)addPost: (Post*) post;
- (void)loadPosts;



@end
