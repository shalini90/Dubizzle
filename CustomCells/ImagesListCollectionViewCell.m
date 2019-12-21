//
//  ImagesListCollectionViewCell.m
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 21/12/19.
//  Copyright © Shalini Padmanabhan. All rights reserved.
//

#import "ImagesListCollectionViewCell.h"
#import "Dubizzle_Classifieds-Swift.h"

@interface ImagesListCollectionViewCell()
@property (weak, nonatomic) IBOutlet CachedImageView *imageview;
@end


@implementation ImagesListCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setImageUrl:(NSString *)imageUrl {
    [_imageview loadImageWithUrlString:imageUrl
                      placeholderImage: [UIImage imageNamed:@"PlaceHolder"]
                            completion:^(NSString * _Nonnull urlString, UIImage * _Nullable image) {
        if ([urlString isEqualToString:imageUrl]) {
            self.imageview.image = image;
        }
    }];
}

@end
