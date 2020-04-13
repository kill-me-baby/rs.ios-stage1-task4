#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    
    NSArray* input = [self checkInput:array];
    
    if (input.count == 0) {
        
        return 0;
    }
    
    NSMutableArray* valuesMax = [[NSMutableArray alloc] init];
    NSMutableArray* valuesMin = [[NSMutableArray alloc] init];
    
    NSMutableArray* elementsWithoutMaxValue = [NSMutableArray arrayWithArray:input];
    NSMutableArray* elementsWithoutMinValue = [NSMutableArray arrayWithArray:input];
    
    NSInteger iterationForMaxValue = numberOfItems;
    NSInteger iterationForMinValue = numberOfItems;
    
    if (numberOfItems >= input.count) {
        
        NSInteger result = 1;
        
        for (NSNumber* element in input) {
            
            result *= element.integerValue;
        }
        
        return result;
    }
    
    while (iterationForMaxValue > 0) {
        
        iterationForMaxValue -= 1;
        
        for (NSInteger index = 0; index < elementsWithoutMaxValue.count; index++) {
            
            NSNumber* maxVal = [elementsWithoutMaxValue valueForKeyPath:@"@max.self"];
            
            if ([elementsWithoutMaxValue[index] integerValue] == maxVal.integerValue && [elementsWithoutMaxValue[index] integerValue] > 0) {
                
                [valuesMax addObject:maxVal];
                
                [elementsWithoutMaxValue removeObjectAtIndex:index];
                
                break;
            }
        }
    }
    
    while (iterationForMinValue > 0) {
        
        iterationForMinValue -= 1;
        
        for (NSInteger index = 0; index < elementsWithoutMinValue.count; index++) {
            
            NSNumber* minVal = [elementsWithoutMinValue valueForKeyPath:@"@min.self"];
            
            if ([elementsWithoutMinValue[index] integerValue] == minVal.integerValue && [elementsWithoutMinValue[index] integerValue] < 0) {
                
                [valuesMin addObject:minVal];
                
                [elementsWithoutMinValue removeObjectAtIndex:index];
                
                break;
            }
        }
    }
    
    if (valuesMin.count > 1) {
        
        NSInteger productMaxVal = ([valuesMax[valuesMax.count - 1] integerValue] * [valuesMax[valuesMax.count - 2] integerValue]);
        
        NSInteger productMinVal = [valuesMin[0] integerValue] * [valuesMin[1] integerValue];
        
        if (productMaxVal > productMinVal) {
            
            NSInteger result = 1;
            
            for (NSNumber* element in valuesMax) {
                
                result *= element.integerValue;
            }
            
            return result;
        } else {
            
            valuesMax[valuesMax.count - 1] = valuesMin[0];
            
            valuesMax[valuesMax.count - 2] = valuesMin[1];
            
            NSInteger result = 1;
            
            for (NSNumber* element in valuesMax) {
                
                result *= element.integerValue;
            }
            
            return result;
        }
    } else {
        
        NSInteger result = 1;
        
        for (NSNumber* element in valuesMax) {
            
            result *= element.integerValue;
        }
        
        return result;
    }
}

+ (NSArray*)checkInput:(NSArray*)array {
    
    NSMutableArray* result = [[NSMutableArray alloc] init];
    
    for (NSInteger index = 0; index < array.count; index++) {
        
        if ([array[index] isKindOfClass:[NSNumber class]]) {
            
            [result addObject:array[index]];
        } else {
            
            continue;
        }
    }
    
    return result;
}

@end
