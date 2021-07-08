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

@interface GridViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *posts;
@property (strong, nonatomic) UIImage *profileImageHolder;
@end

@implementation GridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    if(self.profileImageHolder != nil){
        [self.profileImage setImage:self.profileImageHolder];
    }
    [self refresh];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;

    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;

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
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.posts.count;
}

- (void) refresh{
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query includeKey:@"author"];
//    [query whereKey:@"likesCount" greaterThan:@100];
    query.limit = 20;

    // fetch data asynchronouslyirgbljljbirihegdgjfchvbvdnlvtcvf
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.posts = posts;
            NSLog(@"%lu", self.posts.count);
            [self.collectionView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
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
