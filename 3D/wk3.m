
clear all
close all
%%  �������
ri=1.2;%Ŀ�����뾶
vi=-pi*2/5;%��2���е��ٶ���
aa=2;%��7���еĲ�����
% kbb=sqrt(2*pi)/30;%(8)�Ĳ�����
% miu=0.5;%(8)�Ĳ�����
number=6;%agent����

dt=0.005;%����
n=10;%ʱ��

p_t=[1;0;0];%Ŀ��λ��
% c=ones(6);
c=[1 0 0 1 0 0;
   0 1 1 0 0 0;
   0 1 1 1 1 0;
   1 0 1 1 0 1;
   0 0 1 0 1 0;
   0 0 0 1 0 1];%agent�ڽӾ���

    agent=cell(3,n/dt,6,8);%agent״̬Ԫ��
    agent{1,1,1}=[-3;-3;0];
    agent{1,2,1}=[-1;-3;0];
    agent{1,3,1}=[1;-3;0];
    agent{1,4,1}=[3;3;0];
    agent{1,5,1}=[1;3;0];
    agent{1,6,1}=[-1;3;0];%%agent��ʼλ��
    
    agent{1,1,6}=[0;0;1];
    agent{1,2,6}=[0;0;1];
    agent{1,3,6}=[0;0;1];
    agent{1,4,6}=[0;sqrt(3);1];
    agent{1,5,6}=[0;sqrt(3);1];
    agent{1,6,6}=[0;sqrt(3);1];%%agent��ʼ����Ŀ����������
    
    agent{1,1,5}=[0.5;0;0];
    agent{1,2,5}=[1.5;0;0];
    agent{1,3,5}=[1;0;1];
    agent{1,4,5}=[-1;0;0];
    agent{1,5,5}=[1;-1;0];
    agent{1,6,5}=[1;0;-1];%%agent��ʼ����Ŀ��λ��
  

v_i=zeros(n/dt,1);    
a=0;
b=0;
I=[1;0];
xx=[0;0;0]; 
yy=[0;0;0]; 
%%  �㷨����
for t=1:1:n/dt
    %������
    t
    for i=1:1:number
    agent{t,i,2}=(p_t-agent{t,i,1})/mynorm1(p_t,agent{t,i,1});%����1
    agent{t,i,3}=cross(agent{t,i,6},agent{t,i,2});%/mynorm1(agent{t,num,6},agent{t,num,6});����2���������෴�ˣ�����
    agent{t,i,4}=cross(agent{t,i,2},agent{t,i,3});%����3
    
    agent{t,i,7}=acos(dot(agent{t,i,2}',[1;0;0]));%��÷�λ��

     inc_p_t_est =(agent{t,i,3}'*(agent{t,i,1}-agent{t,i,5}))*agent{t,i,3}+(agent{t,i,4}'*(agent{t,i,1}-agent{t,i,5}))*agent{t,i,4};
     agent{t+1,i,5}=inc_p_t_est*dt+agent{t,i,5};
    end
    
    for i=1:1:number
    %���Э��
    for j=1:1:number
    a=a+c(i,j)*(agent{t,j,6}- agent{t,i,6});
    end
    agent{t+1,i,6}=aa*a*dt+agent{t,i,6}; 
    end
     
    if t<1000
        %������ٶ�Э�� 
    for i=1:1:number    
%     for j=1:1:number
%      b=b+sign(agent{t,j,7}- agent{t,i,7})*(abs((agent{t,j,7}- agent{t,i,7})))^miu;
%     end
%     agent{t,i,8}=kbb*ri*b; 
    agent{t,i,8}=0;
    end
    
    
    else

      %  �ȷ��ǻ������ٶ�Э�� 
     for i=1:1:number
         A(i,:)=[pi pi pi pi pi pi];% A�Ĵ洢��ʽ��������ô�ģ���Ҫ��
        xx=(agent{t,i,1}-p_t);
       for j=1:1:number 
           if j ~=i 
               yy=(agent{t,j,1}-agent{t,i,1}); %xx��yyΪ������������
               zz=cross(xx,yy);
               ang1=sign(zz(3,1));
               ang2=sign(agent{t,i,6}(3,1));
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
 %      agent{t,i,8}=1/1.2*1.2*((3*pi-2*max_ang)-(2*min_ang-pi));
     end
      end

    %������
    for i=1:1:number 
    inc_p_a=(mynorm1(agent{t,i,1},agent{t+1,i,5})-ri)*agent{t,i,2}+(vi-agent{t,i,8})*agent{t,i,3}+(agent{t,i,2}'*agent{t+1,i,6})*agent{t,i,4};
    agent{t+1,i,1}=inc_p_a*dt+agent{t,i,1}; 
    end
 
end