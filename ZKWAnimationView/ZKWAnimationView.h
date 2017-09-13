//
//  ZKWAnimationView.h
//  SaleHouse
//
//  Created by 占凯文 on 2017/9/13.
//  Copyright © 2017年 tefang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKWAnimationView : UIView

typedef NS_ENUM(NSInteger, AnimationStartType) {
    AnimationStartLeftTopType = 0,         // left top
    AnimationStartLeftbottomType = 1,     // left bottom
    AnimationStartRightTopType = 2,// right top
    AnimationStartRIghtBottomType = 3, //  right bottom
};


//图片宽度
@property (nonatomic,assign)float centerImageWidth;
//中心图片
@property (nonatomic,copy)NSString * centerImage;
//图片数组
@property (nonatomic,copy)NSArray * imageArr;
//是否是整圆 1 为 半个圆  2 为整个圆
@property (nonatomic,assign)float circular;
//半径
@property (nonatomic,assign)float radius;
//移动位置
@property (nonatomic,assign)AnimationStartType startType;

@end

@protocol ZKWAnimationViewDelegate <NSObject>

- (void)zkwAnimationViewDidSelect:(ZKWAnimationView *)view withIndex:(NSInteger)index;


@end

@interface ZKWAnimationView ()

@property (nonatomic,assign)id<ZKWAnimationViewDelegate>delegate;
@end
