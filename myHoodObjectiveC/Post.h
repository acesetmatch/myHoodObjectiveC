//
//  Post.h
//  myHoodObjectiveC
//
//  Created by Shawn on 6/15/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject <NSCoding>
//{
//    NSString *imagePath;
//    NSString *title;
//    NSString *postDesc;
//}

@property(nonatomic,strong)  NSString *imagePath;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *postDesc;

-(id)initWithImagePath: (NSString*)imagePath title:(NSString*)Title postDesc: (NSString*) postDescription;
@end
