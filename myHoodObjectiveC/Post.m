//
//  Post.m
//  myHoodObjectiveC
//
//  Created by Shawn on 6/15/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

#import "Post.h"

@implementation Post


-(id)initWithImagePath: (NSString*)image title:(NSString*)Title postDesc: (NSString*) postDescription {
    self.imagePath = image;
    self.title = Title;
    self.postDesc = postDescription;
    self = [super init];
    return self;
}

-(void)encodeWithCoder:(NSCoder*)coder{
    [coder encodeObject: self.imagePath forKey:@"imagePath"];
    [coder encodeObject: self.title forKey: @"title"];
    [coder encodeObject: self.postDesc forKey: @"postDescription"];
    
}

-(id)initWithCoder: (NSCoder*) decoder {
    
    if(self = [super init]) {
        self.imagePath = [decoder decodeObjectForKey:@"imagePath"];
        self.title = [decoder decodeObjectForKey:@"title"];
        self.postDesc = [decoder decodeObjectForKey:@"postDescription"];
    }
    
    return self;
    

}




@end
