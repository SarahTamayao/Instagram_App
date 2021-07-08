//
//  GridViewController.h
//  Instagram
//
//  Created by rutvims on 7/8/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GridViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *userBio;
@property (weak, nonatomic) IBOutlet UILabel *profileName;

@end

NS_ASSUME_NONNULL_END
