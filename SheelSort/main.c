//
//  main.c
//  SheelSort
//
//  Created by qingsong on 2018/6/11.
//  Copyright © 2018年 qingsong. All rights reserved.
//

#include <stdio.h>

void sheelSort(int arr[], int n) {
    int i, j = 0, increment;
    int tmp;
    
    for (increment = n / 2; increment > 0; increment /= 2) {

        for (i = increment; i < n; i++) {
            tmp = arr[i];

            for (j = i; j >= increment; j -= increment) {
                
                if ( arr[j - increment] > tmp) {
                    arr[j] = arr[j - increment];
                } else {
                    break;
                }
            }
            arr[j] = tmp;
        }
    }
}

int main(int argc, const char * argv[]) {
    
    int arr[] = {81, 94, 11, 96, 12, 35, 17, 95, 28, 58, 41, 75, 15};
    int num = sizeof(arr) / sizeof(arr[0]);
    
    sheelSort(arr, num);
    
    for (int i = 0; i < num; i++) {
        printf("index : %d  %d\n",i, arr[i]);
    }
    
    
    printf("\n");
    
    return 0;
}
