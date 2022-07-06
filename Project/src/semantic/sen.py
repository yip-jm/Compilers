import re
#         P  I  V  II R  C  B  E  ,  ;  :  +  -  *  /  (  )  # 
table = [[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0, 0],
         [0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
         [0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
         [0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0],
         [0, 0, 0, 7, 8, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 0, 0,10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
         [0,11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 0, 0, 0,13, 0,12, 0, 0, 0, 0, 0, 0, 0, 0, 0],
         [0,14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
         [0,15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,16,17, 0, 0, 0,18, 0, 0],
         [0,19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,19, 0, 0, 0],
         [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,22,22,20,21, 0, 0, 0, 0],
         [0,23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,25, 0, 0, 0],
         [30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30]]

# print(len(table[0]))

row = { 'S' : 0 , 'A': 1 , 'B' : 2 , 'D': 3, 'D1' : 4 , 'E' : 5,
        'C' : 6 , 'F': 7 , 'F1': 8 , 'G': 9, 'H'  : 10, 'H1': 11,
        'I' : 12, 'I1': 13, 'J' : 14, 'push' :15 }

col = { 'program': 0 , 'id' : 1 , 'var' : 2 , 'integer' : 3, 'real' : 4 ,
        'char' : 5 , 'begin' : 6 ,  'end' : 7 , ',': 8, ';' : 9 , 
        ':' : 10 , '+' : 11 , '-' : 12 , '*' : 13 , '/' : 14 , '(' : 15 , 
        ')' : 16 ,  '#' : 17 , ":=" : 18 }

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
        i = i[5:]
        # print(i)
        exp.append(i)
        if i == '#':
            exps.append(exp)
            exp = []



get_tokens("tokens.txt")

for line in exps:
    print(line)

    syn = Stack()
    syn.push('S')
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
        if col.get(mark) != None:
            mark = token
        else:
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
        # elif syn.peek() == 'geq_p':
        #     syn.pop()
        #     s1 = sem.peek()
        #     sem.pop()
        #     j = j+1
        #     s4 = 'program' + s1 + ', _ , _'
        #     qt.push(s4)
        #     continue

        
        if row.get(syn.peek()) == None:
            print("INCORRECR EXPRESSION!!")
            break

        oper = table[row[syn.peek()]][col[mark]]

        if oper == 1:
            status.push(1)
            syn.pop()
            syn.push('A')
            # syn.push('gep_p')
            syn.push('J')
            syn.push('program')
        
        elif oper == 2:
            status.push(2)
            syn.pop()
            syn.push('C')
            syn.push('B')

        elif oper == 3:
            status.push(3)
            syn.pop()
            syn.push(';')
            syn.push('E')
            syn.push(':')
            syn.push('D')
            syn.push('var')
        
        elif oper == 4:
            status.push(4)
            syn.pop()
            syn.push('D1')
            syn.push('J')

        elif oper == 5:
            status.push(5)
            syn.pop()
            syn.push('D')
            syn.push(',')
        
        elif oper == 6:
            status.push(6)
            syn.pop()
        
        elif oper == 7:
            status.push(7)
            syn.pop()
            syn.push('integer')

        elif oper == 8:
            status.push(8)
            syn.pop()
            syn.push('real')

        elif oper == 9:
            status.push(9)
            syn.pop()
            syn.push('char')


        elif oper == 10:
            status.push(10)
            syn.pop()
            syn.push('end')
            syn.push('F')
            syn.push('begin')
        
        elif oper == 11:
            status.push(11)
            syn.pop()
            syn.push('F1')
            syn.push('G')
        
        elif oper == (12):
            status.push(12)
            syn.pop()
            syn.push('G')
            syn.push(';')

        elif oper == 13:
            status.push(13)
            syn.pop()
        
        elif oper == 14:
            status.push(14)
            syn.pop()
            syn.push('H')
            syn.push(':=')
            syn.push('J')
        
        elif oper == 15:
            status.push(15)
            syn.pop()
            syn.push('H1')
            syn.push('I')

        elif oper == 16:
            status.push(16)
            syn.pop()
            syn.push('H1')
            syn.push('geq+')
            syn.push('I')
            syn.push('+')

        elif oper == 17:
            status.push(17)
            syn.pop()
            syn.push('H1')
            syn.push('geq-')
            syn.push('I')
            syn.push('-')

        elif oper == 18:
            status.push(18)
            syn.pop()

        elif oper == 19:
            status.push(19)
            syn.pop()
            syn.push('I1')
            syn.push('J')

        elif oper == 20:
            status.push(20)
            syn.pop()
            syn.push('I1')
            syn.push('geq*')
            syn.push('J')
            syn.push('*')

        elif oper == 21:
            status.push(21)
            syn.pop()
            syn.push('I1')
            syn.push('geq/')
            syn.push('J')
            syn.push('/')

        elif oper == 22:
            status.push(22)
            syn.pop()

        elif oper == 23:
            status.push(23)
            syn.pop()
            syn.push('push')
            syn.push(token)

        elif oper == 25:
            status.push(25)
            syn.pop()
            syn.push(')')
            syn.push('H')
            syn.push('(')

        elif oper == 30:
            syn.pop()
            sem.push(line[i-1])
        elif oper == 0:
            print("ERROR!")
            break
    if syn.size() == 0:
        print("CORRECT EXPRESSION!!")
    print("The result is: " , qt.all())
    print('')
    
