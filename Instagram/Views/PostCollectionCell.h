//
//  PostCollectionCell.h
//  Instagram
//
//  Created by rutvims on 7/8/21.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@import Parse;
NS_ASSUME_NONNULL_BEGIN

@interface PostCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet PFImageView *postImage;

@end

NS_ASSUME_NONNULL_END
