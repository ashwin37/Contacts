//
//  ContactDetailsViewController.h
//  Contacts
//
//  Created by Ashwin Tallapaka on 3/4/17.
//  Copyright © 2017 Ashwin Tallapaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactClass.h"

@interface ContactDetailsViewController : UIViewController


//@property (nonatomic, strong) NSMutableArray *jsonIArray;

@property(nonatomic, strong) ContactClass *currentContact;

-(void)getContact:(id)contactObj;
-(void)setLabels;

@end
