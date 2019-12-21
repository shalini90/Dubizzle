//
//  ClasiifiedsDetailViewController.m
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 21/12/19.
//  Copyright © Shalini Padmanabhan. All rights reserved.
//

#import "ClasiifiedsDetailViewController.h"
#import "ImagesListCollectionViewCell.h"
#import "Dubizzle_Classifieds-Swift.h"

@interface ClasiifiedsDetailViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;

@end

@implementation ClasiifiedsDetailViewController {
}

NSString *cellIdentifier = @"DetailImagesCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINib *nib = [UINib nibWithNibName: NSStringFromClass([ImagesListCollectionViewCell class]) bundle:nil];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:cellIdentifier];
    
    _nameLabel.text = _viewModel.detail.name;
    _priceLabel.text = _viewModel.detail.price;
    _createdAtLabel.text = _viewModel.detail.createdAt;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImagesListCollectionViewCell *cell = (ImagesListCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setImageUrl:_viewModel.detail.imageUrls[indexPath.row]];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _viewModel.detail.imageUrls.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
}

@end
