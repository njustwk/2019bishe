clear all
close all
%%  �������
v_tang=5;%agent�����ٶ�
k_est=5;%�㶨������

dt=0.001;%����
n=10;%��������
I=eye(2);%��λ����
d=0.5;%��Ե����
num=3;%Ŀ�����

p_a=zeros(1,2,n/dt);%agent�켣
p_a(1,:,1)=[9;8];%agent��ʼλ��

p_t=zeros(num,2,1);%Ŀ��λ��
p_t(1,:,1)=[2;4];
p_t(2,:,1)=[1;2];
p_t(3,:,1)=[3;3];%Ŀ���ʼλ��

 p_t_est=zeros(num,2,n/dt);%Ŀ�����λ��
 p_t_est(1,:,1)=[3;2];
 p_t_est(2,:,1)=[3;0];
 p_t_est(3,:,1)=[7;3];%Ŀ����Ƶĳ�ʼλ��
 
 p_v_t=zeros(1,2,n/dt);%����Ŀ��λ��
 %p_v_t(1,:,1)=[2;3]; %����Ŀ���ʼλ��
 r_v(n/dt)=0;%����뾶
 r_est=0;%agent��������Ŀ��ľ���
 
 angle=zeros(num+1,1,n/dt);%��λ��
 vector_1=zeros(num,2,n/dt);%��λ��������
 vector_2=zeros(num,2,n/dt);%��ʱ��90�Ⱥ�ĵ�λ��������
 
 aa=zeros(2,1);
 bb=[1;0];
 cc=zeros(2,1);
 dd=zeros(2,1);
 ee=zeros(num,2,1);
 inc_p_t_est=zeros(2,1);
 ff=zeros(1,2,1);
 %inc_p_aa=zeros(2,1);
 
 %%  
    plot(2,4,'r*',1,2,'r*',3,3,'r*'); 
    hold on;
    axis equal;
    grid on;
    xlabel('X(m)');
    ylabel('Y(m)');

  for t=1:1:n/dt
     %����������
      for tarnum=1:1:num
      aa(1,1)= p_t(tarnum,1,1)-p_a(1,1,t);
      aa(2,1)= p_t(tarnum,2,1)-p_a(1,2,t);
     if aa(2,1)>=0 
         angle(tarnum,:,t) = acos((aa(1,1)*bb(1,1)+aa(2,1)*bb(2,1))/sqrt(aa(1,1)^2+aa(2,1)^2));    
     else
         angle(tarnum,:,t) = 2*pi-acos((aa(1,1)*bb(1,1)+aa(2,1)*bb(2,1))/sqrt(aa(1,1)^2+aa(2,1)^2));
     end %��÷�λ��
    vector_1(tarnum,:,t)=[cos(angle(tarnum,:,t));sin(angle(tarnum,:,t))];   
 %  vector_2(num,:,t)=[sin(angle(:,t));-cos(angle(:,t))];%���������������  
 
    cc(1,1)= p_a(1,1,t)-p_t_est(tarnum,1,t);
    cc(2,1)= p_a(1,2,t)-p_t_est(tarnum,2,t);
    dd(1,1)=vector_1(tarnum,1,t);
    dd(2,1)=vector_1(tarnum,2,t);
    inc_p_t_est = k_est*(I-dd*dd')*cc;
    ee(tarnum,1,1)=inc_p_t_est(1,1)*dt;
    ee(tarnum,2,1)=inc_p_t_est(2,1)*dt;
    p_t_est(tarnum,:,t+1)=ee(tarnum,:,1)+p_t_est(tarnum,:,t);%������
    
    p_v_t(1,:,t)=p_v_t(1,:,t)+p_t_est(tarnum,:,t+1)/3;%����Ŀ��λ��
      end  
  %�м䲿��   
     aa(1,1)= p_v_t(1,1,t)-p_a(1,1,t);
     aa(2,1)= p_v_t(1,2,t)-p_a(1,2,t);
     if aa(2,1)>=0 
         angle(num+1,:,t) = acos((aa(1,1)*bb(1,1)+aa(2,1)*bb(2,1))/sqrt(aa(1,1)^2+aa(2,1)^2));    
     else
         angle(num+1,:,t) = 2*pi-acos((aa(1,1)*bb(1,1)+aa(2,1)*bb(2,1))/sqrt(aa(1,1)^2+aa(2,1)^2));
     end %��÷�λ��
    vector_1(num+1,:,t)=[cos(angle(num+1,:,t));sin(angle(num+1,:,t))];   
    vector_2(num+1,:,t)=[sin(angle(num+1,:,t));-cos(angle(num+1,:,t))];%����µ�������������  
    
    r_est=mynorm(p_v_t(1,1,t),p_v_t(1,2,t),p_a(1,1,t),p_a(1,2,t));%agent��������Ŀ��ľ���
    
     for tarnum=1:1:num
     A(tarnum)=mynorm(p_v_t(1,1,t),p_v_t(1,2,t),p_t_est(tarnum,1,t+1),p_t_est(tarnum,2,t+1));
     end
     r_v(t)=max(A)+d;                                                         
    %������
    inc_p_aa=(r_est-r_v(t))*vector_1(num+1,:,t)+v_tang*vector_2(num+1,:,t);
    ff(1,1,1)=inc_p_aa(1,1)*dt;
    ff(1,2,1)=inc_p_aa(1,2)*dt;
    p_a(1,:,t+1)=ff(1,:,1)+p_a(1,:,t);%???
    
    plot(p_a(1,1,t),p_a(1,2,t));
    hold on;
    
%    if mod(t,200)==0
%    fmat(:,t/200)=getframe;
%    picname=[num2str(t/200) '.fig'];
%    saveas(gcf,picname);
%    end

  end

% ���ͼ�����
     figure(2);
   for t=1:1:n/dt
     dis=mynorm(2,3,p_v_t(1,1,t),p_v_t(1,2,t));
     plot(t/1000,dis);   
     hold on;
   end
   grid on;
   xlabel('t(s)');
   ylabel('distance(m)');
   title('distance between x and virtual x');
   
     figure(3);
   for t=1:1:n/dt
     dis=mynorm(p_a(1,1,t),p_a(1,2,t),p_v_t(1,1,t),p_v_t(1,2,t))-r_v(t);
     plot(t/1000,dis);   
     hold on;
   end
   grid on;
   xlabel('t(s)');
   ylabel('distance(m)');
   title('distance between r_v and r_e_s_t');
   

   % ���ͼ�񱣴�
%     saveas(1,'case3_1.pdf');
%     saveas(2,'case3_2.pdf');
%     saveas(3,'case3_3.pdf');

   