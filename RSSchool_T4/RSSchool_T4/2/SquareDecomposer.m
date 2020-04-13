#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    
    NSMutableArray* result = [self decomposeBySumSquares:number.integerValue remain:(number.integerValue * number.integerValue)];
    
    if (result == nil) {
        
        return nil;
    } else {
        
        [result removeLastObject];
        
        return result;
    }
}

- (NSMutableArray*)decomposeBySumSquares:(NSInteger)processedValue remain:(NSInteger)inputRemain {
    
    if (inputRemain == 0) {
        
        return [NSMutableArray arrayWithObject:[NSNumber numberWithInteger:processedValue]];
    }
    
    NSInteger index = processedValue - 1;
    
    while (index > 0) {
        
        if ((inputRemain - index * index) >= 0) {
            
            NSMutableArray* checkedValues = [self decomposeBySumSquares:index remain:(inputRemain - (index * index))];
            
            if (checkedValues != nil) {
                
                [checkedValues addObject:[NSNumber numberWithInteger:processedValue]];
                
                return checkedValues;
            }
        }
        
        index -= 1;
    }
    
    return nil;
}

@end
