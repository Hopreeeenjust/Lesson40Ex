//
//  RJDatePickerController.h
//  Lesson40Ex
//
//  Created by Hopreeeeenjust on 11.02.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import "ViewController.h"
@protocol RJDatePickerDelegate;

@interface RJDatePickerController : UIViewController
@property (strong, nonatomic) NSDate *currentDate;

@property (weak, nonatomic) id <RJDatePickerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)actionDateValueChanged:(UIDatePicker *)sender;
- (IBAction)actionDoneButtonPressed:(UIBarButtonItem *)sender;
@end

@protocol RJDatePickerDelegate <NSObject>
- (void)didFinishEditingDate:(NSDate *)date;
@end