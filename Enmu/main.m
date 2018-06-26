//
//  main.m
//  Enmu
//
//  Created by qingsong on 2018/6/6.
//  Copyright © 2018年 qingsong. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>
enum weekday {
    sun = 7,
    mon = 1,
    tue,
    wed,
    thu,
    fri,
    sat
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        FILE *fp;
        
        
        if ((fp = fopen("/Users/wangshuai/Desktop/C Study/C-Programming/Enmu/Test.text", "r")) == NULL) {
            printf("cannot open file \n");
        }
        fputs("This is testing for fputs...\n", fp);
    }
    return 0;
}
