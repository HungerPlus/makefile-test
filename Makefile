src := $(shell find *.c)
obj := $(patsubst %.c,%.o,$(src))

App:$(obj)
	gcc $^ -o $@

%.o:%.c
	gcc -c $^ -o $@

clean:
	rm -rf *.o App

show:
	@echo $(src)
	@echo $(obj)

	