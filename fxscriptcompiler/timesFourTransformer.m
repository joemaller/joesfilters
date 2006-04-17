//
//  timesFourTransformer.m
//  Joe's FXScript Compiler
//
//  Created by Joe Maller on 7/14/05.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "timesFourTransformer.h"

@implementation TimesFourTransformer
+ (Class)transformedValueClass
{
    return [NSNumber class];
}

+ (BOOL)allowsReverseTransformation
{
    return NO;   
}

- (id)transformedValue:(id)value
{
    if (value == nil) return nil;
    
    if (![value respondsToSelector: @selector(doubleValue)]) {
        [NSException raise: NSInternalInconsistencyException
                    format: @"Value does not respond to -doubleValue.  No idea what to do. (Value is an instance of %@).",
		     [value class]];
    }
    
    float newInputValue = [value doubleValue]; // handles NSString and NSNumber
    float newValue = newInputValue * 4;
    return [NSNumber numberWithDouble: newValue];
}

@end
