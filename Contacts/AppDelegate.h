//
//  AppDelegate.h
//  Contacts
//
//  Created by Ashwin Tallapaka on 3/4/17.
//  Copyright © 2017 Ashwin Tallapaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

