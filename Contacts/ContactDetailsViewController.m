//
//  ContactDetailsViewController.m
//  Contacts
//
//  Created by Ashwin Tallapaka on 3/4/17.
//  Copyright © 2017 Ashwin Tallapaka. All rights reserved.
//

#import "ContactDetailsViewController.h"

@interface ContactDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *companyLbl;
@property (weak, nonatomic) IBOutlet UILabel *mobileLbl;
@property (weak, nonatomic) IBOutlet UILabel *workLbl;
@property (weak, nonatomic) IBOutlet UILabel *homeLbl;
@property (weak, nonatomic) IBOutlet UILabel *emailLbl;
@property (weak, nonatomic) IBOutlet UILabel *cityLbl;
@property (weak, nonatomic) IBOutlet UILabel *streetLbl;
@property (weak, nonatomic) IBOutlet UILabel *stateLbl;
@property (weak, nonatomic) IBOutlet UILabel *countryLbl;
@property (weak, nonatomic) IBOutlet UILabel *zipLbl;
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;

@end

@implementation ContactDetailsViewController
@synthesize currentContact;

@synthesize nameLbl, companyLbl, mobileLbl, workLbl, homeLbl, emailLbl, cityLbl, streetLbl, stateLbl, countryLbl, zipLbl;

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setLabels];
    
    //    NSLog(@"%@t is json Array:--", _jsonIArray);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)getContact:(id)contactObj
{
    currentContact = contactObj;
}

-(void)setLabels
{
    // Set Our Labels
    
       nameLbl.text = currentContact.nameStr;
        companyLbl.text = currentContact.companyStr;
    NSDictionary *phoneDic1 = currentContact.phoneNumStr;
 
        mobileLbl.text =  phoneDic1 [@"mobile"];
    
        workLbl.text = phoneDic1 [@"work"];
        homeLbl.text = phoneDic1 [@"home"];
  
    NSDictionary *addDictionary = currentContact.homeAdd;
    
    emailLbl.text = currentContact.emailStr;
    cityLbl.text = addDictionary [@"city"];
        streetLbl.text = addDictionary [@"street"];
        stateLbl.text = addDictionary [@"state"];
        countryLbl.text = addDictionary [@"country"];
        zipLbl.text = addDictionary [@"zip"];
    
    NSURL *imageURL = [NSURL URLWithString:currentContact.imageStr];//helps to convert Str to image url
    
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];

//        UIImage * image = [UIImage imageWithData:imageData];
    
    _detailImageView.image = [UIImage imageWithData:imageData];
    
    
}
@end
