//
//  UIViewController+MRGPresentation.h
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 27.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MRGPresentation)

- (void)mrg_showAccessDeniedAlert;
- (void)mrg_showAlertWithTitle:(NSString *)title text:(NSString *)text;

@end
