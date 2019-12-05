//
//  KPJCountry.m
//  CountriesAndCapitalsObjC
//
//  Created by Kyle Jennings on 12/5/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

#import "KPJCountry.h"
#import "KPJBorders.h"

@implementation KPJCountry

- (instancetype)initWithName:(NSString *)name capital:(NSString *)capital borderCountries:(NSArray<NSString *> *)borderCountries
{
    self = [super init];
    if (self)
    {
        _name = [name copy];
        _capital = [capital copy];
        _borderCountries = [borderCountries copy];
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSString *capital = dictionary[@"capital"];
    NSArray<NSString *> *borderCountries = [[NSArray<NSString *> alloc] initWithArray:dictionary[@"borders"]];
    
    return [self initWithName:name capital:capital borderCountries:borderCountries];
}
@end
