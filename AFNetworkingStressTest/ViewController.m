//
//  ViewController.m
//  AFNetworkingStressTest
//
//  Created by Erik Olsson on 2/23/12.
//  Copyright (c) 2012 Traduko. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)runStressTest:(id)sender {
  AFURLConnectionOperation *connection = nil;
  for(int i = 0; i < 100000; i++) {
    [connection cancel];
    connection = nil;
    NSString *url = [NSString stringWithFormat:@"https://graph.facebook.com/%i/picture", abs(arc4random())];
    connection = [[[AFURLConnectionOperation alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]] autorelease];
    [connection setCompletionBlock:^{
      NSLog(@"Request %i finished", i);
    }];
    [connection start];
  }
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
    return YES;
  }
}

@end
