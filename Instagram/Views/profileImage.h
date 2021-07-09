//
//  profileImage.h
//  Instagram
//
//  Created by rutvims on 7/8/21.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface profileImage : PFObject <PFSubclassing>

@property (nonatomic, strong) PFFileObject *image;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *pronouns;
@property (nonatomic, strong) NSString *bio;

+ (void) profileUserImage: (UIImage * _Nullable)image withName: (NSString * _Nullable)name withUsername: (NSString * _Nullable)username withPronouns: (NSString * _Nullable)pronouns withBio: (NSString * _Nullable)bio withCompletion: (PFBooleanResultBlock _Nullable)completion;

@end
