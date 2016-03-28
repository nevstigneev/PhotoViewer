//
//  UIViewController+MRGPresentation.m
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 27.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import "UIViewController+MRGPresentation.h"

@implementation UIViewController (MRGPresentation)

- (void)mrg_showAccessDeniedAlertWithCompletion:(MRGEmptyCompletionHandler)completionHandler {
    [self mrg_showAlertWithTitle:@"Error" text:@"Unable to load albums. Please allow access to the photo library." completion:completionHandler];
}

- (void)mrg_showAlertWithTitle:(NSString *)title text:(NSString *)text completion:(MRGEmptyCompletionHandler)completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:text preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *exit = [UIAlertAction actionWithTitle:@"Exit" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }];
    [alertController addAction:exit];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
