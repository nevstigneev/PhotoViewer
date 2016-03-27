//
//  MRGPhotoPreviewViewController.m
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 27.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import "MRGPhotoPreviewViewController.h"
#import "MRGAppAssembly.h"
#import "MRGPresentationHelper.h"
#import <Photos/Photos.h>

@interface MRGPhotoPreviewViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation MRGPhotoPreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_setupNavigationBar];
    [self p_setupViews];
}

#pragma mark - Private

- (void)p_setupNavigationBar {
    UIBarButtonItem *barButton = [UIBarButtonItem new];
    barButton.title = @"";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
}

- (void)p_setupViews {
    PHImageManager *imageManager = self.assembly.imageManager;
    CGSize size = self.imageView.bounds.size;
    [imageManager requestImageForAsset:self.asset targetSize:mrg_sizeInPixels(size) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        self.imageView.image = result;
    }];
}

@end
