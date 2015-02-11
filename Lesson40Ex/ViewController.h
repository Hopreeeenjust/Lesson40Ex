//
//  ViewController.h
//  Lesson40Ex
//
//  Created by Hopreeeeenjust on 11.02.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJStudent.h"

@interface RJDateField : UITextField
@end

@interface RJGradeField : UITextField
@end

@interface ViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet RJDateField *dateOfBirthField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderControl;
@property (weak, nonatomic) IBOutlet RJGradeField *gradeField;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;

- (IBAction)actionTextChangedInNameField:(UITextField *)sender;
- (IBAction)actionTextChangedInSurnameField:(UITextField *)sender;
- (IBAction)actionGenderChanged:(UISegmentedControl *)sender;
- (IBAction)actionClear:(UIButton *)sender;
@end



