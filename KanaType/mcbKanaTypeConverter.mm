//
//  mcbKanaTypeConverter.m
//  KanaType
//
//  Created by Radif Sharafullin on 1/12/14.
//  Copyright (c) 2014 Radif Sharafullin. All rights reserved.
//

#import "mcbKanaTypeConverter.h"
#include "KanaTypeConverter.h"

@implementation mcbKanaTypeConverter
+(NSString *)convertABCToKana:(NSString *)abcString{
    return @(KanaType::Converter::convertABCToKana([abcString UTF8String]).c_str());
}
@end
