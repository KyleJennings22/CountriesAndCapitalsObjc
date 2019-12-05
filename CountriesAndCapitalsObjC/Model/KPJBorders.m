//
//  KPJBorders.m
//  CountriesAndCapitalsObjC
//
//  Created by Kyle Jennings on 12/5/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

#import "KPJBorders.h"

@implementation KPJBorders

- (instancetype)initWithCountry:(NSArray *)country
{
    self = [super init];
    if (self)
    {
        _country = [country copy];
    }
    return self;
}

- (instancetype)initWithArray:(NSArray *)countryArray
{
    NSMutableArray *countries = [NSMutableArray new];
    
    for (NSString *country in countryArray)
    {
        [countries addObject:country];
        NSLog(@"Border Countries: %@", country);
    }
    return [self initWithCountry:countries];
}
@end
