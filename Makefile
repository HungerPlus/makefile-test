src := $(shell find *.c)
obj := $(patsubst %.c,%.o,$(src))
obj_1 := $(src:.c=.o) # 将c后缀替换成o后缀
#obj_1 := $(src:%.c=%.o) # 将c后缀替换成o后缀 与上面效果一样
#local:vrb=test local #局部变量使用 
sh_cmd != pwd #当前目录 将shell运行的结果赋值

#set可以查看系统的环境变量

#设置文件路径
VPATH = add

#define
define test_define
@echo test define
endef

App:$(obj)
	@gcc $^ -o $@

%.o:%.c
#@echo $@
#@echo $(@:%.o=%.c)
	@gcc -c $^ -o $@

clean:
	-rm -rf *.o App #-号 会忽略错误 继续执行下面的

show:
	@echo $(src)
	@echo $(obj)
	@echo $(sh_cmd)
#另一种输出方式
	$(info $(sh_cmd))
	$(test_define)
	@echo $(obj_1)

#提取子目录下的源文件
basenm = $(shell find add/*.c)
show_add:
	@echo $(shell basename $(basenm))
	