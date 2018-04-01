//
//  People.h
//  EnergySaverApp
//
//  Created by Admin on 30/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject


// Local Variables for storing inputs from DATABASE.
@property (nonatomic, copy) NSString *name;             // Field Values contained in the Database
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *points;
@property (nonatomic, copy) NSString *typeofenergy;
@property (nonatomic, copy) NSString *unitsconsumed;
@property (nonatomic, copy) NSString *rank;
@property (nonatomic, assign) int rating;

@end
