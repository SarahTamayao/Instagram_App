//
//  GridViewController.h
//  Instagram
//
//  Created by rutvims on 7/8/21.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface GridViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *userBio;
@property (weak, nonatomic) IBOutlet UILabel *profileName;
@property (weak, nonatomic) IBOutlet PFImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *profileUsername;
@property (weak, nonatomic) IBOutlet UILabel *profilePronouns;

@end

NS_ASSUME_NONNULL_END
