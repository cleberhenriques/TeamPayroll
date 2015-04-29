//
//  NSNumber+Currency.m
//  TeamPayroll
//
//  Created by Cleber Henriques on 4/29/15.
//  Copyright (c) 2015 Cleber Henriques. All rights reserved.
//

#import "NSNumber+Currency.h"

@implementation NSNumber (Currency)

- (NSString *) toLocaleCurrency
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    [numberFormatter setCurrencyDecimalSeparator:@","];
    [numberFormatter setCurrencyGroupingSeparator:@"."];
    NSString *numberAsString = [numberFormatter stringFromNumber:self];
    
    return numberAsString;
}

@end
