//
//  HeaderMenuCollectionViewCell.m
//  wangdongyaTest
//
//  Created by wdyzmx on 2023/9/20.
//

#import "HeaderMenuCollectionViewCell.h"

@interface HeaderMenuCollectionViewCell ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation HeaderMenuCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = UIColor.blackColor;
    [self.contentView addSubview:self.label];
}

- (void)fillcellWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    NSArray *array = (NSArray *)data;
    self.label.text = array[indexPath.item];
}

@end
