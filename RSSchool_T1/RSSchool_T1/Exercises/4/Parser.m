#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
   
    NSMutableString *sourceString = [NSMutableString stringWithString:string];
    NSMutableArray *resultArray = [NSMutableArray array];
    
    NSCharacterSet *openSet = [NSCharacterSet characterSetWithCharactersInString:@"[(<"];
    
    for (int i = 0; i < [sourceString length]; i++) {
        
        NSString *currentCharacter = [sourceString substringWithRange:NSMakeRange(i, 1)];
        
        if ([currentCharacter rangeOfCharacterFromSet:openSet].location != NSNotFound) {
            
            NSMutableString *resultString = [NSMutableString string];
            int repeatCounter = 0;
            
            for (int j = i + 1; j < [sourceString length]; j++) {
                
                NSString *resultCharacter = [sourceString substringWithRange:NSMakeRange(j, 1)];
                
                if ([resultCharacter isEqualToString:[self closeBracketForOpenBracket:currentCharacter]] && repeatCounter == 0) {
                    
                    [resultArray addObject:resultString];
                    break;
                    
                }  else if ([resultCharacter isEqualToString:[self closeBracketForOpenBracket:currentCharacter]] && repeatCounter != 0){
                    
                    [resultString appendString:resultCharacter];
                    repeatCounter--;
                    
                } else if ([resultCharacter isEqualToString:currentCharacter]) {
                    
                    repeatCounter++;
                    [resultString appendString:resultCharacter];
                    
                } else {
                    [resultString appendString:resultCharacter];
                }
            }
        }
    }
    
    return resultArray;
}

- (NSString *)closeBracketForOpenBracket:(NSString *)openBracket {
    
    NSString *openSquareBracket = @"[";
    NSString *closeSquareBracket = @"]";
    NSString *openRoundBracket = @"(";
    NSString *closeRoundBracket = @")";
    NSString *openMoreLessBracket = @"<";
    NSString *closeMoreLessBracket = @">";
    
    if ([openBracket isEqualToString:openSquareBracket]) {
        return closeSquareBracket;
    } else if ([openBracket isEqualToString:openRoundBracket]) {
        return closeRoundBracket;
    } else if ([openBracket isEqualToString:openMoreLessBracket]) {
        return closeMoreLessBracket;
    } else {
        return @"";
    }
}

@end
