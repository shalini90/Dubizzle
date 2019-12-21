//
//  ClasiifiedsDetailViewController.h
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 21/12/19.
//  Copyright © Shalini Padmanabhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassifiedsDetailViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClasiifiedsDetailViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) ClassifiedsDetailViewModel *viewModel;


@end

NS_ASSUME_NONNULL_END
