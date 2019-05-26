- **2>&1** and **tee**
LightGBM/lightgbm config=lightgbm.conf data=../data/higgs.train valid=../data/higgs.test objective=binary metric=auc **2>&1 | tee** lightgbm_higgs_accuracy.log

> `2>&1` 的意思就是将标准错误重定向到标准输出<br>
> `tee` 把输出保存到文件中，又在屏幕上看到输出内容
[https://github.com/guolinke/boosting_tree_benchmarks/blob/master/lightgbm/test_accuracy.sh](https://github.com/guolinke/boosting_tree_benchmarks/blob/master/lightgbm/test_accuracy.sh)

- `$PWD` depend on where you run the program rather than where the program is;
    `mkdir` ... is relative to current working directory.
```bash
localhost:work$ bash main.sh
$PWD:
~/work
$PWD:
~/work/subdir
You are running sub.sh

$PWD:
~/work
You are running subdir/sub.sh
```
<br>

- `&&` and `||` operators cheatsheet
  - `A ; B` Run A and then B, regardless of success of A
  - `A && B` Run B if A succeeded
  - `A || B` Run B if A failed
  - `A &` Run A in background.

<br>

```
-d file 检查file是否存在并是一个目录
-e file 检查file是否存在
-f file 检查file是否存在并是一个文件
```
<br>

`-d`测试会检查指定的目录是否存在于系统中。如果你打算将文件写入目录或是准备切换到某
个目录中，先进行测试总是件好事情。
```bash
$ cat test11.sh
#!/bin/bash
# Look before you leap
#
jump_directory=/home/arthur
#
if [ -d $jump_directory ]
then
echo "The $jump_directory directory exists"
cd $jump_directory
ls
else
echo "The $jump_directory directory does not exist"
fi
#
```
<br>

- 向bash启动的python脚本传递参数
```bash
#! /bin/bash

python -c "import sys; print([sys.argv[i] for i in range(len(sys.argv))])" $@
echo "------------------------------"
python main.py $@
```
```python
# main.py
   import sys
   
   for arg in sys.argv:
       print(arg)
```
运行bash script的输出：
```
['-c', '1', '2', '3']
------------------------------
main.py
1
2
3

```
**NOTE:* 注意上述差异


- [shell中各种括号()、(())、[]、[[]]、{}的作用](https://www.cnblogs.com/nkwy2012/p/9171414.html)
  - 字符串比较用双中括号`[[ ]]`
  - 算数比较用单中括号`[ ]`——**左右留空格**
  - 算数运算用双小括号`(( ))`
  - shell命令及输出用小括号`( )`——**左右不留空格**
  - 快速替换用花括号`{ }`——**左右留空格**
  - 反单引号起着命令替换的作用\` \`
<br>

- [shell 中　exit0 exit1 的区别](https://blog.csdn.net/super_gnu/article/details/77099395)
  - exit（0）：正常运行程序并退出程序；
  - exit（1）：非正常运行导致退出程序；

`exit 0`可以告知你的程序的使用者：你的程序是正常结束的。如果`exit`非`0`值，那么你的程序的使用者通常会认为你的程序产生了一个错误。
在 shell 中调用完你的程序之后，用`echo $?`命令就可以看到你的程序的`exit`值。在shell脚本中，通常会根据上一个命令的`$?`值来进行一些流程控制。

#### credits:
- [kaggle_carvana_segmentation](kaggle_carvana_segmentation/README.md)
