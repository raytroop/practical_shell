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

- [shell中各种括号()、(())、[]、[[]]、{}的作用](https://www.cnblogs.com/nkwy2012/p/9171414.html)
> 技巧小结：
> 字符串比较用双中括号[[ ]]
> 算数比较用单中括号[ ]——左右留空格
> 算数运算用双小括号(( ))
> shell命令及输出用小括号( )——左右不留空格
> 快速替换用花括号{ }——左右留空格
> 反单引号起着命令替换的作用`

#### credits:
- [kaggle_carvana_segmentation](kaggle_carvana_segmentation/README.md)