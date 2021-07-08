//
//  DetailsViewController.m
//  Instagram
//
//  Created by rutvims on 7/8/21.
//

#import "DetailsViewController.h"
#import "DateTools.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageCaption.text = self.post[@"caption"];
    PFUser *user = self.post[@"author"];
    self.usernameTextTop.text = user.username;
    self.usernameTextBottom.text = user.username;
    self.postImage.file = self.post[@"image"];
    [self.postImage loadInBackground];
    //convert date to string
    self.date.text = [self.post.createdAt shortTimeAgoSinceNow];
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
