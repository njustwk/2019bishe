clear all
close all
%%  定义变量
ri=1.2;%目标轨道半径
vi=-2*pi/5;%（2）中的速度项
aa=1;%（7）中的参数项,轨道协调的参数，比论文的扩大了10倍
%kbb=sqrt(2*pi)/30;%(8)的参数项
%miu=0.5;%(8)的参数项
number=6;%agent个数

dt=0.005;%步长
n=10;%时间

p_t=[1;0;0];%目标位置

c=[1 0 0 1 0 0;
   0 1 1 0 0 0;
   0 1 1 1 1 0;
   1 0 1 1 0 1;
   0 0 1 0 1 0;
   0 0 0 1 0 1];%agent邻接矩阵


    agent=cell(3,n/dt,6,9);%agent状态元胞
    agent{1,1,1}=[-3;-3;0];
    agent{1,2,1}=[-1;-3;0];
    agent{1,3,1}=[1;-3;0];
    agent{1,4,1}=[3;3;0];
    agent{1,5,1}=[1;3;0];
    agent{1,6,1}=[-1;3;0];%%agent初始位置
    
    agent{1,1,6}=[0;0;1];
    agent{1,2,6}=[0;0;1];
    agent{1,3,6}=[0;0;1];
    agent{1,4,6}=[0;sqrt(3);1];
    agent{1,5,6}=[0;sqrt(3);1];
    agent{1,6,6}=[0;sqrt(3);1];%%agent初始估计目标轨道法向量
    
    agent{1,1,5}=[0.5;0;0];
    agent{1,2,5}=[1.5;0;0];
    agent{1,3,5}=[1;0;1];
    agent{1,4,5}=[-1;0;0];
    agent{1,5,5}=[1;-1;0];
    agent{1,6,5}=[1;0;-1];%%agent初始估计目标位置
   
    agent{1,1,9}=1;
    agent{1,2,9}=1;
    agent{1,3,9}=1;
    agent{1,4,9}=2;
    agent{1,5,9}=2;
    agent{1,6,9}=2;%%agent目标半径
v_i=zeros(n/dt,1);    
a=0;
b=0;
I=[1;0];
%%  算法部分
for t=1:1:n/dt
   t
    %估计器
    for i=1:1:number
    agent{t,i,2}=(p_t-agent{t,i,1})/mynorm1(p_t,agent{t,i,1});%向量1
    agent{t,i,3}=cross(agent{t,i,6},agent{t,i,2});%/mynorm1(agent{t,num,6},agent{t,num,6});向量2的正负号相反了？？？
    agent{t,i,4}=cross(agent{t,i,2},agent{t,i,3});%向量3
    
    agent{t,i,7}=acos(dot(agent{t,i,2}',[1;0;0]));%求得方位角

    inc_p_t_est =(agent{t,i,3}'*(agent{t,i,1}-agent{t,i,5}))*agent{t,i,3}+(agent{t,i,4}'*(agent{t,i,1}-agent{t,i,5}))*agent{t,i,4};
    agent{t+1,i,5}=inc_p_t_est*dt+agent{t,i,5};
    end
    
    for i=1:1:number
    %轨道协调
    for j=1:1:number
    a=a+c(i,j)*(agent{t,j,6}- agent{t,i,6});
    end
    agent{t+1,i,6}=aa*a*dt+agent{t,i,6};   
   % agent{t+1,i,6}=agent{t,i,6}; 
   
    %轨道上速度协调 
   % for j=1:1:number
   %  b=b+sign(agent{t,j,7}- agent{t,i,7})*(abs((agent{t,j,7}- agent{t,i,7})))^miu;
   % end
   % agent{t,i,8}=kbb*ri*b; 
    agent{t,i,8}=0;      
    end
    
    %控制器
    for i=1:1:number 
   inc_p_a=(mynorm1(agent{t,i,1},agent{t+1,i,5})- agent{1,i,9})*agent{t,i,2}+(vi-agent{t,i,8})*agent{t,i,3}+(agent{t,i,2}'*agent{t+1,i,6})*agent{t,i,4};
    agent{t+1,i,1}=inc_p_a*dt+agent{t,i,1}; 
    end
 
end
