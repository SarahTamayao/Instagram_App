//
//  GridViewController.m
//  Instagram
//
//  Created by rutvims on 7/8/21.
//

#import "GridViewController.h"
#import <Parse/Parse.h>
#import "PostCollectionCell.h"
#import "Post.h"
#import "profileImage.h"
#import "EditViewController.h"
@interface GridViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *posts;
@property (strong, nonatomic) NSArray *profiles;
@end

@implementation GridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self refresh];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;

    layout.minimumInteritemSpacing = 2;
    layout.minimumLineSpacing = 2;

    CGFloat postsPerLine = 3;
    CGFloat itemWidth = (self.collectionView.frame.size.width - layout.minimumInteritemSpacing * (postsPerLine - 1))/postsPerLine;
    CGFloat itemHeight = itemWidth;
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PostCollectionCell" forIndexPath:indexPath];
    
    Post *post = self.posts[indexPath.row];
    cell.postImage.file = post [@"image"];
    [cell.postImage loadInBackground];
    PFUser *user = post[@"author"];
    self.profileUsername.text = [@"@" stringByAppendingString:(user.username)];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.posts.count;
}

- (void) refresh{
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    PFQuery *queryProfile = [PFQuery queryWithClassName:@"profileImage"];
    [query includeKey:@"author"];
    [query whereKey:@"author" equalTo:PFUser.currentUser];
    query.limit = 20;

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.posts = posts;
            NSLog(@"%lu", self.posts.count);
            [self.collectionView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    [queryProfile findObjectsInBackgroundWithBlock:^(NSArray *profiles, NSError *error) {
        if (profiles != nil) {
            self.profiles = profiles;
            NSLog(@"%lu", self.profiles.count);
            if(self.profiles.count != 0){
                profileImage *profile = self.profiles[self.profiles.count - 1];
                self.profileName.text = profile.name;
                self.userBio.text = profile.bio;
                self.profilePronouns.text = profile.pronouns;
                self.profileImage.file = profile [@"image"];
                [self.profileImage loadInBackground];
            }
            [self.collectionView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    EditViewController *editController = [segue destinationViewController];
    if(self.profiles.count != 0){
        editController.profileImageHolder = self.profileImage.image;
    }
}

@end
