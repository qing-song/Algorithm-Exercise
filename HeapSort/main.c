//
//  main.c
//  HeapSort
//
//  Created by qingsong on 2018/6/13.
//  Copyright © 2018 qingsong. All rights reserved.
//

#include <stdio.h>

#define LeftChild(i) (2 * (i) + 1)

void swap(int arr[],int a ,int b){
    int temp=arr[a];
    arr[a] = arr[b];
    arr[b] = temp;
}

// 调整大顶堆（仅是调整过程，建立在大顶堆已构建的基础上）
void percDown(int array[], int i, int length)
{
    int tmp = array[i];
    for (int k = i*2+1; k < length; k = k * 2 + 1) { // 从i结点的左子结点开始，也就是2i+1处开始
        
        if (k + 1 < length  && array[k] < array[k + 1]) { // //如果左子结点小于右子结点，k指向右子结点
            k++;
        }
        if (tmp < array[k]) {// 如果子节点大于父节点，将子节点值赋给父节点（不用进行交换）
            array[i] = array[k];
            i = k;
        } else {
            break;
        }
    }
    array[i] = tmp;// 将temp值放到最终的位置
}
void heapSort(int array[], int length)
{
    // 构建一个大订堆
    for (int i = length / 2 - 1; i >= 0; i--) {
        // 从第一个非叶子节点从下到上、从右到左调整结构
        percDown(array, i, length);
    }
    
    // 调整堆结构+交换堆顶元素与末尾元素
    for (int j = length - 1; j > 0; j--) {
        // 将堆顶元素与末尾元素进行交换
        swap(array, 0, j);
        percDown(array, 0, j); // 重新对堆进行调整
    }
}

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    int arr[] = {8, 9, 3, 4, 5, 2, 1, 7, 6};
    int num = sizeof(arr) / sizeof(arr[0]);
    
    heapSort(arr, num);
    
    for (int i = 0; i < num; i++) {
        printf("index : %d  %d\n",i, arr[i]);
    }
    
    
    
    return 0;
}
