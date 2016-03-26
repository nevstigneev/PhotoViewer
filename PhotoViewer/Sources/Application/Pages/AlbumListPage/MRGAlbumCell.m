//
//  MRGAlbumCell.m
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 26.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import "MRGAlbumCell.h"

@implementation MRGAlbumCell

+ (UINib *)nib {
    return [UINib nibWithNibName:[self reuseIdentifier] bundle:nil];
}
+ (NSString *)reuseIdentifier {
    return NSStringFromClass(self);
}

@end
