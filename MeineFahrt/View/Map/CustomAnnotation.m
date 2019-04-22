//
//  CustomAnnotation.m
//  MeineFahrt
//
//  Created by Oliver M Batista on 22/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

#import "CustomAnnotation.h"
#import "MeineFahrt-Swift.h"


@implementation CustomAnnotation

- (id)initWithPoi:(Poi *)poi {
  self = [super init];
  
  if(self) {
    _poi = poi;
    _coordinate = CLLocationCoordinate2DMake(poi.coordinate.latitude,
                                             poi.coordinate.longitude);
  }
  
  return self;
}

- (MKAnnotationView *)annotationView {
  MKAnnotationView *annotation = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"customAnnotation"];
  
  annotation.enabled = YES;
  annotation.canShowCallout = NO;
  if([[_poi fleetType] isEqualToString:@"TAXI"]) {
    annotation.image = [UIImage imageNamed:@"taxi_small"];
  }else{
    annotation.image = [UIImage imageNamed:@"pooling_small"];
  }
  
  return annotation;
}

@end
