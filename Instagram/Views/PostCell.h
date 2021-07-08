//
//  PostCell.h
//  Instagram
//
//  Created by rutvims on 7/6/21.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Post.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet PFImageView *postImage;
@end

NS_ASSUME_NONNULL_END
