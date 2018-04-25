//
//  ArrayConverter.m
//  InstaKilo
//
//  Created by Raman Singh on 2018-04-25.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import "ArrayConverter.h"

@implementation ArrayConverter
-(NSMutableArray *)categorizeByLocation:(NSMutableArray *)givenArray {
    NSMutableArray *categorizedArray = [NSMutableArray new];
    photoObject *myPhotoObject = [photoObject new];
    
    NSMutableArray *locationNamesArray = [NSMutableArray new];
    for (int i = 0; i < givenArray.count; i++) {
        myPhotoObject = [givenArray objectAtIndex:i];
        NSString *imageLoc = myPhotoObject.photoLocation;
        
        if (![locationNamesArray containsObject:imageLoc]) {
            [locationNamesArray addObject:imageLoc];
        }
    }//forLoop
    NSMutableArray *thisArray = [NSMutableArray new];
    NSString *cityName = [NSString new];
    for (int i = 0; i < locationNamesArray.count; i++) {
        cityName = [locationNamesArray objectAtIndex:i];
        thisArray = [NSMutableArray new];
        
        
        
        for (int j = 0; j < givenArray.count; j++) {
            
            myPhotoObject = [givenArray objectAtIndex:j];
            if ([myPhotoObject.photoLocation isEqualToString:cityName]) {
                [thisArray addObject:myPhotoObject];
            }//if
            
        }//for loop with j
        
        [categorizedArray addObject:thisArray];
        
        
    }//secondForLoop
    
    return categorizedArray;
}//categorizeByLocation


-(NSMutableArray *)categorizeByCategory:(NSMutableArray *)givenArray {
    
    NSMutableArray *categorizedArray = [NSMutableArray new];
    photoObject *myPhotoObject = [photoObject new];
    
    NSMutableArray *catNamesArray = [NSMutableArray new];
    for (int i = 0; i < givenArray.count; i++) {
        myPhotoObject = [givenArray objectAtIndex:i];
        NSString *imageLoc = myPhotoObject.photoCategory;
        
        if (![catNamesArray containsObject:imageLoc]) {
            [catNamesArray addObject:imageLoc];
        }
    }//forLoop
    
    for (int i = 0; i < catNamesArray.count; i++) {
        NSString *cityName = [catNamesArray objectAtIndex:i];
        NSMutableArray *thisArray = [NSMutableArray new];
        for (int j = 0; j < givenArray.count; j++) {
            photoObject *myPhotoObject = [givenArray objectAtIndex:j];
            if ([myPhotoObject.photoCategory isEqualToString:cityName]) {
                [thisArray addObject:myPhotoObject];
            }//if
        }//for loop with j
        
        [categorizedArray addObject:thisArray];
    }//secondForLoop
    
    return categorizedArray;
}//categorizeByCategory

-(NSMutableArray *)returnLocNames:(NSMutableArray *)givenArray {
    NSMutableArray *locNames = [NSMutableArray new];
    photoObject *myPhotoObject = [photoObject new];
    
    for (int i = 0; i < givenArray.count; i++) {
        myPhotoObject = [givenArray objectAtIndex:i];
        NSString *imageLoc = myPhotoObject.photoLocation;
        
        if (![locNames containsObject:imageLoc]) {
            [locNames addObject:imageLoc];
        }
    }//forLoop
    
    return locNames;
}//returnLocNames

-(NSMutableArray *)returnCatNames:(NSMutableArray *)givenArray {
    NSMutableArray *locNames = [NSMutableArray new];
    photoObject *myPhotoObject = [photoObject new];
    
    for (int i = 0; i < givenArray.count; i++) {
        myPhotoObject = [givenArray objectAtIndex:i];
        NSString *imageLoc = myPhotoObject.photoCategory;
        
        if (![locNames containsObject:imageLoc]) {
            [locNames addObject:imageLoc];
        }
    }//forLoop
    
    return locNames;
}//returnLocNames

@end
