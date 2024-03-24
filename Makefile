src := $(shell find *.c)
obj := $(patsubst %.c,%.o,$(src))
obj_1 := $(src:.c=.o) # 将c后缀替换成o后缀
sh_cmd != pwd #当前目录 将shell运行的结果赋值

#set可以查看系统的环境变量

#define
define test_define
@echo test define
endef

App:$(obj)
	gcc $^ -o $@

%.o:%.c
	gcc -c $^ -o $@

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
	