//
//  XXPlayerPicView.m
//  Lecture
//
//  Created by 陈旭 on 16/1/20.
//  Copyright © 2016年 陈旭. All rights reserved.
//

#import "XXPlayerPicView.h"
#import "HMCollectionCell.h"

@interface XXPlayerPicView ()<UICollectionViewDataSource, UICollectionViewDelegate>
@end

@implementation XXPlayerPicView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    
        // collectionView
        [self setupCollectionView];
        
        // maskView
        [self setupMaskView];
    }
    return self;
}

- (void)setupCollectionView{
    
    // UICollectionViewFlowLayout
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
//    layout.itemSize = self.bounds.size;// 需要在后面设置才有用
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0; //上下的间距
    layout.sectionInset = UIEdgeInsetsZero;
    layout.footerReferenceSize = CGSizeZero;
    layout.headerReferenceSize = CGSizeZero;
    
    // 其他属性
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.pagingEnabled = YES; // 自动分页
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.bounces = NO;
    [self addSubview:collectionView];
    self.collectionView = collectionView;
    // 注册collectionView的cell
    [self.collectionView registerClass:[HMCollectionCell class] forCellWithReuseIdentifier:HMCollectionViewCellIdentifier];
    
}

- (void)setupMaskView{
    
    XXPlayerMaskView *maskView = [[XXPlayerMaskView alloc] init];
    [self addSubview:maskView];
    self.maskView = maskView;
    
    // 向maskView添加单击手势
    UITapGestureRecognizer *maskViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickMaskView:)];
    maskViewTap.numberOfTapsRequired = 1;
    [self.maskView addGestureRecognizer:maskViewTap];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.collectionView.frame = self.bounds;
    self.maskView.frame = self.bounds;
}

#pragma mark - UICollectionView DataSource
//设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView{
    
    return 1;
}

//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.musics.count;
}

//设置元素内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建可重用的cell
    HMCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HMCollectionViewCellIdentifier forIndexPath:indexPath];
    
    // 设置cell的数据
    cell.music = self.musics[indexPath.item];
    
    return cell;
}

#pragma mark - UICollectionView delegate

//设置每个 UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.collectionView.width, self.collectionView.height);
}

//点击元素触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(playerPicView:didClickCollectionView:)]) {
        [self.delegate playerPicView:self didClickCollectionView:collectionView];
    }
}

// collectionView滚动结束后
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if ([self.delegate respondsToSelector:@selector(playerPicView:collectionViewDidEndDecelerating:)]) {
        [self.delegate playerPicView:self collectionViewDidEndDecelerating:self.collectionView];
    }
}

#pragma mark - XXPlayerPicView delegate

- (void)clickMaskView:(XXPlayerMaskView *)maskView{
    if ([self.delegate respondsToSelector:@selector(playerPicView:didClickPlayerMaskView:)]) {
        [self.delegate playerPicView:self didClickPlayerMaskView:maskView];
    }
}

@end
