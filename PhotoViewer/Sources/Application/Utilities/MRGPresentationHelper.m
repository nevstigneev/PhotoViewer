//
//  MRGPresentationHelper.m
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 26.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import "MRGPresentationHelper.h"

CGSize mrg_sizeInPixels(CGSize size) {
    CGFloat scaleFactor = [UIScreen mainScreen].scale;
    CGFloat widthInPixels = size.width * scaleFactor;
    CGFloat heightInPixels = size.height * scaleFactor;
    return CGSizeMake(widthInPixels, heightInPixels);
}