//
//  DetailsViewController.h
//  Instagram
//
//  Created by rutvims on 7/8/21.
//

#import <UIKit/UIKit.h>
#import <Parse/ParseModule.h>
#import "Post.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet PFImageView *postImage;
@property (weak, nonatomic) IBOutlet UIImageView *postProfile;
@property (weak, nonatomic) IBOutlet UILabel *usernameTextTop;
@property (weak, nonatomic) IBOutlet UILabel *usernameTextBottom;
@property (weak, nonatomic) IBOutlet UILabel *imageCaption;
@property (weak, nonatomic) IBOutlet UILabel *date;

@property (strong, nonatomic)Post *post;

@end

NS_ASSUME_NONNULL_END
