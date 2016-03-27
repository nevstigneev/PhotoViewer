//
//  MRGPhotoPreviewViewController.h
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 27.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MRGBaseViewController.h"

@class PHAsset;

@interface MRGPhotoPreviewViewController : MRGBaseViewController

@property (strong, nonatomic) PHAsset *asset;

@end
