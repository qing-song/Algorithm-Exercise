//
//  main.m
//  SizeLength
//
//  Created by qingsong on 2018/6/6.
//  Copyright © 2018年 qingsong. All rights reserved.
//

#import <Foundation/Foundation.h>

union u {
    double a;
    int b;
}tesxtU;

union u2 {
    char a[13];
    int b;
}tesxtU2;

union u3 {
    char a[13];
    char b;
}tesxtU3;

struct myStruct {
    union u a;
    union u2 b;
    union u3 *c;
} testStruct;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        char s = 's';
        testStruct.a.a = 1.0;
        testStruct.b.b = '1';
//        testStruct.c->b = s;
        
        printf("double length = %lu\n", sizeof(double));

        printf("Int length = %lu\n", sizeof(int));

        printf("myStruct length = %lu\n", sizeof(testStruct.a));
        printf("myStruct length = %lu\n", sizeof(testStruct.b));
        printf("myStruct length = %lu\n", sizeof(testStruct.c));
        


    }
    return 0;
}
