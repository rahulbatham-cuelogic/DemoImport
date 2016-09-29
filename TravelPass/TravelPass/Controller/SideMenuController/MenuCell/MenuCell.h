//
//  MenuCell.h
//  TravelPass
//
//  Created by Harshit Dongre on 27/09/16.
//  Copyright © 2016 Harshit Cuelogic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCell : UITableViewCell
@property(nonnull,strong)IBOutlet UILabel *lblMenuTitles; /**< to show the menu's titles */
@property(nonnull,strong)IBOutlet UIImageView *imgMenuIcons; /**< to show the image icons for menu's titles */
@end
