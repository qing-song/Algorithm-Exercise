//
//  main.m
//  MergeSort
//
//  Created by qingsong on 2018/6/25.
//  Copyright © 2018 qingsong. All rights reserved.
//

#import <Foundation/Foundation.h>

void mergeSort1(int *A, int left, int mid, int right, int *temp) {
    
    int i = left;
    int j = mid + 1;
    int k = left;
    while (i <= mid && j <= right) {
        if (A[i] < A[j]) {
            temp[k++] = A[i++];
        } else {
            temp[k++] = A[j++];
        }
    }
    while (i <= mid) {
        temp[k++] = A[i++];
    }
    while (j <= right) {
        temp[k++] = A[j++];
    }
    
    memcpy(A + left, temp + left, sizeof(int)*(right - left + 1));
    
}

void merge1(int A[], int left, int right, int *temp) {
    int mid = 0;
    if (left < right) {
        mid = left + (right - left) / 2;
        merge1(A, left, mid, temp);
        merge1(A, mid + 1, right, temp);
        mergeSort1(A, left, mid, right, temp);
    }
}

void mergeAdd(int arr[], int left, int mid, int right, int *temp){
    int i = left;
    int j = mid + 1;
    int k = left;//临时下标
    while (i <= mid && j <= right) {
        if (arr[i] < arr[j]){
            temp[k++] = arr[i++];
        }
        else{
            temp[k++] = arr[j++];
        }
    }
    while (i <= mid){
        temp[k++] = arr[i++];
    }
    while (j <= right){
        temp[k++] = arr[j++];
    }
    //把temp中的内容拷给arr数组中
    //进行归并的时候，处理的区间是arr[left,right),对应的会把
    //这部分区间的数组填到tmp[left,right)区间上
    memcpy(arr + left, temp + left, sizeof(int)*(right - left+1));
}
void mergeSort(int arr[],int left,int right,int *temp){//实现“分”
    int mid = 0;
    if (left < right){
        mid = left + (right - left) / 2;
        mergeSort(arr, left, mid, temp);
        mergeSort(arr, mid + 1, right, temp);
        mergeAdd(arr, left, mid, right, temp);
    }
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        int arr[] = {8, 9, 3, 4, 5, 2, 1, 7, 6};
        int num = sizeof(arr) / sizeof(arr[0]);
        int *temp = (int *)malloc(sizeof(int)*num);
        merge1(arr, 0, num - 1, temp);
        
        for (int i = 0; i < num; i++) {
            printf("index : %d value:  %d\n",i, arr[i]);
        }
        
        free(temp);
        
    }
    return 0;
}
