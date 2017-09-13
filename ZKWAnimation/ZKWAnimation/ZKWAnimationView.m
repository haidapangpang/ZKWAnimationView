//
//  ZKWAnimationView.m
//  SaleHouse
//
//  Created by 占凯文 on 2017/9/13.
//  Copyright © 2017年 tefang. All rights reserved.
//

#import "ZKWAnimationView.h"

#define BUTTON_TAG 171379
@implementation ZKWAnimationView{
    NSMutableArray * buttonArr;
    __weak UIButton * centerButton;
}


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor redColor];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.selected = NO;
        [self addSubview:button];
        centerButton = button;

        
    }
    return self;
}
- (void)setCenterImage:(NSString *)centerImage{
    _centerImage = centerImage;
    [centerButton setImage:[UIImage imageNamed:self.centerImage] forState:UIControlStateNormal];
}
- (void)setCenterImageWidth:(float)centerImageWidth{
    _centerImageWidth = centerImageWidth;
    centerButton.frame = CGRectMake(0, 0, self.centerImageWidth, self.centerImageWidth);
    centerButton.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    centerButton.layer.masksToBounds = YES;
    centerButton.layer.cornerRadius = self.centerImageWidth/2;
    if (self.imageArr.count != 0) {
        [self addSomeButton];
    }
}
- (void)setImageArr:(NSArray *)imageArr{
    _imageArr = imageArr;
    if (self.centerImageWidth != 0) {
        [self addSomeButton];
    }
}
- (void)addSomeButton{
    if (buttonArr.count == 0  ) {
        buttonArr = [@[] mutableCopy];
        for (int i = 0 ; i< _imageArr.count; i ++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor yellowColor];
            [button addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = BUTTON_TAG + i ;
            [button setImage:[UIImage imageNamed:_imageArr[i]] forState:UIControlStateNormal];
            [self addSubview:button];
            
            button.layer.masksToBounds = YES;
            button.layer.cornerRadius = self.centerImageWidth/2;
            button.frame = CGRectMake(0, 0, self.centerImageWidth, self.centerImageWidth);
            button.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
            
            [buttonArr addObject:button];
        }
    }
    [self bringSubviewToFront:centerButton];


}

- (void)buttonClick:(UIButton *)button{
    if (button.selected == NO) {
        button.selected = YES;
        [self startAnimation];
    }else{
        button.selected = NO;
        [self backAnimation];
    }
}
- (void)startAnimation{
    
    float x = centerButton.center.x;
    float y = centerButton.center.y;
    
    for (int i = 0 ; i < buttonArr.count; i ++) {

        UIButton * button = buttonArr[i];
        float  angle=180*self.circular/(buttonArr.count-1)*i;
        CGFloat x2 = 0.0 ;
        CGFloat y2 = 0.0 ;
        switch (self.startType ) {
            case AnimationStartLeftTopType:
                x2 = -self.radius*cosf(angle*M_PI/180)+x;
                y2 = -self.radius*sinf(angle*M_PI/180)+y;
                break;
            case AnimationStartLeftbottomType:
                x2 = -self.radius*cosf(angle*M_PI/180)+x;
                y2 = self.radius*sinf(angle*M_PI/180)+y;
                break;
            case AnimationStartRightTopType:
                x2 = self.radius*cosf(angle*M_PI/180)+x;
                y2 = -self.radius*sinf(angle*M_PI/180)+y;
                break;
            case AnimationStartRIghtBottomType:
                x2 = self.radius*cosf(angle*M_PI/180)+x;
                y2 = self.radius*sinf(angle*M_PI/180)+y;
                break;
            default:
                break;
        }
        [UIView animateWithDuration:1 animations:^{
            button.center=CGPointMake(x2, y2);
        }];
    }
 
}
- (void)backAnimation{
    for (int i = 0 ; i < buttonArr.count; i ++) {
        UIButton * button = buttonArr[i];
        [UIView animateWithDuration:1 animations:^{
            button.center=CGPointMake(centerButton.center.x, centerButton.center.y);
        }];
    }
}
- (void)shareClick:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(zkwAnimationViewDidSelect:withIndex:)]) {
        [self.delegate zkwAnimationViewDidSelect:self withIndex:button.tag - BUTTON_TAG];
    }
}
@end
