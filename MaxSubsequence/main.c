//
//  main.c
//  MaxSubsequence
//
//  Created by qingsong on 2018/6/28.
//  Copyright © 2018 qingsong. All rights reserved.
//

#include <stdio.h>

int maxSubsequenceSum(const int A[], int N) {
    int maxSum, thisSum, i;
    maxSum = thisSum = 0;
    for (i = 0; i < N; i++) {
        thisSum += A[i];
        if (thisSum > maxSum) {
            maxSum = thisSum;
        } else if (thisSum < 0 ) {
            thisSum = 0;
        }
    }
    return maxSum;
}

int MaxNumber(int a, int b, int c)
{
    if (a > b && a > c) {
        return a;
    }
    if (a < b && b > c) {
        return b;
    }

    return c;
}

/**
 数据结构预算法：最大序列之和

 @param A 数据
 @param left 左边序列
 @param right 右边序列
 @return 最大值
 */
static int MaxSubSum(const int A[], int left, int right) {
    
    int maxLeftSum, maxRightSum;
    int maxLeftBorderSum, maxRightBorderSum;
    int leftBorderSum, rightBorderSum;
    int center, i;
    
    if (left == right) {
        if (A[left] > 0) {
            return A[left];
        } else {
            return 0;
        }
    }
    
    center = (left + right) / 2;
    maxLeftSum = MaxSubSum(A, left, center);
    maxRightSum = MaxSubSum(A, center + 1, right);
    
    maxLeftBorderSum = 0; leftBorderSum = 0;
    for (i = center; i >= left; i--) {
        leftBorderSum += A[i];
        if (leftBorderSum > maxLeftBorderSum) {
            maxLeftBorderSum = leftBorderSum;
        }
    }
    
    maxRightBorderSum = 0; rightBorderSum = 0;
    for (i = center; i >= left; i--) {
        rightBorderSum += A[i];
        if (leftBorderSum > maxRightBorderSum) {
            maxRightBorderSum = rightBorderSum;
        }
    }
    
    return MaxNumber(maxLeftSum, maxRightSum, maxLeftBorderSum + maxRightBorderSum);
}

int MaxSubsequenceSum(const int A[], int N)
{
    return MaxSubSum(A, 0, N - 1);
}



int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    int A[] = {4, -3, 5, -2, -1, 2, 6, 2};
    int num = sizeof(A) / sizeof(A[0]);
    
    int maxSum = maxSubsequenceSum(A, num);
    printf("max sum is %d\n", maxSum);
    
    return 0;
}
