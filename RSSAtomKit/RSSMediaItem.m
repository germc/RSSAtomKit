//
//  RSSMediaItem.m
//  Pods
//
//  Created by David Chiles on 1/20/15.
//
//

#import "RSSMediaItem.h"
#import "Ono.h"

@implementation RSSMediaItem

- (instancetype) initWithURL:(NSURL *)url
{
    if (self = [self init]) {
        _url = url;
    }
    return self;
}

- (instancetype) initWithFeedType:(RSSFeedType)feedType xmlElement:(ONOXMLElement*)xmlElement
{
    if (self = [self init]) {
        [self parseElement:xmlElement forType:feedType];
    }
    return self;
}

- (void)parseElement:(ONOXMLElement *)element forType:(RSSFeedType)feedType
{
    NSString *urlString = [element valueForAttribute:@"url"];
    if ([urlString length]) {
        _url = [NSURL URLWithString:urlString];
    } else {
        urlString = [element valueForAttribute:@"href"];
        _url = [NSURL URLWithString:urlString];
    }
    
    _type = [element valueForAttribute:@"type"];
    
    NSString *lengthString = [element valueForAttribute:@"length"];
    if ([lengthString length]) {
        _length = [[element.document.numberFormatter numberFromString:lengthString] unsignedIntegerValue];
    }
}

@end
