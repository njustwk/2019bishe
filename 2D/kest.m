clear all
close all
%%  定义变量
v_tang=3.7;%agent切向速度

r_des=2;%理想半径
dt=0.001;%步长
n=12;%时间
I=eye(2);

p_t=[2;3];%目标位置
p_t_est=zeros(2,n/dt);%目标估计位置
p_a=zeros(2,n/dt);%agent轨迹
p_a(:,1)=[9;8];%agent初始位置
p_t_est(:,1)=[1;2];%目标估计的初始位置
r_est=0;

angle=zeros(1,n/dt);%方位角
vector_1=zeros(2,n/dt);%单位方向向量
vector_2=zeros(2,n/dt);%逆时针90度后的单位方向向量

a=zeros(2,1);
b=[1;0];
inc_p_t_est=zeros(2,1);
inc_p_a=zeros(2,1);
%c=zeros(2,n/dt);
dis=0;
for k_est=[0.05,0.5,5,50,500];%恒定正标量
%%      
%    figure(1);
%    plot(2,3,'r*');  
%    hold on;
%    axis equal;

%    grid on;
%    xlabel('X(m)');
%    ylabel('Y(m)');
 for t=1:1:n/dt
    a = p_t-p_a(:,t);
    if a(2,1)>=0 
        angle(:,t) = acos((a(1,1)*b(1,1)+a(2,1)*b(2,1))/sqrt(a(1,1)^2+a(2,1)^2));    
    else
        angle(:,t) = 2*pi-acos((a(1,1)*b(1,1)+a(2,1)*b(2,1))/sqrt(a(1,1)^2+a(2,1)^2));
    end %求得方位角
   vector_1(:,t)=[cos(angle(:,t));sin(angle(:,t))];
   vector_2(:,t)=[sin(angle(:,t));-cos(angle(:,t))];%求得两个方向向量 
   
   inc_p_t_est = k_est*(I-vector_1(:,t)*vector_1(:,t)')*(p_a(:,t)-p_t_est(:,t));%估计器
   p_t_est(:,t+1)=inc_p_t_est*dt+p_t_est(:,t);
   r_est=mynorm(p_a(1,t),p_a(2,t),p_t_est(1,t+1),p_t_est(2,t+1));%控制器
   inc_p_a=(r_est-r_des)*vector_1(:,t)+v_tang*vector_2(:,t);
   p_a(:,t+1)=inc_p_a*dt+p_a(:,t);
   
%    plot(p_a(1,t),p_a(2,t));
%    hold on;
   
 end

% 结果图像输出
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
% 
%    
    figure(1);
    axis([0,12,0,1.5]);
   for t=1:1:n/dt
    dis=mynorm(p_t_est(1,t),p_t_est(2,t),p_t(1,1),p_t(2,1));
     plot(t/1000,dis);   
     hold on;
     t
   end
   grid on;
   xlabel('time(min)');
   ylabel({'$\left\| {{\mathbf{P}}_{T}}(t)-{{\mathbf{P}}_{A}}(t) \right\|(km)$'},'Interpreter','latex');
  %   title('distance between y and x');   
  axis([0,12,0,1.5]);
  hold on;
end
text(10.2,1.15,'k_e_s_t=0.05');
text(9.2,1.,'k_e_s_t=500');
text(8.2,0.5,'k_e_s_t=50');
text(6.2,0.2,'k_e_s_t=0.5');
text(2.2,0.1,'k_e_s_t=5');
%    saveas(1,'4_3.pdf');