//
//  timesFourTransformer.h
//  Joe's FXScript Compiler
//
//  Created by Joe Maller on 7/14/05.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//


@interface TimesFourTransformer : NSValueTransformer
+ (Class)transformedValueClass;
+ (BOOL)allowsReverseTransformation;

- (id)transformedValue:(id)value;
@end
