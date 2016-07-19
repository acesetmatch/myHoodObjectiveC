//
//  TableViewController.h
//  myHoodObjectiveC
//
//  Created by Shawn on 7/3/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataService.h"

@interface TableViewController : UIViewController <UITableViewDelegate,UITableViewDataSource> {
    DataService *ds;

}

-(void) onPostsLoaded:(NSNotification *) notif ;
@end
