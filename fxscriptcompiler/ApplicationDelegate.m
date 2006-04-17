//
//  ApplicationDelegate.m
//  Joe's FXScript Compiler
//
//  Created by Joe Maller on 7/14/05.
//  Copyright 2005 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ApplicationDelegate.h"
#import "timesFourTransformer.h"


@implementation ApplicationDelegate
+ (void) initialize
{
    // Register our custom value transformers with NSValueTransformer.
    // These names are used in the "Transformer" field of the bindings
    // inspector within IB.    
    [NSValueTransformer setValueTransformer: [[TimesFourTransformer new] autorelease]
                                    forName: @"tfTrans"];
}

@end
