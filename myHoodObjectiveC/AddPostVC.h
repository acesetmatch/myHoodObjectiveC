//
//  AddPostVC.h
//  myHoodObjectiveC
//
//  Created by Shawn on 6/19/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPostVC : UIViewController <UIImagePickerControllerDelegate>
@property(weak,nonatomic) IBOutlet UITextField * titleField;
@property(weak,nonatomic) IBOutlet UIImageView * postImg;
@property(weak,nonatomic) IBOutlet UITextField * descField;
@end
