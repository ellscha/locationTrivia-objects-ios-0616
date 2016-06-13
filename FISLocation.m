//
//  FISLocation.m
//
//
//  Created by Elli Scharlin on 6/13/16.
//
//

#import "FISLocation.h"

@implementation FISLocation


-(instancetype) init{
    self = [self initWithName:@"" latitude:0.00 longitude:0.00];
    return self;
}

-(instancetype) initWithName:(NSString *)name
                    latitude:(CGFloat)latitude
                   longitude:(CGFloat)longitude{
    self = [super init];
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [[NSMutableArray alloc] init];
    }
    return self;
}


-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length{
    NSMutableString *truncatedString = [[NSMutableString alloc]initWithString:self.name];
    if (self.name.length <= length) {
        return truncatedString;
    } else if (self.name.length == 0) {
        return @"";
    } else {
        truncatedString = [self.name substringToIndex:length];
        return truncatedString;
    }
    return truncatedString;
}

-(BOOL)hasValidData{
    if (!self.name || [self.name isEqualToString: @""]) {
        return NO;
    } else if (self.latitude < -90.0 || self.latitude > 90.0){
        return NO;
    } else if (self.longitude <= -180.0 || self.longitude > 180.0){
        return NO;
    }
    return YES;
    
}
-(FISTrivium *)triviumWithMostLikes{
    if (!self.trivia || [self.trivia isEqualToArray: @[]]) {
        return nil;
    }
    //    FISTrivium *mostLikes = [[FISTrivium alloc]init];
    //
    //    for (FISTrivium *trivium in self.trivia) {
    //        if (trivium.likes >= mostLikes.likes) {
    //            mostLikes = trivium;
    //        }
    //    }
    //    return mostLikes;
    NSSortDescriptor *sortByHighestLikes = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:NO];
    [self.trivia sortUsingDescriptors:@[sortByHighestLikes]];
    FISTrivium *mostLikedObject = self.trivia[0];
    return mostLikedObject;
}



@end
