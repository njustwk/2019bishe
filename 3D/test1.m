clear all
close all
%%  定义变量
ri=2;%目标轨道半径
vi=-2*pi;%（2）中的速度项
aa=0.1;%（7）中的参数项
kbb=sqrt(2*pi)/30;%(8)的参数项
miu=0.5;%(8)的参数项
number=6;%agent个数

dt=0.005;%步长
n=10;%时间

p_t=[0;0;0];%目标位置

% c=[1 0 0 1 0 0;
%    0 1 1 0 0 0;
%    0 1 1 1 1 0;
%    1 0 1 1 0 1;
%    0 0 1 0 1 0;
%    0 0 0 1 0 1];%agent邻接矩阵
c=ones(6);

    agent=cell(3,n/dt,6,8);%agent状态元胞
    agent{1,1,1}=[2;0;0];
    agent{1,2,1}=[sqrt(2);sqrt(2);0];
    agent{1,3,1}=[0;2;0];
    agent{1,4,1}=[-sqrt(2);sqrt(2);0];
    agent{1,5,1}=[-2;0;0];
    agent{1,6,1}=[0;-2;0];%%agent初始位置
    
    agent{1,1,6}=[0;0;1];
    agent{1,2,6}=[0;0;1];
    agent{1,3,6}=[0;0;1];
    agent{1,4,6}=[0;0;1];
    agent{1,5,6}=[0;0;1];
    agent{1,6,6}=[0;0;1];%%agent初始估计目标轨道法向量
    
    agent{1,1,5}=[0;0;0];
    agent{1,2,5}=[0;0;0];
    agent{1,3,5}=[0;0;0];
    agent{1,4,5}=[0;0;0];
    agent{1,5,5}=[0;0;0];
    agent{1,6,5}=[0;0;0];%%agent初始估计目标位置
    
v_i=zeros(n/dt,1);    
a=0;
b=0;
I=[1;0];
xx=[0;0;0]; 
yy=[0;0;0]; 

%%  算法部分
for t=1:1:n/dt
    %估计器
    t
    for i=1:1:number
    agent{t,i,2}=(p_t-agent{t,i,1})/mynorm1(p_t,agent{t,i,1});%向量1
    agent{t,i,3}=cross([0;0;1],agent{t,i,2});%/mynorm1(agent{t,num,6},agent{t,num,6});向量2的正负号相反了？？？
    agent{t,i,4}=cross(agent{t,i,2},agent{t,i,3});%向量3
    
  %  agent{t,i,7}=acos(dot(agent{t,i,2}',[1;0;0]));%求得方位角

     inc_p_t_est =(agent{t,i,3}'*(agent{t,i,1}-agent{t,i,5}))*agent{t,i,3}+(agent{t,i,4}'*(agent{t,i,1}-agent{t,i,5}))*agent{t,i,4};
     agent{t+1,i,5}=inc_p_t_est*dt+agent{t,i,5};
    end
%     
%     for i=1:1:number
%     %轨道协调
%     for j=1:1:number
%     a=a+c(i,j)*(agent{t,j,6}- agent{t,i,6});
%     end
%     agent{t+1,i,6}=aa*a*dt+agent{t,i,6}; 
%     end
%      
%     if t<2000
%         %轨道上速度协调 
%     for i=1:1:number    
%     for j=1:1:number
%      b=b+sign(agent{t,j,7}- agent{t,i,7})*(abs((agent{t,j,7}- agent{t,i,7})))^miu;
%     end
%     agent{t,i,8}=kbb*ri*b; 
%     end
%     
%     else

      %  等幅角环航的速度协调 

     for i=1:1:number
         A(i,:)=[pi pi pi pi pi pi];
        xx=(agent{t,i,1}-p_t);
       for j=1:1:number 
           if j ~=i 
               yy=(agent{t,j,1}-agent{t,i,1}); %xx，yy为两个方向向量
               zz=cross(xx,yy);
               ang1=sign(zz(3,1));
               ang2=1;
             
              if ang1==ang2   
               A(i,j)=acos(dot(xx',yy)/(norm(xx)*norm(yy)));%
              else
               A(i,j)=2*pi-acos(dot(xx',yy)/(norm(xx)*norm(yy)));  %     
              end            
           end
       end
        max_ang=max(A(i,:));
        min_ang=min(A(i,:));
        agent{t,i,8}=1/1.2*1.2*((2*min_ang-pi)-(3*pi-2*max_ang));
  %       agent{t,i,8}=1/1.2*1.2*((3*pi-2*max_ang)-(2*min_ang-pi));
     end
%       end



    %控制器
    for i=1:1:number 
    inc_p_a=(mynorm1(agent{t,i,1},agent{t+1,i,5})-ri)*agent{t,i,2}+(vi-agent{t,i,8})*agent{t,i,3}+(agent{t,i,2}'*[0;0;1])*agent{t,i,4};
    agent{t+1,i,1}=inc_p_a*dt+agent{t,i,1}; 
    end
 
end