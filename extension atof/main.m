//
//  main.m
//  extension atof
//
//  Created by qingsong on 2018/6/4.
//  Copyright © 2018年 qingsong. All rights reserved.
//

#import <Foundation/Foundation.h>

int my_atof(char *string, double *pnumber) {
    
    double  retval;
    double  one_tenth = 0.1;
    double  ten = 10.0;
    double  zero = 0.0;
    int     found_digits = 0;
    int     is_negative = 0;
    char    *num;
    
    if (pnumber == 0) {
        return 0;
    }
    if (string == 0) {
        return 0;
    }
    
    retval = zero;
    num = string;
    
    while (isspace(*num)) {
        num++;
        if (*num == '+') {
            num++;
        } else if (*num == '-') {
            is_negative = 1;
            num++;
        }
        
        while (isdigit(*num)) {
            found_digits = 1;
            retval *= ten;
            retval += *num - '0';
            num++;
        }
        
        if (*num == '.') {
            double scale = one_tenth;
            num++;
            while (isdigit(*num)) {
                found_digits = 1;
                retval += scale * (*num - '0');
                num++;
                scale *= one_tenth;
            }
        }
        
        if (!found_digits) {
            *pnumber = zero;
            return 0;
        }
        
        if (retval == zero) {
            *pnumber = zero;
            return 1;
        }
        
        if ((*num =='e') || (*num == 'E')) {
            
            int     neg_exponent = 0;
            int     get_out = 0;
            long    index;
            long    exponent = 0;
            double getting_too_big = DBL_MAX * one_tenth;
            double getting_too_small = DBL_MIN * ten;
            
            num++;
            if (*num == '+') {
                num++;
            } else if (*num == '-') {
                num++;
                neg_exponent = 1;
            }
            
            if (!isdigit(*num)) {
                if (is_negative) {
                    retval = -retval;
                }
                
                *pnumber = retval;
                
                return (1);
            }
            
            while (isdigit(*num) && (exponent < LONG_MAX / 10)) {
                exponent *= 10;
                exponent += *num - '0';
                num++;
            }
            
            if (neg_exponent) {
                for (index = 1; index <= exponent && !get_out; index++) {
                    if (retval < getting_too_small) {
                        get_out = 1;
                        retval = DBL_MIN;
                    } else {
                        retval *= one_tenth;
                    }
                }
            } else {
                for (index = 1; index <= exponent && !get_out; index++) {
                    if (retval > getting_too_big) {
                        get_out = 1;
                        retval = DBL_MAX;
                        
                    } else {
                        retval *= ten;
                    }
                }
            }
        }
    }
    
        if (is_negative) {
            retval = -retval;
        }
        
        *pnumber = retval;
        
        return (1);
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        char a, b, c, d;
        a = 'B'; b = 'O'; c = 'Y';
        int i;
        putchar(a);
        putchar(b);
        putchar(c);
        putchar('\n');
        d = getchar();
        putchar(d);
        printf("d = %E", 110.0);
        putchar('\n');
    }
    return 0;
}
