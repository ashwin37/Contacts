//
//  ContactClass.m
//  Contacts
//
//  Created by Ashwin Tallapaka on 3/4/17.
//  Copyright © 2017 Ashwin Tallapaka. All rights reserved.
//

#import "ContactClass.h"

@implementation ContactClass


-(id) initWithName:(NSString *)PersonName mobileNumber:(NSString *)mobile homeAddress:(NSString *)Address WebSite:(NSString *)website Email:(NSString *)emailID WorkingCompany:(NSString *)companyID imageURL:(NSString *)imageUrl phoneNum: (NSString *) phoneNumber largeImageStr: (NSString *) largeImage homeNum: (NSString *) homenumber
{
    self = [super init];
    if (self)
    {
        _nameStr = PersonName;
        _mobileStr = mobile;
        _homeAdd = Address;
        _webStr = website;
        _emailStr = emailID;
        _companyStr = companyID;

        _phoneNumStr = phoneNumber;
        _imageStr = imageUrl;
        _homeNumString = homenumber;

        _imageStr = imageUrl;
        _bigImageStr = largeImage;
  
    }
    return self;
}

@end
