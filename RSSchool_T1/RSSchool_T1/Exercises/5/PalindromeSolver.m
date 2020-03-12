#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    
    NSMutableString *resultNumberString = [NSMutableString stringWithString:s];
    int numberOfDigitsInNumber = [n intValue];
    int numberOfAvailableReplacements = [k intValue];
    NSString *strinfForReplace = @"9";
    
    BOOL isNumberOfDigitsOdd = (numberOfDigitsInNumber % 2 != 0) ? YES : NO;
    int numberOfDigitsToCheck = isNumberOfDigitsOdd ? (numberOfDigitsInNumber - 1 / 2) : (numberOfDigitsInNumber / 2);
    int coincidencesCounter = 0;
    
    for (int i = 0; i < numberOfDigitsToCheck; i++) {
        
        NSString *firstNumber = [s substringWithRange:NSMakeRange(i, 1)];
        NSString *secondNumber = [s substringWithRange:NSMakeRange(numberOfDigitsInNumber - (i + 1) , 1)];
        
        if ([firstNumber isEqualToString:secondNumber]) {
            coincidencesCounter++;
        }
    }
    
    int numberOfMinReplacements = numberOfDigitsToCheck - coincidencesCounter;
    
    if (numberOfAvailableReplacements < numberOfMinReplacements) {
        return @"-1";
    } else if (numberOfAvailableReplacements == numberOfMinReplacements) {
        
        for (int i = 0; i < numberOfDigitsToCheck; i++) {
            
            NSRange rangeOfFirstNumber = NSMakeRange(i, 1);
            NSRange rangeOfSecondNumber = NSMakeRange(numberOfDigitsInNumber - (i + 1) , 1);
            
            NSString *firstNumber = [s substringWithRange:rangeOfFirstNumber];
            NSString *secondNumber = [s substringWithRange:rangeOfSecondNumber];
            
            if ([firstNumber isEqualToString:secondNumber]) {
                continue;
            } else {
                if ([firstNumber intValue] > [secondNumber intValue]) {
                    [resultNumberString setString:[resultNumberString stringByReplacingCharactersInRange:rangeOfSecondNumber withString:firstNumber]];
                } else {
                    [resultNumberString setString:[resultNumberString stringByReplacingCharactersInRange:rangeOfFirstNumber withString:secondNumber]];
                }
            }
        }
        return resultNumberString;
    } else {
        
        for (int i = 0; i < numberOfDigitsToCheck; i++) {
            
            NSRange rangeOfFirstNumber = NSMakeRange(i, 1);
            NSRange rangeOfSecondNumber = NSMakeRange(numberOfDigitsInNumber - (i + 1) , 1);
            
            NSString *firstNumber = [s substringWithRange:rangeOfFirstNumber];
            NSString *secondNumber = [s substringWithRange:rangeOfSecondNumber];
            
            
            if ([firstNumber isEqualToString:strinfForReplace] && numberOfAvailableReplacements != 0) {
                [resultNumberString setString:[resultNumberString stringByReplacingCharactersInRange:rangeOfSecondNumber withString:strinfForReplace]];
                numberOfAvailableReplacements--;
            } else if ([secondNumber isEqualToString:strinfForReplace] && numberOfAvailableReplacements != 0) {
                [resultNumberString setString:[resultNumberString stringByReplacingCharactersInRange:rangeOfFirstNumber withString:strinfForReplace]];
                numberOfAvailableReplacements--;
            } else {
                continue;
            }
        }
        
        while (numberOfAvailableReplacements > 0) {
        
        
        if (numberOfAvailableReplacements > 1) {
            
            for (int i = 0; i < numberOfDigitsToCheck; i++) {
                
                NSRange rangeOfFirstNumber = NSMakeRange(i, 1);
                NSRange rangeOfSecondNumber = NSMakeRange(numberOfDigitsInNumber - (i + 1) , 1);
                
                NSString *firstNumber = [s substringWithRange:rangeOfFirstNumber];
                NSString *secondNumber = [s substringWithRange:rangeOfSecondNumber];
                
                if (![firstNumber isEqualToString:strinfForReplace] && ![secondNumber isEqualToString:strinfForReplace]) {
                    [resultNumberString setString:[resultNumberString stringByReplacingCharactersInRange:rangeOfFirstNumber withString:strinfForReplace]];
                    numberOfAvailableReplacements--;
                    
                    [resultNumberString setString:[resultNumberString stringByReplacingCharactersInRange:rangeOfSecondNumber withString:strinfForReplace]];
                    numberOfAvailableReplacements--;
                    
                    break;
                }
            }
            
        } else if (numberOfAvailableReplacements == 1) {
            
            if (isNumberOfDigitsOdd) {
                NSRange rangeOfMiddleDigit = NSMakeRange(numberOfDigitsToCheck + 1, 1);
                [resultNumberString setString:[resultNumberString stringByReplacingCharactersInRange:rangeOfMiddleDigit withString:strinfForReplace]];
                numberOfAvailableReplacements--;
            }
        } 
    }
        NSLog(@"%@", resultNumberString);
        return resultNumberString;
    }
}

@end
