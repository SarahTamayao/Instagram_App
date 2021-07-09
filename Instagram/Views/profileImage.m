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
@dynamic name;
@dynamic pronouns;
@dynamic bio;
@dynamic author;

+ (nonnull NSString *)parseClassName {
    return @"profileImage";
}

+ (void) profileUserImage: (UIImage * _Nullable)image withName: (NSString * _Nullable)name withPronouns: (NSString * _Nullable)pronouns withBio: (NSString * _Nullable)bio withCompletion: (PFBooleanResultBlock _Nullable)completion{
    
    profileImage *newProfile = [profileImage new];
    newProfile.name = name;
    newProfile.pronouns = pronouns;
    newProfile.bio = bio;
    newProfile.author = PFUser.currentUser.username;
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
