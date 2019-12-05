//
//  KPJCountry.m
//  CountriesAndCapitalsObjC
//
//  Created by Kyle Jennings on 12/5/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

#import "KPJCountry.h"

@implementation KPJCountry

- (instancetype)initWithName:(NSString *)name capital:(NSString *)capital
{
    self = [super init];
    if (self)
    {
        _name = [name copy];
        _capital = [capital copy];
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSString *capital = dictionary[@"capital"];
    
    return [self initWithName:name capital:capital];
}
@end
