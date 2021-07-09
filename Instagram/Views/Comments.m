//
//  Comments.m
//  Instagram
//
//  Created by rutvims on 7/9/21.
//

#import <Foundation/Foundation.h>
#import "Comments.h"
#import <Parse/Parse.h>

@implementation Comments

@dynamic comment;
@dynamic username;

+ (nonnull NSString *)parseClassName {
    return @"Comments";
}

+ (void) commentsPost:(NSString * _Nullable)comment withUsername: (NSString * _Nullable)username withCompletion: (PFBooleanResultBlock _Nullable)completion{
    
    Comments *newComment = [Comments new];
    newComment.comment = comment;
    newComment.username = username;
    [newComment saveInBackgroundWithBlock: completion];
}

@end

