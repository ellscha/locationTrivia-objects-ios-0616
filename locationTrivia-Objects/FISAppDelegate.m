//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(NSArray *)allLocationNames{
    NSMutableArray *namesOfLocations = [NSMutableArray new];
    for (FISLocation *location in self.locations) {
        [namesOfLocations addObject:location.name];
    }
    return namesOfLocations;
}

-(FISLocation *)locationNamed:(NSString *)name{
    for (FISLocation *location in self.locations) {
        if ([location.name isEqualToString:name]) {
            return location;
        }
    }
    return nil;
  
    
//    NSPredicate *nameIsTheSamePred = [NSPredicate predicateWithFormat:@"name LIKE '%@'", name];

}

-(NSArray *)locationsNearLatitude:(CGFloat)latitude
                        longitude:(CGFloat)longitude
                           margin:(CGFloat)margin{
    NSMutableArray *locationsNearGivenPoint = [[NSMutableArray alloc]init];
    for (FISLocation *location in self.locations) {
        CGFloat upperBoundLongitude = longitude + margin;
        CGFloat lowerBoundLongitude = longitude - margin;
        CGFloat upperBoundLatitude = latitude + margin;
        CGFloat lowerBoundLatitude = latitude - margin;
        if (location.longitude <= upperBoundLongitude && location.longitude >= lowerBoundLongitude && location.latitude <= upperBoundLatitude && location.latitude >= lowerBoundLatitude) {
            [locationsNearGivenPoint addObject:location];
        }
    }
    return locationsNearGivenPoint;
}

@end
