//
//  EditViewController.h
//  Instagram
//
//  Created by rutvims on 7/8/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *pronounsText;
@property (weak, nonatomic) IBOutlet UITextField *bioText;
@property (strong, nonatomic) UIImage *profileImageHolder;
@end

NS_ASSUME_NONNULL_END
