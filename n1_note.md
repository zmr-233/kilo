Hello
E的结构似乎是用来存放整个编辑器的基础信息，比如：
> numrows - 用来存放行数
> row[] 每一行是使用这个数组实现的存放，在editorRowsToString出现了如下的语句：
        totlen += E.row[j].size+1; /* +1 is for "\n" at end of every row */
> E.row[0]
	- chars 猜测是使用了双缓存的机制，chars保存实际的结果
	- render而该变量保存缓存区(屏幕上显示的)
	->尝试监视E.row[0].chars & render
->发现E.row[0].render[]是无法直接通过watch来监视的，这一点我非常疑惑
监测了E.row[0].rsize发现了如下结论：
main:
while(1)
->editorProcessKeypree

->editorDelChar:
	发现原来Process里面是分调用方式的，有删除，有增加的，每种字符操作后，直接函数内调用Update，目前暂不明确意图
	[607]->editorUpdateRow:[556]
	这个函数中发现了一个奇怪的现象：
	allocsize获取了计算的需要打印总字符数，但是在malloc中，却又重新计算了一遍，没有使用allocsize
		->editorUpdateSyntax:


editorRowsToString用来把整个编辑器的内容转换成一个字符串，同时返回给> editorSave
数，用来保存用的

>断点：
检测E.row.size，bt发现在editorDelChar断点，但是f 1后发现这个函数是editorInsertRow，没有搞清楚这两者的关系
pgrep kilo 用于检索PID
gdb -p PID 附着进程
	- file ./kilo 用于找不到源文件时使用
	- detach 用于分离进程，gdb退出但是程序继续运行

vim复制内容到剪贴板：
:'<,'>w !clip.exe 即可用于复制到win剪贴板

void *memmove(void *dest, const void *src, size_t n);
详情请看Gpt4-1_memmove

保存界面布局，详情请看qq
vim 分割界面：
:sp分割窗口

!! 发现了一个有意思的东西：在目录下生成了.swo文件，猜测可能是缓存文件
