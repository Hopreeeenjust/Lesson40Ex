//
//  RJGradePickerController.m
//  Lesson40Ex
//
//  Created by Hopreeeeenjust on 11.02.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import "RJGradePickerController.h"

@interface RJGradePickerController () <UIPickerViewDataSource, UIPickerViewDelegate>
@end

@implementation RJGradePickerController

#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.row) {
        [self.gradePicker selectRow:self.row inComponent:0 animated:NO];
    } else {
        self.currentGrade = @"1";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)actionDoneButtonPressed:(UIBarButtonItem *)sender {
    [self.delegate didEndEditingGrade:self.currentGrade inRow:self.row];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%ld", row + 1];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.row = row;
    self.currentGrade = [NSString stringWithFormat:@"%ld", row + 1];
}

@end
