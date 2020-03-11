#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
   
    NSMutableString *sourceString = [NSMutableString stringWithString:string];
                         
    for (int i = 0; i < [sourceString length]; i++) {
        
        NSString *currentCharacter = [sourceString substringWithRange:NSMakeRange(i, 1)];
        
        NSLog(@"%@", currentCharacter);
        
    }
                         
    
    return @[@"Test"];
}

@end
