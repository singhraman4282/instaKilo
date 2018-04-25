//
//  FirstViewController.h
//  InstaKilo
//
//  Created by Raman Singh on 2018-04-24.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"

@interface FirstViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic) NSMutableArray *imagesArray;
@property (nonatomic) NSMutableArray *locArray;
@property (nonatomic) NSMutableArray *catArray;
@end
