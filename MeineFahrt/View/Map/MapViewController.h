//
//  MapViewController.h
//  MeineFahrt
//
//  Created by Oliver M Batista on 20/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class MapViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) MapViewModel *viewmodel;

- (instancetype)initWithViewModel:(MapViewModel *)viewmodel;

@end

NS_ASSUME_NONNULL_END
