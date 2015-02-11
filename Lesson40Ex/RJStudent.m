//
//  RJStudent.m
//  Lesson40Ex
//
//  Created by Hopreeeeenjust on 11.02.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import "RJStudent.h"

@interface RJStudent ()

@end

@implementation RJStudent

- (void)resetAllProperties {
    [self willChangeValueForKey:@"firstName"];
    _firstName = nil;
    [self didChangeValueForKey:@"firstName"];
    [self willChangeValueForKey:@"lastName"];
    _lastName = nil;
    [self didChangeValueForKey:@"lastName"];
    [self willChangeValueForKey:@"dateOfBirth"];
    _dateOfBirth = nil;
    [self didChangeValueForKey:@"dateOfBirth"];
    [self willChangeValueForKey:@"gender"];
    _gender = 0;
    [self didChangeValueForKey:@"gender"];
    [self willChangeValueForKey:@"grade"];
    _grade = 0;
    [self didChangeValueForKey:@"grade"];
}

@end
