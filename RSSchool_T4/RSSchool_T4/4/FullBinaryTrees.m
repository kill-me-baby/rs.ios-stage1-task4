#import "FullBinaryTrees.h"

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count {
    
    switch (count) {
        case 0:
            return @"[]";
            break;
            
        case 1:
            return @"[[0]]";
            break;
            
        default:
            break;
    }
    
    if (count % 2 == 0) {
        
        return @"[]";
    }
    
    return @"[[0]]";
}
@end

