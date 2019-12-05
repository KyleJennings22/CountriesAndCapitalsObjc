//
//  KPJCountryController.h
//  CountriesAndCapitalsObjC
//
//  Created by Kyle Jennings on 12/5/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KPJCountry.h"

NS_ASSUME_NONNULL_BEGIN

@interface KPJCountryController : NSObject

+(void)fetchCountriesWithCompletion: (void(^) (NSArray<KPJCountry *> *))completion;


@end

NS_ASSUME_NONNULL_END
