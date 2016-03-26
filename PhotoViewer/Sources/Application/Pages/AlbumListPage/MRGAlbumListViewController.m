//
//  MRGAlbumListViewController.m
//  PhotoViewer
//
//  Created by Nikolay Evstigneev on 26.03.16.
//  Copyright © 2016 Nikolay Evstigneev. All rights reserved.
//

#import "MRGAlbumListViewController.h"
#import "MRGAppAssembly.h"
#import "MRGAlbumFetcher.h"
#import "MRGAlbum.h"

@interface MRGAlbumListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray<MRGAlbum *> *albums;

@end

@implementation MRGAlbumListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    id<MRGAlbumFetcher> albumFetcher = self.assembly.albumFetcher;
    [albumFetcher fetchAlbumsWithCompletion:^(NSArray<MRGAlbum *> *albums) {
        NSLog(@"%ld", albums.count);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //
}

#pragma mark - UITableViewDelegate

@end
