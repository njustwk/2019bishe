
     bing=1000;
     fin=2000;
    figure(1);
    axis equal;
%     axis([-2.5 2.5 -2.5 2.5 -1 1]);
%     set(gca, 'XLim',[-2.5 2.5]); 
%     set(gca, 'YLim',[-2.5 2.5]); 
%     set(gca, 'ZLim',[-1 1]); 
for t=bing:5:fin
    t
     axis equal;
     plot3(1,0,0,'r*');
  
     plot3(agent{t,1,1}(1,1),agent{t,1,1}(2,1),agent{t,1,1}(3,1),'g');%ÂÌÉ«
     hold on;

     plot3(agent{t,2,1}(1,1),agent{t,2,1}(2,1),agent{t,2,1}(3,1),'b');%À¶É«
     hold on;

     plot3(agent{t,3,1}(1,1),agent{t,3,1}(2,1),agent{t,3,1}(3,1),'y');%»ÆÉ«
     hold on;
   
     plot3(agent{t,4,1}(1,1),agent{t,4,1}(2,1),agent{t,4,1}(3,1),'c');%ÇàÂÌ
     hold on;
  
     plot3(agent{t,5,1}(1,1),agent{t,5,1}(2,1),agent{t,5,1}(3,1),'m');%Ñóºì
     hold on;
 
     plot3(agent{t,6,1}(1,1),agent{t,6,1}(2,1),agent{t,6,1}(3,1),'k');%ºÚÉ«
     hold on;
     axis equal;
%     if mod(t,50)==0
%     fmat(:,t/50)=getframe;
%     picname=[num2str(t/50) '.fig'];
%     saveas(gcf,picname);
%     end%´æÍ¼Æ¬
end
      plot3(1,0,0,'r*');
     plot3(agent{fin,1,1}(1,1),agent{fin,1,1}(2,1),agent{fin,1,1}(3,1),'go');
     hold on;
     plot3(agent{fin,2,1}(1,1),agent{fin,2,1}(2,1),agent{fin,2,1}(3,1),'bo');
     hold on;
     plot3(agent{fin,3,1}(1,1),agent{fin,3,1}(2,1),agent{fin,3,1}(3,1),'yo');
     hold on;
     plot3(agent{fin,4,1}(1,1),agent{fin,4,1}(2,1),agent{fin,4,1}(3,1),'co');
     hold on;
     plot3(agent{fin,5,1}(1,1),agent{fin,5,1}(2,1),agent{fin,5,1}(3,1),'mo');
     hold on;
     plot3(agent{fin,6,1}(1,1),agent{fin,6,1}(2,1),agent{fin,6,1}(3,1),'ko');
     hold on;
     axis equal;
     grid on;
     axis([-2.5 2.5 -2.5 2.5 -1 1]);
%     picname=[num2str(bing/50+1) '.fig'];
%     saveas(gcf,picname);%´æÍ¼Æ¬
