//
//  AddPostVC.m
//  myHoodObjectiveC
//
//  Created by Shawn on 6/19/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

#import "AddPostVC.h"
#import "DataService.h"
#import "Post.h"

@interface AddPostVC ()

@end

@implementation AddPostVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.postImg.layer.cornerRadius = self.postImg.frame.size.width / 2;
    self.postImg.clipsToBounds = true;
}

-(IBAction)addPicBtnPressed:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    [sender setTitle:@""];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(IBAction)makePostBtnPressed:(id)sender {
    if ((self.titleField.text)) {
        if ((self.descField.text)) {
            if ((self.postImg.image)) {
                UIImage *img = self.postImg.image;
                NSString *title = self.titleField.text;
                NSString *description = self.descField.text;
                
                NSString *imgPath = [[DataService instance] saveImageAndCreatePathWithimage:img];
                Post *post = [[Post alloc] initWithImagePath:imgPath title:title postDesc:description];
                [[DataService instance] addPost:post];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }
}

-(IBAction)cancelBtnPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) imagePickerController: (UIImagePickerController *) picker didFinishPickingImage:(nonnull UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo {
    [picker dismissViewControllerAnimated:YES completion:nil];

    self.postImg.image = image;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
