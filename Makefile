src := $(shell find *.c)
src1 := $(wildcard *.c)	$(wildcard add/*.c)#查找所有c文件
obj := $(patsubst %.c,%.o,$(src))
obj_1 := $(src:.c=.o) # 将c后缀替换成o后缀
#obj_1 := $(src:%.c=%.o) # 将c后缀替换成o后缀 与上面效果一样
#local:vrb=test local #局部变量使用 
#$(realpath *.c) 返回绝对路径
#$(abspath *.c) 返回绝对路径
#strip 去除头尾空格
#CXXFLAGS += -Iadd 追加头文件路径
#make -C dir 进入dir目录执行make命令
sh_cmd != pwd #当前目录 将shell运行的结果赋值

#set可以查看系统的环境变量

#设置文件搜索路径
VPATH = add
vpath %.c add

#条件判断
test_def = 100
ifdef test_def
#@echo test_def
$(info test_def)
else
$(info no test_def)
endif

#define
define test_define
@echo test define
endef

App:$(obj)
	@gcc $^ -o $@

#如果下面不写命令 则表示阻止此隐晦规则
%.o:%.c
#@echo $@
#@echo $(@:%.o=%.c)
#@gcc -c $^ -o $@
	@gcc -c $<

clean:
#-号 会忽略错误 继续执行下面的
#-rm -rf *.o App 
	-$(RM) *.o App 


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
# @echo $(shell basename $(basenm))
# @echo $(notdir $(basenm))
# @echo $(src1)
# @echo $(notdir $(src1))
	@echo $(CC)
	@echo $(CXX)
	@echo $(MAKE)