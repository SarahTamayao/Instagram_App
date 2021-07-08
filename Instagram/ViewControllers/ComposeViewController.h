//
//  ComposeViewController.h
//  Instagram
//
//  Created by rutvims on 7/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ComposeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *captionLabel;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (strong, nonatomic) UIImage *postImag;
@end

NS_ASSUME_NONNULL_END
