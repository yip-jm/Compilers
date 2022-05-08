
import re

AG = [
    [ '=' ,  5  , '=' , '=' ,  4  , '=' ,  6  ,  '=' ,  1  ,  2  ,  3 ],
    [  7  ,  8  , '=' , '=' , '=' , '=' , '=' , 'acc', '=' , '=' , '='],
    [ -4  , -4  ,  9  , 10  , '=' , -4  , '=' ,  -4  , '=' , '=' , '='],
    [ -7  , -7  , -7  , -7  , '=' , -7  , '=' ,  -7  , '=' , '=' ,  3 ],
    [ '=' ,  5  , '=' , '=' ,  4  , '=' ,  6  , '='  ,  11 ,  2  ,  3 ],
    [ '=' ,  5  , '=' , '=' ,  4  , '=' ,  6  , '='  , '=' , '=' , 17 ],
    [ -8  , -8  , -8  , -8  , '=' , -8  , '=' , -8   , '=' , '=' , '='],
    [ '=' ,  5  , '=' , '=' ,  4  , '=' ,  6  , '='  , '=' ,  12 ,  3 ],
    [ '=' ,  5  , '=' , '=' ,  4  , '=' ,  6  , '='  , '=' ,  13 ,  3 ],
    [ '=' ,  5  , '=' , '=' ,  4  , '=' ,  6  , '='  , '=' , '=' , 14 ],
    [ '=' ,  5  , '=' , '=' ,  4  , '=' ,  6  , '='  , '=' , '=' , 15 ], 
    [  7  ,  8  , '=' , '=' , '=' ,  16 , '=' , '='  , '=' , '=' , '='],
    [ -2  , -2  ,  9  , 10  , '=' , -2  , '=' , -2   , '=' , '=' , '='],
    [ -3  , -3  ,  9  , 10  , '=' , -3  , '=' , -3   , '=' , '=' , '='],
    [ -5  , -5  , -5  , -5  , '=' , -5  , '=' , -5   , '=' , '=' , '='],
    [ -6  , -6  , -6  , -6  , '=' , -6  , '=' , -6   , '=' , '=' , '='],
    [ -9  , -9  , -9  , -9  , '=' , -9  , '=' , -9   , '=' , '=' , '='],
    [ -10 , -10 , -10 , -10 , '=' , -10 , '=' , -10  , '=' , '=' , '='],
]


GRAMMAR = { -1 :'E' , -2 : 'E+T' , -3 : 'E-T' , -4 : 'T' , 
            -5 : 'T*F' , -6 : 'T/F', -7 : 'F' , -8 : 'i' ,
            -9 : '(E)' , -10 : '-F' }

index = {'+': 0 , '-': 1 , '*': 2 ,  '/': 3 ,
         '(': 4 , ')': 5 , 'id': 6 , '#': 7 ,
         'E': 8 , 'T': 9 , 'F': 10 ,
         -1 : 'E1', -1 : 'E', -2 : 'E', 
         -3 : 'E', -4 : 'E', -5 : 'T',
         -6 : 'T', -7 : 'T', -8 : 'F',
         -9 : 'F', -10 : 'F'} 
         

exps = []

class Stack:          # 定义一个栈
    def __init__(self):    # 初始化栈为空列表
        self.items = []
        
    def isEmpty(self):
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


def LR():
    for line in exps:
        status = Stack()
        sym = Stack()
        status.push(0)
        sym.push('#')
        i = 0
        print(line)
        print('%-30s%-50s%-20s%-10s'%('STATUS', 'SYMBOL', 'TOKEN', 'ACTION/GOTO'))
        while i < len(line):
            token = line[i]
            regular = r'\d+\.\d+|\d+|\w+(\w|\d)*'
            t = re.fullmatch(regular, token)
            if t != None:
                token = 'id'

            st = status.peek()
            next = AG[st][index[token]]

            print('%-30s%-50s%-20s%-10s'%(status.all(),sym.all(),token, next))
            #print(status.all(),'\t', sym.all(),'\t', token)
            
            

            if token == '+' and AG[st][index['+']] != '=':
                if next < 0:
                    # 归约
                    for j in range(len(GRAMMAR[next])):
                        sym.pop()
                        status.pop()
                    sym.push(index[next])
                    st = status.peek()
                    nextt = sym.peek()
                    status.push(AG[st][index[nextt]])
                    i = i - 1
                else:
                    # 移位
                    sym.push(token)
                    status.push(next)

            elif token == '-' and AG[st][index['-']] != '=':
                if next < 0:
                    for j in range(len(GRAMMAR[next])):
                        sym.pop()
                        status.pop()
                    sym.push(index[next])
                    st = status.peek()
                    nextt = sym.peek()
                    status.push(AG[st][index[nextt]])
                    i = i - 1
                else:
                    sym.push(token)
                    status.push(next)

            elif token == '*' and AG[st][index['*']] != '=':
                if next < 0:
                    for j in range(len(GRAMMAR[next])):
                        sym.pop()
                        status.pop()
                    sym.push(index[next])
                    st = status.peek()
                    nextt = sym.peek()
                    status.push(AG[st][index[nextt]])
                    i = i - 1
                else:
                    sym.push(token)
                    status.push(next)
            
            elif token == '/' and AG[st][index['/']] != '=':
                if next < 0:
                    for j in range(len(GRAMMAR[next])):
                        sym.pop()
                        status.pop()
                    sym.push(index[next])
                    st = status.peek()
                    nextt = sym.peek()
                    status.push(AG[st][index[nextt]])
                    i = i - 1
                else:
                    sym.push(token)
                    status.push(next)
            
            elif token == '(' and AG[st][index['(']] != '=':
                if next < 0:
                    for j in range(len(GRAMMAR[next])):
                        sym.pop()
                        status.pop()
                        
                    sym.push(index[next])
                    st = status.peek()
                    nextt = sym.peek()
                    status.push(AG[st][index[nextt]])
                    i = i - 1
                else:
                    sym.push(token)
                    status.push(next)
            
            elif token == ')' and AG[st][index[')']] != '=':
                if next < 0:
                    for j in range(len(GRAMMAR[next])):
                        sym.pop()
                        status.pop()
                    sym.push(index[next])
                    st = status.peek()
                    nextt = sym.peek()
                    status.push(AG[st][index[nextt]])
                    i = i - 1
                else:
                    sym.push(token)
                    status.push(next)    

            elif token == 'id' and AG[st][index['id']] != '=':
                    sym.push(token)
                    status.push(next)    

            elif token == '#' and AG[st][index['#']] != '=' :
                if next == 'acc':
                    print('-----This expression can be accept!-----')
                else:
                    for j in range(len(GRAMMAR[next])):
                        sym.pop()
                        status.pop()
                    sym.push(index[next])
                    st = status.peek()
                    nextt = sym.peek()
                    status.push(AG[st][index[nextt]])
                    i = i - 1                

            else:
                print('-----ERROR!!-----')
            i += 1    
                

get_tokens("tokens.txt")
# print(exps)
LR()



