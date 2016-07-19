//
//  DataService.m
//  myHoodObjectiveC
//
//  Created by Shawn on 6/15/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

#import "DataService.h"
#import "Post.h"

@interface DataService()
@end

@implementation DataService




+ (id) instance {
    static DataService *sharedInstance = nil;
    
    @synchronized(self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc]init];
    }
    
    return sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        _loadedPosts = [[NSMutableArray alloc]init];
 }
    return self;
}



- (void)savePosts{
    NSData *postsData = [NSKeyedArchiver archivedDataWithRootObject:_loadedPosts];

    [[NSUserDefaults standardUserDefaults] setObject:postsData forKey: @"posts"];
    [[NSUserDefaults standardUserDefaults] synchronize];
   
}
- (void)loadPosts {
    
     if ([[NSUserDefaults standardUserDefaults] objectForKey:@"posts"]) {
         NSData *postsData = [[NSUserDefaults standardUserDefaults] objectForKey:@"posts"];
         NSMutableArray *postArray = [NSKeyedUnarchiver unarchiveObjectWithData:postsData];
         if (postArray) {
             _loadedPosts = postArray;
         }
     }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"postsLoaded" object:nil];
    
}

- (NSString*)documentsPathForFileNameWithName: (NSString*)name{
    NSString *paths = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [paths stringByAppendingPathComponent:name];
}

- (NSString*)saveImageAndCreatePathWithimage: (UIImage*) Image {
    NSData *imgData = UIImagePNGRepresentation(Image);
    NSTimeInterval seconds = [NSDate timeIntervalSinceReferenceDate];
    NSString *imgPath = [NSString stringWithFormat:@"image %f.png", seconds];
    NSString *fullPath = [self documentsPathForFileNameWithName:imgPath];
    [imgData writeToFile:fullPath atomically:YES];
    return imgPath;
}

- (UIImage*)imageForPath: (NSString*)path {
    NSString *fullPath = [self documentsPathForFileNameWithName:path];
    UIImage *image = [UIImage imageNamed:fullPath];
    return image;
}

- (void)addPost: (Post*) post {
    [_loadedPosts addObject:post];
    [self savePosts];
    [self loadPosts];
    
}



@end
