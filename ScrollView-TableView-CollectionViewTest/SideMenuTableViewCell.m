//
//  SideMenuTableViewCell.m
//  wangdongyaTest
//
//  Created by wdyzmx on 2023/9/19.
//

#import "SideMenuTableViewCell.h"

@interface SideMenuTableViewCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation SideMenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.backgroundColor = UIColor.whiteColor;
    self.titleLabel.text = @"wdyzmx";
    self.titleLabel.textColor = UIColor.blackColor;
}

- (void)fillcellWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    NSArray *array = (NSArray *)data;
    NSString *title = array[indexPath.row];
    self.titleLabel.text = title;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
