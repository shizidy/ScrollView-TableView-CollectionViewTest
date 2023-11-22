//
//  HeaderMenuView.m
//  wangdongyaTest
//
//  Created by wdyzmx on 2023/9/20.
//

#import "HeaderMenuView.h"
#import "HeaderMenuCollectionViewCell.h"

@interface HeaderMenuView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewCell *collectionViewCell;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation HeaderMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame delegate:(nonnull id<HeaderMenuViewDelegate>)delegate {
    if (self = [super initWithFrame:frame]) {
        self.delegate = delegate;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) collectionViewLayout:flowLayout];
    [self addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
//    self.collectionView.showsHorizontalScrollIndicator = NO;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.sectionInset = UIEdgeInsetsZero;
    flowLayout.itemSize = CGSizeMake(CGRectGetWidth(self.frame) / 3, CGRectGetHeight(self.frame));
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    [self.collectionView registerClass:[HeaderMenuCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([HeaderMenuCollectionViewCell class])];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
}

- (void)toScrollHeaderMenuView:(UIScrollView *)scrollView {
    self.collectionView.contentOffset = scrollView.contentOffset;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HeaderMenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HeaderMenuCollectionViewCell class]) forIndexPath:indexPath];
    [cell fillcellWithData:self.dataArray indexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self.delegate respondsToSelector:@selector(headerMenuViewDidScroll:)]) {
        [self.delegate headerMenuViewDidScroll:scrollView];
    }
}

#pragma mark - 懒加载
- (NSArray *)dataArray {
if (!_dataArray) {
    _dataArray = @[
        @"涨跌",
        @"涨跌幅",
        @"涨跌",
        @"总市值",
        @"涨跌幅",
        @"涨跌",
        @"总市值",
        @"涨跌幅",
        @"涨跌"
    ];
}
return _dataArray;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
