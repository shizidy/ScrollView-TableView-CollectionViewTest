//
//  ContentTableViewCell.h
//  wangdongyaTest
//
//  Created by wdyzmx on 2023/9/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContentTableViewCell : UITableViewCell
/// <#Description#>
/// - Parameters:
///   - data: <#data description#>
///   - indexPath: <#indexPath description#>
- (void)fillcellWithData:(id)data indexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
