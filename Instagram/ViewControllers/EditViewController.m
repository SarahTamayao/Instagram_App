//
//  EditViewController.m
//  Instagram
//
//  Created by rutvims on 7/8/21.
//

#import "EditViewController.h"
#import <Parse/Parse.h>
#import "Post.h"
#import "GridViewController.h"
#import "profileImage.h"

@interface EditViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.profileImage setImage:self.profileImageHolder];
}
- (IBAction)changePicPress:(id)sender {
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
    self.profileImageHolder = editedImage;
    [self.profileImage setImage:editedImage];
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveChangesPressed:(id)sender {
    [profileImage profileUserImage:self.profileImageHolder withName:self.nameText.text withPronouns:self.pronounsText.text withBio:self.bioText.text withCompletion:^(BOOL succeeded, NSError *error){}];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GridViewController *TabBarController = [storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
    [self presentViewController:TabBarController animated:YES completion:^{
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
