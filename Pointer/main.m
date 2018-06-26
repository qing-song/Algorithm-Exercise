//
//  main.m
//  Pointer
//
//  Created by qingsong on 2018/6/5.
//  Copyright © 2018年 qingsong. All rights reserved.
//

#import <Foundation/Foundation.h>

void copy_string(char *from, char *to) {
    while (*from != '\0') {
        *to++ = *from++;
    }
    to = '\0';
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        char *a = "I am a teacher.";
        char *b = "you are a student.";
        
        printf("\nString a = %s\nstring b = %s\n", a, b);
        copy_string(a, b);
        printf("\nString a = %s\nstring b = %s\n", a, b);

        printf("\n");
    }
    return 0;
}
