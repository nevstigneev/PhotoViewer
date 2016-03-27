//
//  UIViewController+MRGPresentation.m
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 27.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import "UIViewController+MRGPresentation.h"

@implementation UIViewController (MRGPresentation)

- (void)mrg_showAccessDeniedAlert {
    [self mrg_showAlertWithTitle:@"Error" text:@"Unable to load albums. Please allow access to the photo library."];
}

- (void)mrg_showAlertWithTitle:(NSString *)title text:(NSString *)text {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:text preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
