//
//  ClassifiedsDetailViewModel.h
//  Dubizzle
//
//  Created by Shalini Padmanabhan on 21/12/19.
//  Copyright © Shalini Padmanabhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ResultDetail;

@interface ClassifiedsDetailViewModel : NSObject

@property (nonatomic, strong) ResultDetail *detail;

@end

NS_ASSUME_NONNULL_END
