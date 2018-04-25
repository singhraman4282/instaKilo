//
//  CustomCollectionViewCell.h
//  InstaKilo
//
//  Created by Raman Singh on 2018-04-24.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UILabel *categoryLabel;


@end
