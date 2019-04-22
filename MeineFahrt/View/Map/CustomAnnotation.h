//
//  CustomAnnotation.h
//  MeineFahrt
//
//  Created by Oliver M Batista on 22/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class Poi;

NS_ASSUME_NONNULL_BEGIN

@interface CustomAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) Poi *poi;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithPoi:(Poi *)poi;
- (MKAnnotationView *)annotationView;

@end

NS_ASSUME_NONNULL_END
