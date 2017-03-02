//
//  MainCollectionViewCell.h
//  PosgradoApp
//
//  Created by Servicio Social on 13/12/16.
//  Copyright © 2016 Servicio Social. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic, readonly) NSDictionary *diccMenu;

- (void)actualizarDatos:(NSDictionary *)dicc;

@end
