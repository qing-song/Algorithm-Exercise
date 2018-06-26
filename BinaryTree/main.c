//
//  main.c
//  BinaryTree
//
//  Created by qingsong on 2018/6/7.
//  Copyright © 2018年 qingsong. All rights reserved.
//

#include <stdio.h>
#include "bstree.h"

static int arr[] = {1, 5, 4, 3, 2, 6};
#define TBL_SIZE(a) (sizeof(a) / sizeof(a[0]))

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    
    int i, ilen;
    BSTree root = NULL;
    printf("== 依次添加：");
    ilen = TBL_SIZE(arr);
    
    for (i = 0; i < ilen; i++) {
        printf("%d ", arr[i]);
        root = insert_bstree(root, arr[i]);
    }
    
    printf("\n==前序遍历：");
    preorder_bstree(root);
    
    printf("\n==中序遍历：");
    inorder_bstree(root);
    
    printf("\n==后序遍历：");
    postorder_bstree(root);
    
    printf("\n");
    print_bstree(root, root->key, 0);
    
    
    printf("\n");
    return 0;
}
