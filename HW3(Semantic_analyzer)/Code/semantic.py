from email.policy import default
import re
#         i, +, -, *, /, (, ), # 
table = [[1, 0, 0, 0, 0, 1, 0, 0],
         [0, 2, 3, 0, 0, 0, 4, 4],
         [5, 0, 0, 0, 0, 5, 0, 0],
         [0, 8, 8, 6, 7, 0, 8, 8],
         [9, 0, 0, 0, 0,10, 0, 0],
         [11,11,11,11,11,11,11,11]]


row = { 'E' : 0 , 'E1': 1 , 'T' : 2 , 'T1': 3, 'F' : 4 , 'push' : 5}
col = { 'id': 0 , '+' : 1 , '-' : 2 , '*' : 3, '/' : 4 ,
        '(' : 5 , ')' : 6 , '#' : 7 }


exps = []

class Stack:          # 定义一个栈
    def __init__(self):    # 初始化栈为空列表
        self.items = []
        
    def isempty(self):
        return self.items == []
    
    def push(self,item):
        self.items.append(item) 
        
    def pop(self):
        return self.items.pop()
    
    def peek(self):
        return self.items[len(self.items)-1]
    
    def size(self):
        return len(self.items)
    
    def all(self):
        return self.items

def get_tokens(filepath):
    file = open(filepath, 'r')
    line = file.readlines()
    exp = []
    for i in line:
        i = i.strip()
        exp.append(i)
        if i == '#':
            exps.append(exp)
            exp = []


get_tokens("tokens.txt")


for line in exps:
    print(line)

    syn = Stack()
    syn.push('E')
    status = Stack()
    status.push(0)
    sem = Stack()
    qt = Stack()
    i = 0

    print('%-80s%-10s%-20s%-20s'%('SYN', 'TOKEN', 'SEM', 'STATUS'))
    
    j = 0 

    while syn.size()!=0:


        token = line[i]
        print('%-80s%-10s%-20s%-20s'%(syn.all(), token, sem.all(), status.peek()))
        
        mark = token
        regular = r'\d+\.\d+|\d+|\w+(\w|\d)*'
        t = re.fullmatch(regular, token)
        if t != None:
            mark = 'id'

        if syn.peek() == token:
            syn.pop()
            i = i+1
            continue

        if syn.peek() == 'geq+':
            syn.pop()
            s1 = sem.peek()
            sem.pop()
            s2 = sem.peek()
            sem.pop()
            s3 = 't'+str(j)
            sem.push(s3)
            j = j+1
            s4 = '(' + '+' + ',' + s2 + ',' + s1 + ',' + s3 + ')'
            qt.push(s4)
            continue
        elif syn.peek() == 'geq-':
            syn.pop()
            s1 = sem.peek()
            sem.pop()
            s2 = sem.peek()
            sem.pop()
            s3 = 't'+str(j)
            sem.push(s3)
            j = j+1
            s4 = '(' + '-' + ',' + s2 + ',' + s1 + ',' + s3 + ')'
            qt.push(s4)
            continue
        elif syn.peek() == 'geq*':
            syn.pop()
            s1 = sem.peek()
            sem.pop()
            s2 = sem.peek()
            sem.pop()
            s3 = 't'+str(j)
            sem.push(s3)
            j = j+1
            s4 = '(' + '*' + ',' + s2 + ',' + s1 + ',' + s3 + ')'
            qt.push(s4)
            continue
        elif syn.peek() == 'geq/':
            syn.pop()
            s1 = sem.peek()
            sem.pop()
            s2 = sem.peek()
            sem.pop()
            s3 = 't'+str(j)
            sem.push(s3)
            j = j+1
            s4 = '(' + '/' + ',' + s2 + ',' + s1 + ',' + s3 + ')'
            qt.push(s4)
            continue
        
        if row.get(syn.peek()) == None:
            print("INCORRECR EXPRESSION!!")
            break

        oper = table[row[syn.peek()]][col[mark]]

        if oper == 1:
            status.push(1)
            syn.pop()
            syn.push('E1')
            syn.push('T')
        elif oper == 2:
            status.push(2)
            syn.pop()
            syn.push('E1')
            syn.push('geq+')
            syn.push('T')
            syn.push('+')
        elif oper == 3:
            status.push(3)
            syn.pop()
            syn.push('E1')
            syn.push('geq-')
            syn.push('T')
            syn.push('-')
        elif oper == 4:
            status.push(4)
            syn.pop()
        elif oper == 5:
            status.push(5)
            syn.pop()
            syn.push('T1')
            syn.push('F')
        elif oper == 6:
            status.push(6)
            syn.pop()
            syn.push('T1')
            syn.push('geq*')
            syn.push('F')
            syn.push('*')
        elif oper == 7:
            status.push(7)
            syn.pop()
            syn.push('T1')
            syn.push('geq/')
            syn.push('F')
            syn.push('/')
        elif oper == 8:
            status.push(8)
            syn.pop()
        elif oper == 9:
            status.push(9)
            syn.pop()
            syn.push('push')
            syn.push(token)
        elif oper == 10:
            status.push(10)
            syn.pop()
            syn.push(')')
            syn.push('E')
            syn.push('(')
        elif oper == 11:
            syn.pop()
            sem.push(line[i-1])
        elif oper == 0:
            print("ERROR!")
            break
    if syn.size() == 0:
        print("CORRECT EXPRESSION!!")
    print("The result is: " , qt.all())
    print('')
    
