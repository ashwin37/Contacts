//
//  ContactClass.h
//  Contacts
//
//  Created by Ashwin Tallapaka on 3/4/17.
//  Copyright © 2017 Ashwin Tallapaka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactClass : NSObject

@property(nonatomic, strong) NSString *nameStr;
@property(nonatomic, strong) NSString *mobileStr;
@property(nonatomic, strong) NSString *homeAdd;
@property(nonatomic, strong) NSString *webStr;
@property(nonatomic, strong) NSString *emailStr;
@property(nonatomic, strong) NSString *companyStr;
@property(nonatomic, strong) NSString *streetStr;
@property(nonatomic, strong) NSString *countryStr;
@property(nonatomic, strong) NSString *zipcodeStr;
@property(nonatomic, strong) NSString *workNumString;
@property(nonatomic, strong) NSString *homeNumString;
@property(nonatomic, strong) NSString *cityStr;
@property(nonatomic, strong) NSString *stateStr;
@property(nonatomic, strong) NSString *phoneNumStr;
@property(nonatomic, strong) NSString *imageStr;
@property(nonatomic, strong) NSString *bigImageStr;



-(id) initWithName:(NSString *)PersonName mobileNumber:(NSString *)mobile homeAddress:(NSString *)Address WebSite:(NSString *)website Email:(NSString *)emailID WorkingCompany:(NSString *)companyID imageURL:(NSString *)imageUrl phoneNum: (NSString *) phoneNumber largeImageStr: (NSString *) largeImage homeNum: (NSString *) homenumber;


@end
