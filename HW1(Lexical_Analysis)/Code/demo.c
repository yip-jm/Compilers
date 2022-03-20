#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CNT 1000

struct node{
   float num;
   char op;
};

struct node datas[CNT];  //后缀表达式栈
int data_top = -1;       //栈顶索引

char ops[CNT];          //操作符栈
int op_top = -1;        //栈顶索引

char nums[100];         //数字字符串
int num_top = -1;       //栈顶索引
//数字入栈
void push_num(){
    if(num_top > -1){
        datas[++data_top].num = atof(nums);
        datas[data_top].op = 0;
        num_top = -1;
        memset(nums, 0, sizeof(nums));  
    }
}
//中缀转后缀
void mtoe(const char* str){
    char *tmp;
    tmp = (char*)str;
    while(*tmp != '\0'){
        char ch = *tmp;
        ++tmp;
        if(ch == ' ') continue;

        if(ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '('){
            push_num();
            if(op_top > -1){
                char op = ops[op_top];
                if( (op == '*' || op == '/')&&(ch == '+' || ch == '-') ){// 乘/除优先于加/减
                    datas[++data_top].op = op;
                    --op_top;    
                }
            }
            ops[++op_top] = ch;
        }
        else if(ch == ')'){
            push_num();
            while(ops[op_top] != '('){
                datas[++data_top].op = ops[op_top];
                --op_top;
            }
            --op_top; 
        }
        else{  
            nums[++num_top] = ch;
        }
    }// end of while *tmp 
    push_num();//最后的数据入栈
    while(op_top > -1){//最后的操作符入栈
        datas[++data_top].op = ops[op_top];
        --op_top;   
    } 
    
}
//计算值
float calculating(){
    if(data_top < 0) return 0; 
    float stack[CNT] = {0};
    int top = -1;
    int i = 0;
    while(i <= data_top){
        char op = datas[i].op;
        if(op == 0){
            stack[++top] = datas[i].num;
        }else{
        float a = stack[top -1];
        float b = stack[top];
        --top;
        float c = 0;
        if(op == '+') c = a + b;
        else if(op == '-') c = a -b;
        else if(op == '*') c = a * b;
        else if(op == '/') c = a / b;
        stack[top] = c;
        }
        ++i;
    }
    if(top < 0) return 0;
    else return stack[top]; 
}

int main(int argc, char *argv[]){
    char *parms = "20.5+(100-(3+2)*8)/(8-5) - 10";
    memset(datas, 0, sizeof(datas));
    memset(ops, 0, sizeof(ops));
    data_top = -1;
    op_top = -1;
    num_top = -1;
    mtoe(parms);
    printf("%s = ",parms);
    printf("%f\n",calculating());
    int i = 0;
    for(i = 0; i <= data_top; i++){
        if(datas[i].op) printf("%c ", datas[i].op); 
        else printf("%f ",datas[i].num); 
    }
    printf("\n");
    return 0;
}
