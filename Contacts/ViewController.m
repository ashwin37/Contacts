//
//  ViewController.m
//  Contacts
//
//  Created by Ashwin Tallapaka on 3/4/17.
//  Copyright © 2017 Ashwin Tallapaka. All rights reserved.
//

#import "ViewController.h"
#import "ContactDetailsViewController.h"
#import "ContactClass.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *contactTBV;
@property (nonatomic,strong)NSMutableArray *namesArray;
@property(nonatomic, strong)NSMutableArray *jsonArray;
@property(nonatomic, strong)NSMutableArray *jsonIArray;

@end

@implementation ViewController

@synthesize jsonIArray = _jsonIArray;

- (void)viewDidLoad
{
    [super viewDidLoad];

    _contactTBV.dataSource = self;
    _contactTBV.delegate = self;
    
    self.title = @"Conatcts";

//    // For Seperating the View Color
//    
//    self.contactTBV.separatorColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:0.25];
    [self retriveData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.namesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    ContactClass *contactName = [_namesArray objectAtIndex:indexPath.row];
 cell.textLabel.text = contactName.nameStr;
 cell.detailTextLabel.text = contactName.mobileStr;
    
    NSURL *imageURL = [NSURL URLWithString:contactName.imageStr];
    
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];

//    UIImage * image = [UIImage imageWithData:imageData];
    
    cell.imageView.image =[UIImage imageWithData:imageData];
    
    return cell;
}

-(void) retriveData
{
     NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/technical-challenge/Contacts.json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    _jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

    //Setting up Names Array
    
    _namesArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < _jsonArray.count; i++)
    {
   
        NSString * nameString = [[_jsonArray objectAtIndex:i] objectForKey:@"name"];
        NSDictionary *phoneDic = [_jsonArray objectAtIndex:i];
        NSString *mobileString = phoneDic[@"phone"] [@"mobile"];
        NSString *phoneString = [[_jsonArray objectAtIndex:i] objectForKey:@"phone"];
        NSString *phoneNumString = [[_jsonArray objectAtIndex:i] objectForKey:@"phone"];
         NSString * addString = [[_jsonArray objectAtIndex:i] objectForKey:@"address"];
        
         NSString * websiteString = [[_jsonArray objectAtIndex:i] objectForKey:@"website"];
         NSString * emailString = [[_jsonArray objectAtIndex:i] objectForKey:@"email"];
        
         NSString * companyString = [[_jsonArray objectAtIndex:i] objectForKey:@"company"];

        NSString *imgString = [[_jsonArray objectAtIndex:i] objectForKey:@"smallImageURL"];
        NSString *largeImage = [[_jsonArray objectAtIndex:i] objectForKey:@"largeImageURL"];
   
        ContactClass *contact = [[ContactClass alloc] initWithName:nameString mobileNumber:mobileString homeAddress:addString WebSite:websiteString Email:emailString WorkingCompany:companyString imageURL:imgString phoneNum:phoneString largeImageStr:largeImage homeNum: phoneNumString ];
        
        // Adding our Contact class object to our names array and numberarray
        [_namesArray addObject:contact];

    }
    [self.contactTBV reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"ContactDetails"]) {
       
        NSIndexPath *index = [self.contactTBV indexPathForSelectedRow];
        
        // Get the object for Selected Row.
        
        ContactClass *object = [_namesArray objectAtIndex:index.row];
        [[segue destinationViewController] getContact:object];
 
    }
}

@end
