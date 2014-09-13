//
//  RATableViewDatasource.h
//  Recipe App
//
//  Created by Taylor Mott on 9.11.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RATableViewDatasource : NSObject <UITableViewDataSource>

- (NSString *)titleAtIndexPath:(NSIndexPath *)path;

@end
