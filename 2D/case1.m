clear all
close all
%%  �������
v_tang=3.7;%agent�����ٶ�
k_est=5;%�㶨������
r_des=2;%����뾶
dt=0.001;%����
n=12;%ʱ��
I=eye(2);

p_t=[2;3];%Ŀ��λ��
p_t_est=zeros(2,n/dt);%Ŀ�����λ��
p_a=zeros(2,n/dt);%agent�켣
p_a(:,1)=[9;8];%agent��ʼλ��
p_t_est(:,1)=[1;2];%Ŀ����Ƶĳ�ʼλ��
r_est=0;

angle=zeros(1,n/dt);%��λ��
vector_1=zeros(2,n/dt);%��λ��������
vector_2=zeros(2,n/dt);%��ʱ��90�Ⱥ�ĵ�λ��������

a=zeros(2,1);
b=[1;0];
inc_p_t_est=zeros(2,1);
inc_p_a=zeros(2,1);
%c=zeros(2,n/dt);
dis=0;

%%      
   figure(1);
   plot(2,3,'r*');  
   hold on;
   axis equal;
   axis([-1,10,0,9]);
   grid on;
   xlabel('X(km)');
   ylabel('Y(km)');
 for t=1:1:n/dt
    a = p_t-p_a(:,t);
    if a(2,1)>=0 
        angle(:,t) = acos((a(1,1)*b(1,1)+a(2,1)*b(2,1))/sqrt(a(1,1)^2+a(2,1)^2));    
    else
        angle(:,t) = 2*pi-acos((a(1,1)*b(1,1)+a(2,1)*b(2,1))/sqrt(a(1,1)^2+a(2,1)^2));
    end %��÷�λ��
   vector_1(:,t)=[cos(angle(:,t));sin(angle(:,t))];
   vector_2(:,t)=[sin(angle(:,t));-cos(angle(:,t))];%��������������� 
   
   inc_p_t_est = k_est*(I-vector_1(:,t)*vector_1(:,t)')*(p_a(:,t)-p_t_est(:,t));%������
   p_t_est(:,t+1)=inc_p_t_est*dt+p_t_est(:,t);
   r_est=mynorm(p_a(1,t),p_a(2,t),p_t_est(1,t+1),p_t_est(2,t+1));%������
   inc_p_a=(r_est-r_des)*vector_1(:,t)+v_tang*vector_2(:,t);
   p_a(:,t+1)=inc_p_a*dt+p_a(:,t);
   
   plot(p_a(1,t),p_a(2,t),'-');
   hold on;
   t
   if mod(t,200)==0
   fmat(:,t/200)=getframe;
   picname=[num2str(t/200) '.fig'];
   saveas(gcf,picname);
   end%��ͼƬ
 
 end
%  figure(2);
%  movie(fmat,2);
% movie2avi(fmat,'case11.avi','compression', 'None','FPS',30);

% % ���ͼ�����
%    figure(2);
%    for t=1:1:n/dt
%      dis=mynorm(p_t_est(1,t),p_t_est(2,t),p_t(1,1),p_t(2,1));
%      plot(t/1000,dis);   
%      hold on;
%      t
%    end
%    grid on;
%    xlabel('time(min)');
%    ylabel({'$\left\| {{{\mathbf{\hat{P}}}}_{T}}(t)-{{\mathbf{P}}_{T}}(t) \right\|(km)$'},'Interpreter','latex');
%   %  title('distance between x and its estimate');
%   
% %       figure(3);
% %    for t=1:1:n/dt
% %      dis=mynorm(p_a(1,t),p_a(2,t),p_t_est(1,1),p_t_est(2,1));
% %      plot(t/1000,dis);   
% %      hold on;
% %    end
% %    grid on;
% %    xlabel('t(s)');
% %    ylabel('distance(m)');
% %   %  title('distance between y and estimate of x');
%    
%     figure(4);
%    for t=1:1:n/dt
%      dis=mynorm(p_a(1,t),p_a(2,t),p_t(1,1),p_t(2,1));
%      plot(t/1000,dis);   
%      hold on;
%      t
%    end
%    grid on;
%    xlabel('time(min)');
%    ylabel({'$\left\| {{\mathbf{P}}_{T}}(t)-{{\mathbf{P}}_{A}}(t) \right\|(km)$'},'Interpreter','latex');
%   %   title('distance between y and x');
   
   % ���ͼ�񱣴�
%     saveas(1,'1_1.pdf');
%     saveas(2,'1_2.pdf');
%    % saveas(3,'1_3.pdf');
%     saveas(4,'1_4.pdf');
