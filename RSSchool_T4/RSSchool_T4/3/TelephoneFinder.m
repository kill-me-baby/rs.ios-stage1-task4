#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    
    NSCharacterSet* notDigits = [NSCharacterSet decimalDigitCharacterSet].invertedSet;
    
    if ([number rangeOfCharacterFromSet:notDigits].location != NSNotFound) {
        
        return nil;
    }
    
    NSMutableArray* result = [[NSMutableArray alloc] init];
    
    NSDictionary<NSNumber*, NSArray <NSNumber*>*>* variantsForNumbers =
    @{@0 : @[@8],          @1 : @[@2, @4],      @2 : @[@1, @3, @5],      @3 : @[@2, @6],
      @4 : @[@1, @5, @7],  @5 : @[@2, @4, @6, @8],  @6 : @[@3, @5, @9],
      @7 : @[@4, @8],      @8 : @[@0, @5, @7, @9],  @9 : @[@6, @8]};
    
    
    NSInteger index = 0;
    
    while (index < number.length) {
        
        NSString* oneElementFromPhoneNumber = [number substringWithRange:NSMakeRange(index,1)];
        
        NSArray<NSNumber*>* variantsForOnlyOneElement = variantsForNumbers[[NSNumber numberWithInteger:oneElementFromPhoneNumber.integerValue]];
        
        for (NSString* element in variantsForOnlyOneElement) {
            
            NSString* newPhoneNumber = [number stringByReplacingCharactersInRange:NSMakeRange(index,1) withString:[NSString stringWithFormat:@"%@", element]];
            
            [result addObject:newPhoneNumber];
        }
        
        index++;
    }
    
    return result;
}

@end
