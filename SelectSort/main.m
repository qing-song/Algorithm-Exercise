//
//  main.m
//  SelectSort
//
//  Created by qingsong on 2018/6/25.
//  Copyright © 2018 qingsong. All rights reserved.
//

#import <Foundation/Foundation.h>

void selectSort(int array[], int num) {
    
    int tmp;
    int max;
    for (int i = 0; i < num - 1; i++) {
        max = i;
        for (int j = i + 1; j < num; j++) {
            if (array[j] > array[i]) {
                max = j;
            }
        }
        if (max != i) {
            tmp = array[i];
            array[i] = array[max];
            array[max] = tmp;
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        int arr[] = {8, 9, 3, 4, 5, 2, 1, 7, 6};
        int num = sizeof(arr) / sizeof(arr[0]);
        
        selectSort(arr, num);
        
        for (int i = 0; i < num; i++) {
            printf("index : %d value:  %d\n",i, arr[i]);
        }
        
    }
    return 0;
}
