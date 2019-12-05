//
//  KPJCountry.h
//  CountriesAndCapitalsObjC
//
//  Created by Kyle Jennings on 12/5/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KPJBorders;

NS_ASSUME_NONNULL_BEGIN

@interface KPJCountry : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *capital;
@property (nonatomic, readonly, copy) NSArray<NSString *> *borderCountries;


-(instancetype)initWithName: (NSString *)name capital: (NSString *)capital borderCountries: (NSArray<NSString *> *)borderCountries;

-(instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
