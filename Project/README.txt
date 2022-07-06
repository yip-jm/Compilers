1. 文件结构
|----src----|----scanner----|----ana.l
|           | 		     |----demo.txt
|           |  	     |----...
|           |----parser----|----ArithExp.jj
|           |              |----demo.txt
|           |              |----...
|           |----semantic----|---sen.py
|           		      |---tokens.txt
|
|----result----|----scanner----|----tokens.txt
|              |               |----...
|              |----parser----|----parser_res.png
|              |----semantic----|---sem_res.png
|
|----19335253_葉珺明_实验报告
|----README.txt



2. 运行说明

 + ./src/scanner/ana.l :
 	$ flex -o ana.yy.c ana.l
 	$ gcc -o ana ana.yy.c
 	$ ./ana demo.txt tokens.txt kp_t.txt sym_t.txt const_t.txt
 	
 + ./src/parser/ArithExp :
	$ javacc ArithExp.jj
	$ javac *.java
	$ java IsAriExp < demo.txt

 + ./src/semantic/sen.py :
 	$ python sen.py
