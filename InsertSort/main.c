//
//  main.c
//  InsertSort
//
//  Created by qingsong on 2018/6/12.
//  Copyright © 2018年 qingsong. All rights reserved.
//

#include <stdio.h>

void insertSort(int array[], int num)
{
    
    int i, j;
    int tmp;
    for (i = 1; i < num; i++) {
        tmp = array[i];
        for (j = i; j > 0 && array[j - 1] > tmp; j--) {
            array[j] = array[j - 1];
        }
        array[j] = tmp;
    }
}

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    int arr[] = {8, 9, 3, 4, 5, 2, 1, 7, 6};
    int num = sizeof(arr) / sizeof(arr[0]);
    
    insertSort(arr, num);
    
    for (int i = 0; i < num; i++) {
        printf("index : %d value:  %d\n",i, arr[i]);
    }
    return 0;
}
