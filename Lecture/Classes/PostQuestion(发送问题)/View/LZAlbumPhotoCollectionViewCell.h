//
//  MCAlbumPhotoCollectionViewCell.h
//  LZAlbum
//
//  Created by lzw on 15/3/27.
//  Copyright (c) 2015年 lzw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLCameraImageView.h"

@interface LZAlbumPhotoCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) NSIndexPath* indexPath;

@property (nonatomic,strong) ZLCameraImageView* photoImageView;

@end
