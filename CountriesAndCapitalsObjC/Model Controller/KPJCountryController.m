//
//  KPJCountryController.m
//  CountriesAndCapitalsObjC
//
//  Created by Kyle Jennings on 12/5/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

#import "KPJCountryController.h"

static NSString *const baseURLString = @"https://restcountries.eu/rest/v2";

@implementation KPJCountryController

+ (void)fetchCountriesWithCompletion:(void (^)(NSArray<KPJCountry *> * _Nonnull))completion
{
    
    NSURL *url = [[NSURL alloc]initWithString:baseURLString];
    NSURL *finalURL = [url URLByAppendingPathComponent:@"all"];
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error: %@", error);
            return completion([NSArray new]);
        }
        
        if (!data)
        {
            NSLog(@"No Data");
            return completion([NSArray new]);
        }
        
        NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSMutableArray *countries = [NSMutableArray new];
        
        for (NSDictionary *countryDictionary in dataDictionary) {
            KPJCountry *country = [[KPJCountry alloc] initWithDictionary:countryDictionary];
            [countries addObject:country];
 //           NSLog(@"Country Name: %@", country.name);
        }
        return completion(countries);
        
    }]resume];
}

+ (void)fetchCountriesFromName:(NSString *)name completion:(void (^)(NSString * _Nonnull))completion
{
    NSURL *url = [[NSURL alloc]initWithString:baseURLString];
    NSURL *secondURL = [url URLByAppendingPathComponent:@"alpha"];
    NSURL *finalURL = [secondURL URLByAppendingPathComponent:name];
    
        [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if (error)
            {
                NSLog(@"Error: %@", error);
                return completion([NSString new]);
            }
            if (!data)
            {
                NSLog(@"No Data");
                return completion([NSString new]);
            }
            
            NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            NSString *countryName = dataDictionary[@"name"];
            return completion(countryName);
            
        }]resume];
}

@end
