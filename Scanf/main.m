//
//  main.m
//  Scanf
//
//  Created by qingsong on 2018/6/5.
//  Copyright © 2018年 qingsong. All rights reserved.
//

#import <Foundation/Foundation.h>

float func(float x) {
    float y;
    y = x * ((x - 5.0) * x + 16.0) - 80.0;
    return (y);
}

float xPoint(float x1, float x2) {
    float y;
    y = (x1 * func(x2) - x2 * func(x1)) / (func(x2) - func(x1));
    return y;
}

float root(float x1, float x2) {
    int i;
    float x, y, y1;
    y1 = func(x1);
    do {
        x = xPoint(x1, x2);
        y = func(x);
        if (y * y1 > 0) {
            y1 = y;
            x1 = x;
        } else {
            x2 = x;
        }
    } while (fabs(y) >= 0.0001);
    return (x);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!\n");
        
        float num[10];
        printf("input 10 number:\n");
        for (int i = 0; i< 10; i++) {
            scanf("%f",&num[i]);
        }
        printf("\n");
        
        printf("\n");
    }
    return 0;
}

