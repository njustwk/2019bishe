clear all
close all
%%  �������
ri=1.2;%Ŀ�����뾶
vi=-pi/5;%��2���е��ٶ���
aa=1;%��7���еĲ�����,���Э���Ĳ����������ĵ�������10��
kbb=sqrt(2*pi)/30;%(8)�Ĳ�����
miu=0.5;%(8)�Ĳ�����
number=6;%agent����

dt=0.005;%����
n=10;%ʱ��

p_t=[1;0;0];%Ŀ��λ��

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
    
    agent{1,1,5}=[1;0;0];
    agent{1,2,5}=[1;0;0];
    agent{1,3,5}=[1;0;0];
    agent{1,4,5}=[1;0;0];
    agent{1,5,5}=[1;0;0];
    agent{1,6,5}=[1;0;0];%%agent��ʼ����Ŀ��λ��
    
v_i=zeros(n/dt,1);    
a=0;
b=0;
I=[1;0];
%%  �㷨����
for t=1:1:n/dt
    %������
    t
    for i=1:1:number
    agent{t,i,2}=(p_t-agent{t,i,1})/mynorm1(p_t,agent{t,i,1});%����1
    agent{t,i,3}=cross(agent{t,i,6},agent{t,i,2});%/mynorm1(agent{t,num,6},agent{t,num,6});����2���������෴�ˣ�����
    agent{t,i,4}=cross(agent{t,i,2},agent{t,i,3});%����3
    
%     d(1,1)=agent{t,i,2}(1,1);
%     d(2,1)=agent{t,i,2}(2,1);
%     if d(2,1)>=0
%     agent{t,i,7}= acos((d(1,1)*I(1,1)+d(2,1)*I(2,1))/sqrt(d(1,1)^2+d(2,1)^2));
%     else
%     agent{t,i,7}= 2*pi-acos((d(1,1)*I(1,1)+d(2,1)*I(2,1))/sqrt(d(1,1)^2+d(2,1)^2));
%     end%��÷�λ��

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
%     %������ٶ�Э�� 
%     for j=1:1:number
%      b=b+sign(agent{t,j,7}- agent{t,i,7})*(abs((agent{t,j,7}- agent{t,i,7})))^miu;
%     end
%     v_i(t+1,1)=kbb*ri*b*dt+v_i(t,1);      
%     end
    
    %������ٶ�Э�� 
    for j=1:1:number
     b=b+sign(agent{t,j,7}- agent{t,i,7})*(abs((agent{t,j,7}- agent{t,i,7})))^miu;
    end
    agent{t,i,8}=kbb*ri*b;      
end
    
    %������
    for i=1:1:number 
    inc_p_a=(mynorm1(agent{t,i,1},agent{t+1,i,5})-ri)*agent{t,i,2}+(vi-agent{t,i,8})*agent{t,i,3}+(agent{t,i,2}'*agent{t+1,i,6})*agent{t,i,4};
    agent{t+1,i,1}=inc_p_a*dt+agent{t,i,1}; 
    end
 
end
%     figure(1);
%     axis equal;
% for t=1:1:n/dt
%     t
%      axis equal;
%      plot3(1,0,0,'r*');
%      plot3(-3,-3,0,'go');
%      plot3(agent{t,1,1}(1,1),agent{t,1,1}(2,1),agent{t,1,1}(3,1),'g');
%      hold on;
%      plot3(-1,-3,0,'bo');
%      plot3(agent{t,2,1}(1,1),agent{t,2,1}(2,1),agent{t,2,1}(3,1),'b');
%      hold on;
%      plot3(1,-3,0,'yo');
%      plot3(agent{t,3,1}(1,1),agent{t,3,1}(2,1),agent{t,3,1}(3,1),'y');
%      hold on;
%      plot3(3,3,0,'co');
%      plot3(agent{t,4,1}(1,1),agent{t,4,1}(2,1),agent{t,4,1}(3,1),'c');
%      hold on;
%      plot3(1,3,0,'mo');
%      plot3(agent{t,5,1}(1,1),agent{t,5,1}(2,1),agent{t,5,1}(3,1),'m');
%      hold on;
%      plot3(-1,3,0,'ko');
%      plot3(agent{t,6,1}(1,1),agent{t,6,1}(2,1),agent{t,6,1}(3,1),'k');
%      hold on;
%      axis equal;
% %     if mod(t,100)==0
% %     fmat(:,t/100)=getframe;
% %     picname=[num2str(t/100) '.fig'];
% %     saveas(gcf,picname);
% %     end%��ͼƬ
% end
%      plot3(agent{n/dt,1,1}(1,1),agent{n/dt,1,1}(2,1),agent{n/dt,1,1}(3,1),'go');
%      hold on;
%      plot3(agent{n/dt,2,1}(1,1),agent{n/dt,2,1}(2,1),agent{n/dt,2,1}(3,1),'bo');
%      hold on;
%      plot3(agent{n/dt,3,1}(1,1),agent{n/dt,3,1}(2,1),agent{n/dt,3,1}(3,1),'yo');
%      hold on;
%      plot3(agent{n/dt,4,1}(1,1),agent{n/dt,4,1}(2,1),agent{n/dt,4,1}(3,1),'co');
%      hold on;
%      plot3(agent{n/dt,5,1}(1,1),agent{n/dt,5,1}(2,1),agent{n/dt,5,1}(3,1),'mo');
%      hold on;
%      plot3(agent{n/dt,6,1}(1,1),agent{n/dt,6,1}(2,1),agent{n/dt,6,1}(3,1),'ko');
%      hold on;
%      axis equal;
%      grid on;
%     picname=[num2str(n/dt/100) '.fig'];
%     saveas(gcf,picname);%��ͼƬ