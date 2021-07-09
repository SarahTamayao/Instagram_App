//
//  Comments.h
//  Instagram
//
//  Created by rutvims on 7/9/21.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Comments : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *username;

+ (void) commentsPost: (NSString * _Nullable)comment withUsername: (NSString * _Nullable)username withCompletion: (PFBooleanResultBlock _Nullable)completion;

@end
