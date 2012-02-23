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
    [connection release];
    
    connection = [[AFURLConnectionOperation alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.google.com/q=%i", arc4random()]]]];
    
    [connection setCompletionBlock:^{
      NSLog(@"Finishing %i", i);
    }];
    
    NSLog(@"Starting %i", i);
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
