//
//  TWViewController.m
//  ColllectionViewHeightBug
//
//  Created by Christian Menschel on 25.08.14.
//  Copyright (c) 2014 tapwork. All rights reserved.
//

#import "TWViewController.h"


static NSString *const kCollectionViewCellIdent = @"kCollectionViewCellIdent";

@interface TWViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation TWViewController
{
    UICollectionView *_collectionView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowlayout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[UICollectionViewCell class]
        forCellWithReuseIdentifier:kCollectionViewCellIdent];
    [self.view addSubview:_collectionView];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 20;
            break;
            
        default:
            break;
    }
    
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0.0f;
    switch (indexPath.section) {
        case 0:
#ifdef BUG_OFF
            height = 50.0f;
#endif
            break;
        case 1:
            height = 50.0f;
            break;
        default:
            break;
    }
    
#ifdef BUG_WORKAROUND
    if (height == 0.0f) {
        height = 0.1f;
    }
#endif
    
    return CGSizeMake(collectionView.bounds.size.width, height);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdent forIndexPath:indexPath];
    
    cell.layer.borderWidth = 1.0;
    cell.layer.borderColor = [UIColor blackColor].CGColor;
    
    switch (indexPath.section) {
        case 0:
            cell.backgroundColor = [UIColor yellowColor];
            break;
        case 1:
            cell.backgroundColor = [UIColor darkGrayColor];
            break;
            
        default:
            break;
    }
    
    return cell;
}

@end
