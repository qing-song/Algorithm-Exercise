//
//  main.m
//  C-Programming
//
//  Created by qingsong on 2018/6/1.
//  Copyright © 2018年 qingsong. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>

int main0(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!😆😆\r\n");
        
    }
    return 1;
}

/// 验证表达式 getchar() != EOF 的值是 0 还是 1。
int main1(void)
{
    printf("Press a key. ENTER would be nice:-)\n\n");
    printf("Press a key. ENTER would be nice:-) %d", EOF);
    printf("The expression getchar() != EOF evaluates to %d \n", getchar() != EOF);
    
    return 0;
}

/// 编写一个统计空格、制表符与换行符个数的程序。

int main2(void) {
    
    int blanks, tabs, newLines;
    int c;
    int done = 0;
    int lastChar = 0;
    
    blanks = 0;
    tabs = 0;
    newLines = 0;
    
    while (done == 0) {
        c = getchar();
        
        if (c == ' ') ++blanks;
        if (c == '\t') ++tabs;
        if (c == '\n') ++newLines;
        
        if (c == EOF) {
            if (lastChar != '\n') {
                ++newLines;
            }
            done = 1;
        }
        lastChar = c;
    }
    printf("Blanks: %d\n Tabs: %d Lines: %d\n", blanks, tabs, newLines);
    
    return 0;
    
}

/// 编写一个将输入复制到输出的程序，并将其中连续的多个空格用一个空格代替
int main3(void) {
    
    int c , inspace;
    inspace = 0;
    while ((c = getchar()) != EOF) {
        if (c == ' ') {
            if (inspace == 0) {
                inspace = 1;
                putchar(c);
            }
        }
        
        if (c != ' ') {
            inspace = 0;
            putchar(c);
        }
        printf("%d\r\n", c);
    }
    
    return 0;
}


#define IN 1
#define OUT 0

/// count lines, words, and characters in input
int main4() {
    
    int c, nl, nw, nc, state;
    state = OUT;
    nl = nw = nc = 0;
    while ((c = getchar()) != EOF) {
        ++nc;
        if (c == '\n')
        ++nl;
        if (c == ' ' || c == '\n' || c == '\t') {
            
            state = OUT;
            
        } else if (state == OUT) {
            
            state = IN;
            ++nw;
        }
    }
    printf("%d %d %d\n", nl, nw, nc);
    return 0;
}

/// 编写一个程序，以每行一个单词的形式打印其输入

int main5() {
    int c;
    int inspace;
    inspace = 0;
    while((c = getchar()) != EOF) {
        if(c == ' ' || c == '\t' || c == '\n') {
            if(inspace == 0) {
                inspace = 1;
                putchar('\n');
                printf("\n");
            }
            /* else, don't print anything */
        }
        else
        {
            inspace = 0;
            putchar(c);
            printf("%d", c);
        }
    }
    return 0;
}

// 编写一个程序，以统计各个数字、空白符(包括空格符、制表 符及换行符)以及所有其它字符出现的次数
int main6() {
    int nwhite = 0, nother = 0, c, i;
    int nDigit[10];
    for (i = 0; i < 10; i++) {
        nDigit[i] = 0;
    }
    while ((c = getchar()) != EOF) {
        
        if (c >= '0' && c <= '9') {
            ++nDigit[c - '0'];
        } else if (c == ' ' || c == '\t' || c == '\n') {
            ++nwhite;
        } else {
            ++nother;
        }
    }
    printf("nDigit is : \n");
    for (i = 0; i < 10; i++) {
        printf("%d", nDigit[i]);
    }
    printf("white space = %d, other = %d\n", nwhite, nother);
    
    return 0;
}

/// 编写一个程序，打印输入中单词长度的直方图。水平方向的直方图比较容易绘制，垂直方向的直方图则要困难些。
#define MAXWORDLEN 10
int main7() {
    int c;
    int inspace = 0;
    long lengtharr[MAXWORDLEN + 1]; int wordlen = 0;
    int firstletter = 1; long thisval = 0;
    long maxval = 0;
    int thisidx = 0;
    int done = 0;
    while(done == 0) {
        c = getchar();
        if(c == ' ' || c == '\t' || c == '\n' || c == EOF) {
            if(inspace == 0) {
                firstletter = 0; inspace = 1;
                if(wordlen <= MAXWORDLEN) {
                    if(wordlen > 0) {
                        thisval = ++lengtharr[wordlen - 1]; if(thisval > maxval)
                        {
                            maxval = thisval; }
                    } }
                else
                {
                    thisval = ++lengtharr[MAXWORDLEN]; if(thisval > maxval)
                    {
                        maxval = thisval;
                        
                    }
                    
                } }
            if(c == EOF) {
                done = 1;
                
            }
        }
        else
        {
            if(inspace == 1 || firstletter == 1) {
                wordlen = 0; firstletter = 0; inspace = 0;
            }
            ++wordlen; }
    }
    for(thisval = maxval; thisval > 0; thisval--) {
        printf("%4ld | ", thisval);
        for(thisidx = 0; thisidx <= MAXWORDLEN; thisidx++) {
            if(lengtharr[thisidx] >= thisval) {
                printf("* "); }
            else
            {
                printf(" ");
            } }
        printf("\n"); }
    printf(" +");
    for(thisidx = 0; thisidx <= MAXWORDLEN; thisidx++) {
        printf("---"); }
    printf("\n ");
    for(thisidx = 0; thisidx < MAXWORDLEN; thisidx++) {
        printf("%2d ", thisidx + 1);
        
    }
    printf(">%d\n", MAXWORDLEN);
    
    return 0;
}


#define MAXLINE 1000
int getLine(char line[], int maxline);
void copy(char to[], char from[]);

int main8() {
    int len;
    int max;
    char line[MAXLINE];
    char longest[MAXLINE];
    
    max = 0;
    while ((len = getLine(line, MAXLINE)) > 0) {
        if (len > max) {
            max = len;
            copy(longest, line);
        }
    }
    if (max > 0) {
        printf("%s", longest);
    }
    return 0;
    
}
int getLine(char s[], int lim) {
    int c, i;
    for (i = 0; i < lim-1 && (c=getchar()) != EOF && c != '\n'; ++i)
    {
        s[i] = c;
    }
    if (c == '\n') {
        s[i] = c;
        ++i;
    }
    s[i] = '\0';
    return i;
}
void copy(char to[], char from[]) {
    int i;
    i = 0;
    while ((to[i] = from[i]) != '\0') {
        ++i;
    }
}

int main() {
    
    return 0;
}

