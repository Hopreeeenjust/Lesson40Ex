//
//  RJDatePickerController.m
//  Lesson40Ex
//
//  Created by Hopreeeeenjust on 11.02.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import "RJDatePickerController.h"

@interface RJDatePickerController ()

@end

@implementation RJDatePickerController

#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    if (self.currentDate) {
        self.datePicker.date = self.currentDate;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)actionDateValueChanged:(UIDatePicker *)sender {
    self.currentDate = sender.date;
}

- (IBAction)actionDoneButtonPressed:(UIBarButtonItem *)sender {
    [self.delegate didFinishEditingDate:self.currentDate];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
