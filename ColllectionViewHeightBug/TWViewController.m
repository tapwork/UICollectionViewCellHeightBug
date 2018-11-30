//
//  TWViewController.m
//  ColllectionViewHeightBug
//
//  Created by Christian Menschel on 25.08.14.
//  Copyright (c) 2014 tapwork. All rights reserved.
//

#import "TWViewController.h"

@interface TWCollectionViewCell: UICollectionViewCell
@property (strong, nonatomic) UILabel *label;
@end
@implementation TWCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] init];
        [self.contentView addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.label.frame = self.contentView.bounds;
}

@end

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
    [_collectionView registerClass:[TWCollectionViewCell class]
        forCellWithReuseIdentifier:kCollectionViewCellIdent];
    [self.view addSubview:_collectionView];

#ifdef BUG_ON
    UILabel *label = [[UILabel alloc] init];
    label.text = @"ERROR / Bug: This should not be empty or white here.\nYou shoud see the rows for section 1. Scroll down to see SOME rows (starting with 9) of section 1.\nSection 0 has one row with height of 0.\n\n\n You can select the Scheme UseWorkaround to see how it should look like. The workaround makes a height of 0.1 for the 1st row in the 1st section";
    label.numberOfLines = 0;
    [label sizeToFit];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label.frame = self.view.bounds;
    [self.view addSubview:label];
#endif

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
    TWCollectionViewCell *cell = (TWCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIdent forIndexPath:indexPath];
    
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

    cell.label.text = [NSString stringWithFormat:@"section: %ld, row: %ld", (long)indexPath.section, indexPath.row];
    
    return cell;
}

@end
