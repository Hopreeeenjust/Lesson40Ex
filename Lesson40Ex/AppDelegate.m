//
//  AppDelegate.m
//  Lesson40Ex
//
//  Created by Hopreeeeenjust on 11.02.15.
//  Copyright (c) 2015 Hopreeeeenjust. All rights reserved.
//

#import "AppDelegate.h"
#import "RJStudent.h"

@interface AppDelegate ()
@property (strong, nonatomic) RJStudent *student;
@property (strong, nonatomic) NSArray *students;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSArray *maleNamesArray = @[@"Roma", @"Bill", @"Sam", @"Denis", @"Alex", @"Sergey", @"Bob", @"Rob", @"John", @"Simon", @"Nick", @"Piter", @"James", @"Kiran", @"Martin", @"Igor", @"Maks", @"Robby", @"Harry", @"Vova", @"Dima"];
    NSArray *femaleNamesArray = @[@"Alexandra", @"Anna", @"Liz", @"Helen", @"Katty", @"Veronica", @"Jane", @"Cristina", @"Britney", @"Darya", @"Naomy", @"Maria", @"Angelika", @"Svetlana", @"Natalia", @"Marina", @"Margaret"];
    NSArray *surnamesArray = @[@"Gibbs", @"Smith", @"Beniakovski", @"Long", @"Potter", @"Bond", @"Russel", @"Ostin", @"Mendez", @"Green", @"Bullock", @"Jones", @"Freeman", @"Murphy", @"Hanks", @"Goldberg", @"Williams", @"Depp", @"Hoffman", @"Martin", @"Law", @"Oldman", @"Carter", @"Hopkins", @"Delon"];
    
    self.students = [NSArray new];
    
    for (NSInteger i = 0; i < 15; i++) {
        RJStudent *student = [RJStudent new];
        student.gender = arc4random_uniform(2 * 1000) / 1000;
        if (student.gender == RJStudentGenderTypeFemale) {
            student.firstName = [femaleNamesArray objectAtIndex:(int)(arc4random_uniform((int)[femaleNamesArray count] * 1000) / 1000)];
        } else {
            student.firstName = [maleNamesArray objectAtIndex:(int)(arc4random_uniform((int)[maleNamesArray count] * 1000) / 1000)];
        }
        student.lastName = [surnamesArray objectAtIndex:(int)(arc4random_uniform((int)[surnamesArray count] * 1000) / 1000)];
        NSInteger age = arc4random_uniform(18 * 31556926) + 17 * 31556926;
        student.dateOfBirth = [NSDate dateWithTimeIntervalSinceNow:-age];
        student.grade = arc4random_uniform(11 * 1000) / 1000;
        [[self mutableArrayValueForKey:@"students"] addObject:student];
    }
    
    NSArray *namesArray = [self valueForKeyPath:@"students.@unionOfObjects.firstName"];
    NSLog(@"%@", namesArray);
    
    NSDate *firstDate = [self valueForKeyPath:@"students.@min.dateOfBirth"];
    NSDate *lastDate = [self valueForKeyPath:@"students.@max.dateOfBirth"];
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd/MMM/yyyy"];
    NSLog(@"The youngest student was born on %@ and the oldest one - on %@", [formatter stringFromDate:lastDate], [formatter stringFromDate:firstDate]);
    
    NSLog(@"Average grade is %@ and total grade is %@", [self valueForKeyPath:@"students.@avg.grade"], [self valueForKeyPath:@"students.@sum.grade"]);
    return YES;
}

-(void)dealloc {
    [self.student removeObserver:self forKeyPath:@"firstName"];
}

#pragma mark - Observing

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"\nobserveValueForKeyPath: %@\nofObject: %@\nchange: %@", keyPath, object, change);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
