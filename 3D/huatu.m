%     bing1=1;
%     fin1=2000;   
%     figure(1);
%     axis equal;
%     
% for t=bing1:1:fin1
%     t
%      axis equal;
%      plot3(1,0,0,'r*');
%      plot3(-3,-3,0,'go');
%      plot3(agent{t,1,1}(1,1),agent{t,1,1}(2,1),agent{t,1,1}(3,1),'g');%ÂÌÉ«
%      hold on;
%      plot3(-1,-3,0,'bo');
%      plot3(agent{t,2,1}(1,1),agent{t,2,1}(2,1),agent{t,2,1}(3,1),'b');%À¶É«
%      hold on;
%      plot3(1,-3,0,'yo');
%      plot3(agent{t,3,1}(1,1),agent{t,3,1}(2,1),agent{t,3,1}(3,1),'y');%»ÆÉ«
%      hold on;
%      plot3(3,3,0,'co');
%      plot3(agent{t,4,1}(1,1),agent{t,4,1}(2,1),agent{t,4,1}(3,1),'c');%ÇàÂÌ
%      hold on;
%      plot3(1,3,0,'mo');
%      plot3(agent{t,5,1}(1,1),agent{t,5,1}(2,1),agent{t,5,1}(3,1),'m');%Ñóºì
%      hold on;
%      plot3(-1,3,0,'ko');
%      plot3(agent{t,6,1}(1,1),agent{t,6,1}(2,1),agent{t,6,1}(3,1),'k');%ºÚÉ«
%      hold on;
%      axis equal;
% %     if mod(t,50)==0
% %     fmat(:,t/50)=getframe;
% %     picname=[num2str(t/50) '.fig'];
% %     saveas(gcf,picname);
% %     end%´æÍ¼Æ¬
% end
%      plot3(1,0,0,'r*');
%      plot3(agent{fin,1,1}(1,1),agent{fin,1,1}(2,1),agent{fin,1,1}(3,1),'go');
%      hold on;
%      plot3(agent{fin,2,1}(1,1),agent{fin,2,1}(2,1),agent{fin,2,1}(3,1),'bo');
%      hold on;
%      plot3(agent{fin,3,1}(1,1),agent{fin,3,1}(2,1),agent{fin,3,1}(3,1),'yo');
%      hold on;
%      plot3(agent{fin,4,1}(1,1),agent{fin,4,1}(2,1),agent{fin,4,1}(3,1),'co');
%      hold on;
%      plot3(agent{fin,5,1}(1,1),agent{fin,5,1}(2,1),agent{fin,5,1}(3,1),'mo');
%      hold on;
%      plot3(agent{fin,6,1}(1,1),agent{fin,6,1}(2,1),agent{fin,6,1}(3,1),'ko');
%      hold on;
%      axis equal;
%      grid on;
%      xlabel('x(km)');
%      ylabel('y(km)');
%      zlabel('z(km)');

    bing=1;
    fin=2000;
 figure(2);
 for t=bing:1:fin
    t 
    dis=mynorm1(agent{t,1,5},[1;0;0]);  
    plot(t/200,dis,'g');  
    hold on;
    
    dis=mynorm1(agent{t,2,5},[1;0;0]);  
    plot(t/200,dis,'b');  
    hold on;
    
    dis=mynorm1(agent{t,3,5},[1;0;0]);  
    plot(t/200,dis,'y');  
    hold on;
    
    dis=mynorm1(agent{t,4,5},[1;0;0]);  
    plot(t/200,dis,'c');  
    hold on;
    
    dis=mynorm1(agent{t,5,5},[1;0;0]);  
    plot(t/200,dis,'m');  
    hold on;
    
    dis=mynorm1(agent{t,6,5},[1;0;0]);  
    plot(t/200,dis,'k');  
    hold on;
 end
   grid on;
   xlabel('time(min)');
   ylabel({'$\left\| {{{\mathbf{\hat{r}}}}_{i}}(t)-{{\mathbf{r}}_{i}} \right\|\left( km \right)$'},'Interpreter','latex');
   legend('{{v}_{1}}','{{v}_{2}}','{{v}_{3}}','{{v}_{4}}','{{v}_{5}}','{{v}_{6}}');
   
    figure(3);
 for t=bing:1:fin
    t 
    dis=mynorm1(agent{t,1,1},[1;0;0]);  
    plot(t/200,dis,'g');  
    hold on;
    
     dis=mynorm1(agent{t,2,1},[1;0;0]);  
    plot(t/200,dis,'b');  
    hold on;
    
        dis=mynorm1(agent{t,3,1},[1;0;0]);  
    plot(t/200,dis,'y');  
    hold on;
    
        dis=mynorm1(agent{t,4,1},[1;0;0]);  
    plot(t/200,dis,'c');  
    hold on;
    
        dis=mynorm1(agent{t,5,1},[1;0;0]);  
    plot(t/200,dis,'m');  
    hold on;
    
        dis=mynorm1(agent{t,6,1},[1;0;0]);  
    plot(t/200,dis,'k');  
    hold on;
 end
   grid on;
   xlabel('time(min)');
   ylabel({'$\left\| {{\mathbf{x}}_{i}}(t)-{{\mathbf{r}}_{i}} \right\|\left( km \right)$'},'Interpreter','latex');
   legend('{{v}_{1}}','{{v}_{2}}','{{v}_{3}}','{{v}_{4}}','{{v}_{5}}','{{v}_{6}}');
      
    figure(4);
 for t=bing:1:fin
    t 
     fxl1=[0;sqrt(3);1];
 %     fxl1=[0;0;1];
    dis=rad2deg(acos(dot(agent{t,1,6},fxl1)/norm(agent{t,1,6},2)/norm(fxl1,2))); 
    plot(t/200,dis,'g');  
    hold on;
    
    dis=rad2deg(acos(dot(agent{t,2,6},fxl1)/norm(agent{t,2,6},2)/norm(fxl1,2)));
    plot(t/200,dis,'b');  
    hold on;
    
    dis=rad2deg(acos(dot(agent{t,3,6},fxl1)/norm(agent{t,3,6},2)/norm(fxl1,2)));
    plot(t/200,dis,'y');  
    hold on;
    
    dis=rad2deg(acos(dot(agent{t,4,6},fxl1)/norm(agent{t,4,6},2)/norm(fxl1,2)));
    plot(t/200,dis,'c');  
    hold on;
    
    dis=rad2deg(acos(dot(agent{t,5,6},fxl1)/norm(agent{t,5,6},2)/norm(fxl1,2)));
    plot(t/200,dis,'m');  
    hold on;
    
    dis=rad2deg(acos(dot(agent{t,6,6},fxl1)/norm(agent{t,6,6},2)/norm(fxl1,2)));
    plot(t/200,dis,'k');  
    hold on;
 end
   grid on;
   xlabel('time(min)');
   ylabel({'$\tilde{\theta }\left( {}^\circ  \right)$'},'Interpreter','latex');
   legend('{{v}_{1}}','{{v}_{2}}','{{v}_{3}}','{{v}_{4}}','{{v}_{5}}','{{v}_{6}}');