//
//  LPProduct.h
//  iOS_KVO
//
//  Created by 李小龙 on 2019/6/5.
//  Copyright © 2019 李小龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LPFactory.h"
NS_ASSUME_NONNULL_BEGIN

@interface LPProduct : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, strong) LPFactory *factory;
@end

NS_ASSUME_NONNULL_END
