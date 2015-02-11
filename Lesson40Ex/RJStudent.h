//
//  RJStudent.h
//  Lesson40Ex
//
//  Created by Hopreeeeenjust on 11.02.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RJStudentGenderType) {
    RJStudentGenderTypeMale = 0,
    RJStudentGenderTypeFemale
};

@interface RJStudent : NSObject
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSDate *dateOfBirth;
@property (assign, nonatomic) RJStudentGenderType gender;
@property (assign, nonatomic) NSInteger grade;

- (void)resetAllProperties;
@end
