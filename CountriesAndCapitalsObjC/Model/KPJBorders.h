//
//  KPJBorders.h
//  CountriesAndCapitalsObjC
//
//  Created by Kyle Jennings on 12/5/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KPJBorders : NSObject

@property (nonatomic, readonly, copy) NSArray *country;

-(instancetype)initWithCountry: (NSArray *)country;


-(instancetype)initWithArray: (NSArray *)countryArray;

@end

NS_ASSUME_NONNULL_END
