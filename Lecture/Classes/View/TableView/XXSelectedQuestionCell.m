//
//  XXSelectedQuestionCell.m
//  Lecture
//
//  Created by 陈旭 on 16/1/10.
//  Copyright © 2016年 陈旭. All rights reserved.
//

#import "XXSelectedQuestionCell.h"
@interface XXSelectedQuestionCell ()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
@implementation XXSelectedQuestionCell

//创建自定义可重用的cell对象
+ (instancetype)selectedQuestionCellInTableView:(UITableView *)tableView{
    static NSString *reuseId = @"selectedQuestionCell";
    XXSelectedQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"XXSelectedQuestionCell" owner:nil options:nil] lastObject];
        // 设置cell选中时不变色
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)cellAutoLayoutHeight{
    self.contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.contentLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.contentLabel.frame);
}

@end
