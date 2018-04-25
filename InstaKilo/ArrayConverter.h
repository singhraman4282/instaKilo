//
//  ArrayConverter.h
//  InstaKilo
//
//  Created by Raman Singh on 2018-04-25.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "photoObject.h"

@interface ArrayConverter : NSObject
-(NSMutableArray *)categorizeByLocation:(NSMutableArray *)givenArray;
-(NSMutableArray *)categorizeByCategory:(NSMutableArray *)givenArray;
-(NSMutableArray *)returnLocNames:(NSMutableArray *)givenArray;
-(NSMutableArray *)returnCatNames:(NSMutableArray *)givenArray;
@end
