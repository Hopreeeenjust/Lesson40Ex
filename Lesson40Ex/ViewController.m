//
//  ViewController.m
//  Lesson40Ex
//
//  Created by Hopreeeeenjust on 11.02.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import "ViewController.h"
#import "RJStudent.h"
#import "RJDatePickerController.h"
#import "RJGradePickerController.h"

@implementation RJDateField
@end

@implementation RJGradeField
@end

@interface ViewController () <RJDatePickerDelegate, RJGradePickerDelegate>
@property (strong, nonatomic) NSDate *dateOfBirth;
@property (strong, nonatomic) NSString *grade;
@property (assign, nonatomic) NSInteger rowForGrade;
@property (strong, nonatomic) RJStudent *student;
@end

@implementation ViewController

#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
    RJStudent *student = [RJStudent new];
    [student addObserver:self forKeyPath:@"firstName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [student addObserver:self forKeyPath:@"lastName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [student addObserver:self forKeyPath:@"dateOfBirth" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [student addObserver:self forKeyPath:@"gender" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [student addObserver:self forKeyPath:@"grade" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    self.student = student;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self.student removeObserver:self forKeyPath:@"firstName"];
    [self.student removeObserver:self forKeyPath:@"lastName"];
    [self.student removeObserver:self forKeyPath:@"dateOfBirth"];
    [self.student removeObserver:self forKeyPath:@"gender"];
    [self.student removeObserver:self forKeyPath:@"grade"];
}

#pragma mark - Observing

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"\nobserveValueForKeyPath: %@\nofObject: %@\nchange: %@", keyPath, object, change);
}

#pragma mark - Actions

- (IBAction)actionTextChangedInNameField:(UITextField *)sender {
    self.student.firstName = sender.text;
}

- (IBAction)actionTextChangedInSurnameField:(UITextField *)sender {
    self.student.lastName = sender.text;
}

- (IBAction)actionGenderChanged:(UISegmentedControl *)sender; {
    self.student.gender = sender.selectedSegmentIndex;
}

- (IBAction)actionClear:(UIButton *)sender {
    self.firstNameField.text = nil;
    self.lastNameField.text = nil;
    self.dateOfBirthField.text = nil;
    [self.genderControl setSelectedSegmentIndex:UISegmentedControlNoSegment];
    self.gradeField.text = nil;
    [self.student resetAllProperties];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITextFieldDelegate 

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([textField isKindOfClass:[RJDateField class]]) {
        RJDatePickerController *dc = [self.storyboard instantiateViewControllerWithIdentifier:@"RJDatePickerController"];
        dc.delegate = self;
        if (self.dateOfBirth) {
            dc.currentDate = self.dateOfBirth;
        }
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:dc];
        [self.navigationController presentViewController:nav animated:YES completion:nil];
        return NO;
    } else if ([textField isKindOfClass:[RJGradeField class]]) {
        RJGradePickerController *gc = [self.storyboard instantiateViewControllerWithIdentifier:@"RJGradePickerController"];
        gc.delegate = self;
        if (self.grade) {
            gc.row = self.rowForGrade;
        }
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:gc];
        [self.navigationController presentViewController:nav animated:YES completion:nil];
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}

#pragma mark - RJDatePickerDelegate

- (void)didFinishEditingDate:(NSDate *)date {
    self.dateOfBirth = date;
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd/MMM/yyyy"];
    self.dateOfBirthField.text = [formatter stringFromDate:date];
    self.student.dateOfBirth = self.dateOfBirth;
}

#pragma mark - RJGradePickerDelegate

- (void)didEndEditingGrade:(NSString *)grade inRow:(NSInteger)row{
    self.rowForGrade = row;
    if (grade) {
        self.grade = grade;
    }
    self.gradeField.text = self.grade;
    self.student.grade = [self.grade integerValue];
}

@end
