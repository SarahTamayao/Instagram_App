//
//  ComposeViewController.m
//  Instagram
//
//  Created by rutvims on 7/7/21.
//

#import "ComposeViewController.h"
#import "Post.h"
#import <Parse/Parse.h>
#import "HomeViewController.h"
#import <UITextView_Placeholder/UITextView+Placeholder.h>
#import "LoginViewController.h"

@interface ComposeViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.captionLabel.placeholder = @"Write a caption ...";
    self.captionLabel.placeholderColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view.
}

- (IBAction)cancelPress:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)picturePress:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        NSLog(@"Camera not available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    self.postImage = editedImage;
    [self.addButton setImage: self.postImage forState: UIControlStateNormal];
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)postPressed:(id)sender {
    [Post postUserImage:self.postImage withCaption:self.captionLabel.text
             withCompletion:^(BOOL succeeded, NSError * error) {}];
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    LoginViewController *TabBarController = [storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
//    [self presentViewController:TabBarController animated:YES completion:^{
//    }];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
