//
//  RJGradePickerController.h
//  Lesson40Ex
//
//  Created by Hopreeeeenjust on 11.02.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import "ViewController.h"

@protocol RJGradePickerDelegate;

@interface RJGradePickerController : UIViewController
@property (strong, nonatomic) NSString *currentGrade;
@property (assign, nonatomic) NSInteger row;

@property (weak, nonatomic) id <RJGradePickerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIPickerView *gradePicker;

- (IBAction)actionDoneButtonPressed:(UIBarButtonItem *)sender;
@end

@protocol RJGradePickerDelegate <NSObject>
- (void)didEndEditingGrade:(NSString *)grade inRow:(NSInteger)row;
@end