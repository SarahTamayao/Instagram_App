//
//  HomeViewController.m
//  Instagram
//
//  Created by rutvims on 7/6/21.
//

#import "HomeViewController.h"
#import <Parse/Parse.h>
#import "LoginViewController.h"
#import "PostCell.h"
#import "Post.h"
#import "SVProgressHUD.h"
#import "DetailsViewController.h"
#import "profileImage.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (strong, nonatomic) UIImage *profileImage;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self refresh];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex: 0];
}
- (IBAction)logoutPress:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        HomeViewController *LoginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self presentViewController:LoginViewController animated:YES completion:^{
        }];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    Post *post = self.posts[indexPath.row];
    if(self.profiles.count != 0){
        profileImage *profile = self.profiles[self.profiles.count - 1];
        cell.profileImage.file = profile [@"image"];
        [cell.profileImage loadInBackground];
    }
    cell.captionLabel.text = post[@"caption"];
    cell.postImage.file = post [@"image"];
    [cell.postImage loadInBackground];
    PFUser *user = post[@"author"];
    cell.usernameLabel.text = user.username;
    cell.usernameLabelTop.text = user.username;
    if(self.profileImage != nil){
        [cell.profileImage setImage:self.profileImage];
    }
    return cell;
}
- (void) refresh{
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    PFQuery *queryProfile = [PFQuery queryWithClassName:@"profileImage"];
    [query includeKey:@"author"];
    [query includeKey:@"createdAt"];
//    [query whereKey:@"likesCount" greaterThan:@100];
    query.limit = 20;

    // fetch data asynchronouslyirgbljljbirihegdgjfchvbvdnlvtcvf
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.posts = posts;
            NSLog(@"%lu", self.posts.count);
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
    [queryProfile findObjectsInBackgroundWithBlock:^(NSArray *profiles, NSError *error) {
        if (profiles != nil) {
            self.profiles = profiles;
            NSLog(@"%lu", self.profiles.count);
            [self.tableView reloadData];
            [self.refreshControl endRefreshing];
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
    UITableViewCell *tappedCell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
    Post *post = self.posts[indexPath.row];
    
    DetailsViewController *detailsViewController = [segue destinationViewController];
    detailsViewController.post = post;
}


@end
