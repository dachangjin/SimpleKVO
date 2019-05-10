//
//  ViewController.m
//  SimpleKVO
//
//  Created by wangwei on 2019/5/10.
//  Copyright © 2019 WW. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+KVO.h"

@interface Person : NSObject
@property(nonatomic ,copy)NSString * name;
@property(nonatomic ,assign)int age;
@end

@implementation Person

- (void)dealloc
{
    NSLog(@"person die");
}
@end

@interface Dog : NSObject
@property(nonatomic ,assign)float weight;
@property(nonatomic ,assign)int age;
@end

@implementation Dog
- (void)dealloc
{
    NSLog(@"Dog die");
}
@end

@interface ViewController ()
@property(nonatomic ,strong)Person *p;
@property(nonatomic ,strong)Dog *dog;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.p = [[Person alloc] init];
    self.p.name = @"abc";
    self.p.age = 20;
    self.dog = [[Dog alloc] init];
    self.dog.age = 2;
    self.dog.weight = 10;
    [self addObservedObject:self.p forKeyPath:@"name" block:^(id  _Nonnull oldValue, id  _Nonnull newValue) {
        NSLog(@"person的name~oldValue:%@ newValue:%@",oldValue,newValue);
    }];
    [self addObservedObject:self.p forKeyPath:@"age" block:^(id  _Nonnull oldValue, id  _Nonnull newValue) {
        NSLog(@"person的age~oldValue:%@ newValue:%@",oldValue,newValue);
    }];
    [self addObservedObject:self.dog forKeyPath:@"age" block:^(id  _Nonnull oldValue, id  _Nonnull newValue) {
        NSLog(@"dog的age~oldValue:%@ newValue:%@",oldValue,newValue);
    }];
    [self addObservedObject:self.dog forKeyPath:@"weight" block:^(id  _Nonnull oldValue, id  _Nonnull newValue) {
        NSLog(@"dog的weight~oldValue:%@ newValue:%@",oldValue,newValue);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.p.age = 21;
    self.p.name = @"cba";
    self.dog.age = 3;
    self.dog.weight = 11;
}
@end
