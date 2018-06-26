//
//  main.c
//  AVL-Tree
//
//  Created by qingsong on 2018/6/8.
//  Copyright © 2018年 qingsong. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

typedef int Type;

typedef struct AVLTreeNode {
    Type key;
    int height;
    struct AVLTreeNode *left;
    struct AVLTreeNode *right;
}Node, *AVLTree;


// 创建节点
static Node *avltree_create_node(Type key, Node *left, Node *right)
{
    Node *p;
    
    if ((p = (Node *)malloc(sizeof(Node))) == NULL) {
        return NULL;
    }
    p->key = key;
    p->height = 0;
    p->left = left;
    p->right = right;
    
    return p;
}

/*
 * 查找最大结点：返回tree为根结点的AVL树的最大结点。
 */
Node* avltree_maximum(AVLTree tree)
{
    if (tree == NULL) {
        return NULL;
    }
    while(tree->right != NULL)
    {
        tree = tree->right;
    }
    return tree;
}

#define MAX(a, b) ((a) > (b) ? (a) : (b))

#define HEIGHT(p) avltree_height(p)

int avltree_height(AVLTree tree) {
    
    return tree == NULL ? 0 : ((Node *)(tree))->height;
}


/**
 LL: 左左对应的情况（左单旋转）
 
 @return 返回旋转后的根节点
 */
static Node *left_left_rotation(AVLTree k2) {
    AVLTree k1;
    
    k1 = k2->left;
    k2->left = k1->right;
    k1->right = k2;
    
    k2->height = MAX(HEIGHT(k2->left), HEIGHT(k2->right)) + 1;
    k1->height = MAX(HEIGHT(k1->left), k2->height) + 1;
    
    return k1;
}
/**
 RR: 右右对应的情况（右单旋转）
 
 @return 返回旋转后的根节点
 */
static Node *right_right_rotation(AVLTree k1) {
    AVLTree k2;
    
    k2 = k1->right;
    k2->left = k1;
    k1->right = k2->left;
    
    k1->height = MAX(HEIGHT(k1->left), HEIGHT(k1->right)) + 1;
    k2->height = MAX(HEIGHT(k2->right), k1->height) + 1;
    
    return k2;
}


/**
 LR：左右对应的情况（左双旋转）
 
 @return 返回旋转后的根节点
 */
static Node *left_right_rotation(AVLTree k3) {
    
    k3->left = right_right_rotation(k3->left);
    
    return left_left_rotation(k3);
}

/**
 RL：右左对应的情况（右双旋转）
 
 @return 返回旋转后的根节点
 */
static Node *right_left_rotation(AVLTree k1) {
    
    k1->right = left_left_rotation(k1->right);
    
    return right_right_rotation(k1);
}

/*
 64  * (递归实现)查找"AVL树x"中键值为key的节点
 65  */
Node* avltree_search(AVLTree x, Type key)
{
    if (x==NULL || x->key==key)
        return x;
    
    if (key < x->key)
        return avltree_search(x->left, key);
    else
        return avltree_search(x->right, key);
}

Node *avlTree_insert(AVLTree tree, Type key) {
    if (tree == NULL) {
        tree = avltree_create_node(key, NULL, NULL);
        printf("ERROR: create avltree node failed!\n");
        return NULL;
    } else if (key < tree->key) {
        // 将key插入到tree的左子树
        tree->left = avlTree_insert(tree->left, key);
        if (HEIGHT(tree->left) - HEIGHT(tree->right) == 2) {
            if (key < tree->left->key) {
                tree = left_left_rotation(tree);
            } else {
                tree = left_right_rotation(tree);
            }
        }
    } else if (key > tree->key) {
        /// 将key插入到tree的右子树
        tree->right = avlTree_insert(tree->right, key);
        
        if (HEIGHT(tree->right) - HEIGHT(tree->left) == 2) {
            if (key > tree->right->key) {
                tree = right_right_rotation(tree);
            } else {
                tree = right_left_rotation(tree);
            }
        }
    } else {
        printf("添加失败：不允许添加相同的节点！\n");
    }
    
    return tree;
}

static Node *delete_node(AVLTree tree, Node *z) {
    if (tree == NULL || z == NULL) {
        return NULL;
    }
    if (z->key < tree->key) { // 删除的节点在tree的左子树中
        
        tree->left = delete_node(tree->left, z);
        
        if (HEIGHT(tree->right) - HEIGHT(tree->left) == 2) {
            
            Node *r = tree->right;
            if (HEIGHT(r->left) > HEIGHT(r->right)) {
                tree = right_left_rotation(tree);
            } else {
                tree = right_right_rotation(tree);
            }
        }
    } else if (z->key > tree->key) { // 删除的节点在tree的右子树中
        
        tree->right = delete_node(tree->right, z);
        
        if (HEIGHT(tree->left) - HEIGHT(tree->right) == 2) {
            
            Node *l =  tree->left;
            if (HEIGHT(l->right) > HEIGHT(l->left))
                tree = left_right_rotation(tree);
            else
                tree = left_left_rotation(tree);
        }
    } else {
        // tree 是对应的要删除的节点
        
        if ((tree->left) && (tree->right)) {
            
            // 如果tree的左子树比右子树高；
            // 则(01)找出tree的左子树中的最大节点
            //   (02)将该最大节点的值赋值给tree。
            //   (03)删除该最大节点。
            // 这类似于用"tree的左子树中最大节点"做"tree"的替身；
            // 采用这种方式的好处是：删除"tree的左子树中最大节点"之后，AVL树仍然是平衡的。
            if (HEIGHT(tree->left) > HEIGHT(tree->right)) {
                Node *max = avltree_maximum(tree);
                tree->key = max->key;
                tree->left = delete_node(tree->left, max);
                
            } else {
                
                // 如果tree的左子树不比右子树高(即它们相等，或右子树比左子树高1)
                // 则(01)找出tree的右子树中的最小节点
                //   (02)将该最小节点的值赋值给tree。
                //   (03)删除该最小节点。
                // 这类似于用"tree的右子树中最小节点"做"tree"的替身；
                // 采用这种方式的好处是：删除"tree的右子树中最小节点"之后，AVL树仍然是平衡的。
                Node *min = avltree_maximum(tree->right);
                tree->key = min->key;
                tree->right = delete_node(tree->right, min);
            }
        } else {
            
            Node *tmp = tree;
            tree = tree->left ?  tree->left : tree->right;
            free(tmp);
        }
    }
    return tree;
}

Node *avltree_delete(AVLTree tree, Type key)
{
    Node *z;
    if ((z = avltree_search(tree, key)) != NULL) {
        tree = delete_node(tree, z);
    }
    return tree;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    return 0;
}
