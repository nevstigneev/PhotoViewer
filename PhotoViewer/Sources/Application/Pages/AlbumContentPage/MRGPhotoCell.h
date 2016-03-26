//
//  MRGPhotoCell.h
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 26.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRGPhotoCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;

+ (UINib *)nib;
+ (NSString *)reuseIdentifier;

@end
