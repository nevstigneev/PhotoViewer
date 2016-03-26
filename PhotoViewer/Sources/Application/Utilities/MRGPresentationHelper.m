//
//  MRGPresentationHelper.m
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 26.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import "MRGPresentationHelper.h"

CGSize sizeInPixels(CGFloat value) {
    CGFloat scaleFactor = [UIScreen mainScreen].scale;
    CGFloat valueInPixels = value * scaleFactor;
    return CGSizeMake(valueInPixels, valueInPixels);
}