//
//  ContactManager.m
//  FollowMyDebt
//
//  Created by Loris on 18/03/2015.
//  Copyright (c) 2015 Loris Venturelli. All rights reserved.
//

#import "ContactManager.h"
#import <Realm/Realm.h>


@implementation ContactManager {
    NSMutableArray* _contacts;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _contacts = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (ContactManager*) sharedInstance {
    static ContactManager* instance = nil;
    
    if (instance == nil) {
        instance = [[ContactManager alloc] init];
    }
    
    return instance;
}

- (void) addContact:(Contact *)aContact {
    
    [_contacts insertObject:aContact atIndex:0];
  
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:aContact];
    /*[ContactManager createInRealm:realm withObject:@{@"firstname": aContact.firstname,
                                                     @"lastname": aContact.lastname,
                                                     @"phone": aContact.phone}];*/
    [realm commitWriteTransaction];
  
}

- (void) removeContact:(Contact *)aContact {
    [_contacts removeObject:aContact];
}

- (NSUInteger) count {
    return _contacts.count;
}

- (Contact*) contactAtIndex:(NSUInteger)index {
    return [_contacts objectAtIndex:index];
}

-(void)removeAllContact {
    [_contacts removeAllObjects];
}



@end
