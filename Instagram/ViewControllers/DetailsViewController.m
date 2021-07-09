//
//  DetailsViewController.m
//  Instagram
//
//  Created by rutvims on 7/8/21.
//

#import "DetailsViewController.h"
#import "DateTools.h"
#import "Comments.h"
#import "CommentCell.h"

@interface DetailsViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *comments;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.postProfile.file = self.profile [@"image"];
    [self.postProfile loadInBackground];
    PFUser *user = self.post [@"author"];
    self.usernameTextTop.text = user.username;
    self.usernameTextBottom.text = user.username;
    self.imageCaption.text = self.post[@"caption"];
    self.postImage.file = self.post[@"image"];
    [self.postImage loadInBackground];
    //convert date to string
    self.date.text = [self.post.createdAt timeAgoSinceNow];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self refresh];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell" forIndexPath:indexPath];
    Comments *comment = self.comments[indexPath.row];
    cell.displayLabel.text = comment[@"comment"];
    cell.usernameLabel.text = comment[@"username"];
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.comments.count;
}
- (IBAction)sendPress:(id)sender {
    [Comments commentsPost:self.commentsText.text withUsername:self.usernameTextTop.text withCompletion:^(BOOL succeeded, NSError *error){}];
    [self refresh];
    self.commentsText.text = @"";
}
- (void) refresh{
    // construct query
    PFQuery *query = [PFQuery queryWithClassName:@"Comments"];

    // fetch data asynchronouslyirgbljljbirihegdgjfchvbvdnlvtcvf
    [query findObjectsInBackgroundWithBlock:^(NSArray *comments, NSError *error) {
        if (comments != nil) {
            self.comments = comments;
            [self.tableView reloadData];
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
