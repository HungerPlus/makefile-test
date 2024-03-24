#include <stdio.h>
#include "add.h"
#include "sub.h"
          
int main(int argc, char const *argv[])
{
    printf("hello makefile\r\n");
    printf("你好 中国\r\n");
    printf("1+2=%d\r\n",Add(1,2));
    printf("3-2=%d\r\n",Sub(3,2));
    return 0;
}
