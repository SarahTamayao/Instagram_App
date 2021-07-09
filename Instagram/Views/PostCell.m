//
//  PostCell.m
//  Instagram
//
//  Created by rutvims on 7/6/21.
//

#import "PostCell.h"
#import "Post.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)likeButton:(id)sender {
    [self likePost:_post];
    [self.likeButton setBackgroundImage:[UIImage systemImageNamed:@"heart.fill"] forState:UIControlStateNormal];
    [self.likeButton setTintColor:[UIColor redColor]];
}
-(void) likePost:(Post *)post{
    _post = post;
    if(post[@"likesArray"] == nil){
        post[@"likesArray"] = [NSMutableArray new];
    }
    PFUser *user = post[@"author"];
    [post[@"likesArray"] addObject:user.username];
    [post saveInBackground];
    
}

-(void) checkLike:(Post *)post{
    _post = post;
    if([post[@"likesArray"] containsObject: PFUser.currentUser.username]){
        [self.likeButton setBackgroundImage:[UIImage systemImageNamed:@"heart.fill"] forState:UIControlStateNormal];
        [self.likeButton setTintColor:[UIColor redColor]];
    }else{
        [self.likeButton setBackgroundImage:[UIImage systemImageNamed:@"heart"] forState:UIControlStateNormal];
        [self.likeButton setTintColor:[UIColor blackColor]];
        
    }
}

@end
