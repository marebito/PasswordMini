//
//  PMMainViewController.m
//  PasswordMini
//
//  Created by zll on 2016/12/22.
//  Copyright © 2016年 Godlike Studio. All rights reserved.
//

#import "PMMainViewController.h"

#define kMainViewCollectionCellIdentifier @"kMainViewCollectionCellIdentifier"
#define kMainViewCollectionFooterIdentifier @"kMainViewCollectionFooterIdentifier"
#define kMainViewCollectionHeaderIdentifier @"kMainViewCollectionHeaderIdentifier"

@interface PMMainViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, strong) UICollectionView *mCollectionView;
@end

@implementation PMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"首页";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewLayout *layout = [[UICollectionViewLayout alloc] init];
    _mCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _mCollectionView.backgroundColor = [UIColor whiteColor];
    _mCollectionView.delegate = self;
    _mCollectionView.dataSource = self;
    [_mCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kMainViewCollectionCellIdentifier];
    [self.view addSubview:_mCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMainViewCollectionCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier;
    if ([kind isEqualToString: UICollectionElementKindSectionFooter ]){
        reuseIdentifier = kMainViewCollectionFooterIdentifier;
    }else{
        reuseIdentifier = kMainViewCollectionHeaderIdentifier;
    }
    
    UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
    
    UILabel *label = (UILabel *)[view viewWithTag:1];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        label.text = [NSString stringWithFormat:@"这是header:%ld",(long)indexPath.section];
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        view.backgroundColor = [UIColor lightGrayColor];
        label.text = [NSString stringWithFormat:@"这是footer:%ld",(long)indexPath.section];
    }
    return view;
}

//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 15, 5, 15);//分别为上、左、下、右
}
//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={320,45};
    return size;
}
//返回头footerView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGSize size={320,45};
    return size;
}
//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
//每个item之间的间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 100;
//}
//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor greenColor]];
}
//取消选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor redColor]];
}

@end
