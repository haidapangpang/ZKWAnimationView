#import "ViewController.h"
#import "ZKWAnimationView.h"
@interface ViewController ()<ZKWAnimationViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZKWAnimationView * shareView = [[ZKWAnimationView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 400)];
    shareView.imageArr = @[@"",@"",@"",@"",@"",@"",@"",@""];
    shareView.radius = 150;
    shareView.centerImage = @"";
    shareView.centerImageWidth = 50;
    shareView.circular = 0.5;
    shareView.startType = AnimationStartRIghtBottomType;
    shareView.delegate = self;
    shareView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:shareView];
}
#pragma mark ZKWAnimationViewDelegate
- (void)zkwAnimationViewDidSelect:(ZKWAnimationView *)view withIndex:(NSInteger)index{
    
}
