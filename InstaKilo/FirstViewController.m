//
//  FirstViewController.m
//  InstaKilo
//
//  Created by Raman Singh on 2018-04-24.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import "FirstViewController.h"
#import "CustomCollectionViewCell.h"
#import "photoObject.h"
#import "ArrayConverter.h"

@interface FirstViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSMutableArray *array1;
@property (nonatomic) NSMutableArray *array2;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segControl;
@property (nonatomic) NSMutableArray *photoArray;
@property (nonatomic) NSMutableArray *categorizedArray;
@property (nonatomic) NSMutableArray *headerCatsArray;


@end
static NSString * const reuseIdentifier = @"Cell";
@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    photoObject *newPhotoImage = [photoObject new];
    if (!self.photoArray) {
        self.photoArray = [NSMutableArray new];
        for (int i = 1; i <= 10; i++) {
            newPhotoImage = [photoObject new];
            NSString *picName = [NSString stringWithFormat:@"%d.jpg", i];
            
            newPhotoImage.photoName = picName;
            
            int random = arc4random_uniform(4);
            if (random == 0) {
                newPhotoImage.photoLocation = @"Surrey";
                newPhotoImage.photoCategory = @"Cool image";
            }
            if (random == 1) {
                newPhotoImage.photoLocation = @"Surrey";
                newPhotoImage.photoCategory = @"Weird image";
            }
            if (random == 2) {
                newPhotoImage.photoLocation = @"Vancouver";
                newPhotoImage.photoCategory = @"Cool image";
            }
            if (random == 3) {
                newPhotoImage.photoLocation = @"Vancouver";
                newPhotoImage.photoCategory = @"Weird image";
            }
            
            
            [self.photoArray addObject:newPhotoImage];
        }//forLoop
        NSLog(@"total photos is %d", self.photoArray.count);
        
        
    }//if photoArray is empty
    
    
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
    
    
    
    
    
    
    
    
    
    
    self.segControl.selectedSegmentIndex = 0;
    
}//viewDidLoad

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (self.segControl.selectedSegmentIndex == 1) {
        return self.categorizedArray.count;
    }
    else if (self.segControl.selectedSegmentIndex == 2) {
        return self.categorizedArray.count;
    }
    else {
        return 1;
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (self.segControl.selectedSegmentIndex == 1) {
        NSMutableArray *thisArray = [NSMutableArray new];
        if (section == 0) {
            thisArray = [self.categorizedArray objectAtIndex:0];
        }
        else if (section == 1) {
            thisArray = [self.categorizedArray objectAtIndex:1];
        }
        return thisArray.count;
    }
    if (self.segControl.selectedSegmentIndex == 2) {
        NSMutableArray *thisArray = [NSMutableArray new];
        if (section == 0) {
            thisArray = [self.categorizedArray objectAtIndex:0];
        }
        else if (section == 1) {
            thisArray = [self.categorizedArray objectAtIndex:1];
        }
        return thisArray.count;
    }
    else
        
        return self.photoArray.count;
}









- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    
    if (self.segControl.selectedSegmentIndex == 0){
        photoObject *newPhotoObject = [self.photoArray objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:newPhotoObject.photoName];
        int randomContentMode = arc4random_uniform(4);
        switch (randomContentMode) {
            case 0:
            {
                cell.imageView.contentMode = UIViewContentModeTop;
                NSLog(@"%d", randomContentMode);
            }
            case 1:
            {
                cell.imageView.contentMode = UIViewContentModeLeft;
                NSLog(@"%d", randomContentMode);
            }
            case 2:
            {
                cell.imageView.contentMode = UIViewContentModeRight;
                NSLog(@"%d", randomContentMode);
            }
            case 3:
            {
                cell.imageView.contentMode = UIViewContentModeBottom;
                NSLog(@"%d", randomContentMode);
            }
                
                
            default:
                break;
                
        }
        cell.locationLabel.text = newPhotoObject.photoLocation;
        cell.categoryLabel.text = newPhotoObject.photoCategory;
    }//AllPhotos
    
    if (self.segControl.selectedSegmentIndex == 1) {
        NSMutableArray *thisArray = [NSMutableArray new];
        if (indexPath.section == 0) {
            thisArray = [self.categorizedArray objectAtIndex:0];
            photoObject *newPhotoObject = [thisArray objectAtIndex:indexPath.row];
            cell.imageView.image = [UIImage imageNamed:newPhotoObject.photoName];
            int randomContentMode = arc4random_uniform(4);
            switch (randomContentMode) {
                case 0:
                {
                    cell.imageView.contentMode = UIViewContentModeTop;
                    NSLog(@"%d", randomContentMode);
                }
                case 1:
                {
                    cell.imageView.contentMode = UIViewContentModeLeft;
                    NSLog(@"%d", randomContentMode);
                }
                case 2:
                {
                    cell.imageView.contentMode = UIViewContentModeRight;
                    NSLog(@"%d", randomContentMode);
                }
                case 3:
                {
                    cell.imageView.contentMode = UIViewContentModeBottom;
                    NSLog(@"%d", randomContentMode);
                }
                    
                    
                default:
                    break;
                    
            }
            cell.locationLabel.text = newPhotoObject.photoLocation;
            cell.categoryLabel.text = newPhotoObject.photoCategory;
        }//section0
        if (indexPath.section == 1) {
            thisArray = [self.categorizedArray objectAtIndex:1];
            photoObject *newPhotoObject = [thisArray objectAtIndex:indexPath.row];
            cell.imageView.image = [UIImage imageNamed:newPhotoObject.photoName];
            int randomContentMode = arc4random_uniform(4);
            switch (randomContentMode) {
                case 0:
                {
            cell.imageView.contentMode = UIViewContentModeTop;
                    NSLog(@"%d", randomContentMode);
                }
                case 1:
                {
                    cell.imageView.contentMode = UIViewContentModeLeft;
                    NSLog(@"%d", randomContentMode);
                }
                case 2:
                {
                    cell.imageView.contentMode = UIViewContentModeRight;
                    NSLog(@"%d", randomContentMode);
                }
                case 3:
                {
                    cell.imageView.contentMode = UIViewContentModeBottom;
                    NSLog(@"%d", randomContentMode);
                }
                    
                    
                default:
                    break;
                    
            }
            cell.locationLabel.text = newPhotoObject.photoLocation;
            cell.categoryLabel.text = newPhotoObject.photoCategory;
        }//section1
        
        //UIViewContentModeScaleAspectFill UIViewContentModeScaleAspectFit UIViewContentModeScaleAspectFit UIViewContentModeScaleAspectFill
    }//Location
    
    if (self.segControl.selectedSegmentIndex == 2) {
        NSMutableArray *thisArray = [NSMutableArray new];
        if (indexPath.section == 0) {
            thisArray = [self.categorizedArray objectAtIndex:0];
            photoObject *newPhotoObject = [thisArray objectAtIndex:indexPath.row];
            cell.imageView.image = [UIImage imageNamed:newPhotoObject.photoName];
            cell.locationLabel.text = newPhotoObject.photoLocation;
            cell.categoryLabel.text = newPhotoObject.photoCategory;
        }//section0
        if (indexPath.section == 1) {
            thisArray = [self.categorizedArray objectAtIndex:1];
            photoObject *newPhotoObject = [thisArray objectAtIndex:indexPath.row];
            cell.imageView.image = [UIImage imageNamed:newPhotoObject.photoName];
            cell.locationLabel.text = newPhotoObject.photoLocation;
            cell.categoryLabel.text = newPhotoObject.photoCategory;
        }//section1
        
        
    }//Location
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        if (self.headerCatsArray.count > 0) {
        
        NSString *title = [self.headerCatsArray objectAtIndex:indexPath.section];
        
        
        headerView.headerLabel.text = title;
        } else {
            headerView.headerLabel.text = @"";
        }
        
        reusableview = headerView;
    }
    
    
    
    return reusableview;
    
    
}








- (IBAction)segClicked:(UISegmentedControl *)sender {
    
    
    
    if (self.segControl.selectedSegmentIndex == 0) {
        self.headerCatsArray = [NSMutableArray new];
        [self.collectionView reloadData];
        
        
    }//0
    
    if (self.segControl.selectedSegmentIndex == 1) {
        self.categorizedArray = [NSMutableArray new];
        ArrayConverter *myArrayConverter = [ArrayConverter new];
        
        self.headerCatsArray = [NSMutableArray new];
        self.headerCatsArray = [myArrayConverter returnLocNames:self.photoArray];
        
        
        
        self.categorizedArray = [myArrayConverter categorizeByLocation:self.photoArray];
        NSMutableArray *thisArray = [NSMutableArray new];
        [self.collectionView reloadData];
    }//1
    
    if (self.segControl.selectedSegmentIndex == 2) {
        self.categorizedArray = [NSMutableArray new];
        ArrayConverter *myArrayConverter = [ArrayConverter new];
        
        self.headerCatsArray = [NSMutableArray new];
        self.headerCatsArray = [myArrayConverter returnCatNames:self.photoArray];
        
        self.categorizedArray = [myArrayConverter categorizeByCategory:self.photoArray];
        [self.collectionView reloadData];
        NSMutableArray *thisArray = [self.categorizedArray objectAtIndex:0];
       
    }//2
    
}//segClicked





@end


/*
 
 photoObject *myPhotoObject = [photoObject new];
 self.bigLocationArray = [NSMutableArray new];
 self.locationNamesArray = [NSMutableArray new];
 for (int i = 0; i < 10; i++) {
 myPhotoObject = [self.photoArray objectAtIndex:i];
 NSString *imageLoc = myPhotoObject.photoLocation;
 
 if (![self.locationNamesArray containsObject:imageLoc]) {
 [self.locationNamesArray addObject:imageLoc];
 }
 }//forLoop
 
 for (int i = 0; i < self.locationNamesArray.count; i++) {
 NSString *cityName = [self.locationNamesArray objectAtIndex:i];
 NSMutableArray *thisArray = [NSMutableArray new];
 for (int j = 0; j < self.photoArray.count; j++) {
 photoObject *myPhotoObject = [self.photoArray objectAtIndex:j];
 if ([myPhotoObject.photoLocation isEqualToString:cityName]) {
 [thisArray addObject:myPhotoObject];
 }//if
 }//for loop with j
 
 [self.bigLocationArray addObject:thisArray];
 
 }//locationArrayForLoop
 */
