//
//  profileImage.m
//  Instagram
//
//  Created by rutvims on 7/8/21.
//

#import <Foundation/Foundation.h>
#import "profileImage.h"
#import <Parse/Parse.h>

@implementation profileImage

@dynamic image;

+ (nonnull NSString *)parseClassName {
    return @"profileImage";
}

+ (void)profileUserImage:(UIImage *)image withCompletion:(PFBooleanResultBlock)completion{
    
    profileImage *newProfile = [profileImage new];
    newProfile.image = [self getPFFileFromImage:image];
    
    [newProfile saveInBackgroundWithBlock: completion];
}

+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image {
 
    // check if image is not nil
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFileObject fileObjectWithName:@"profile.png" data:imageData];
}

@end
