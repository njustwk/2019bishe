    bing=1500;
    fin=2000;   
    figure(1);
    axis([-3,3,-3,3,-1,1]);
    axis equal;
    grid on;
     xlabel('x(km)');
     ylabel('y(km)');
     zlabel('z(km)');
     jishu=0;
for t=bing:2:fin
    t
    jishu=jishu+1
     axis equal;
     plot3(1,0,0,'r*');
     %plot3(-3,-3,0,'go');
     plot3(-3,-3,0,'g');
     p1=plot3(agent{t,1,1}(1,1),agent{t,1,1}(2,1),agent{t,1,1}(3,1),'g');%ÂÌÉ«
     hold on;
     %plot3(-1,-3,0,'bo');
     plot3(-1,-3,0,'b');
     p2=plot3(agent{t,2,1}(1,1),agent{t,2,1}(2,1),agent{t,2,1}(3,1),'b');%À¶É«
     hold on;
    % plot3(1,-3,0,'yo');
    plot3(1,-3,0,'y');
     p3=plot3(agent{t,3,1}(1,1),agent{t,3,1}(2,1),agent{t,3,1}(3,1),'y');%»ÆÉ«
     hold on;
    % plot3(3,3,0,'co');
    plot3(3,3,0,'c');
     p4=plot3(agent{t,4,1}(1,1),agent{t,4,1}(2,1),agent{t,4,1}(3,1),'c');%ÇàÂÌ
     hold on;
    % plot3(1,3,0,'mo');
    plot3(1,3,0,'m');
     p5=plot3(agent{t,5,1}(1,1),agent{t,5,1}(2,1),agent{t,5,1}(3,1),'m');%Ñóºì
     hold on;
    % plot3(-1,3,0,'ko');
    plot3(-1,3,0,'k');
     p6=plot3(agent{t,6,1}(1,1),agent{t,6,1}(2,1),agent{t,6,1}(3,1),'k');%ºÚÉ«
     hold on;
     axis equal;
     grid on;
%     if mod(jishu,40)==0
%     fmat(:,jishu/40)=getframe;
%     picname=[num2str(jishu/40) '.fig'];
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
     xlabel('x(km)');
     ylabel('y(km)');
     zlabel('z(km)');
 legend([p1 p2 p3 p4 p5 p6],'{{v}_{1}}','{{v}_{2}}','{{v}_{3}}','{{v}_{4}}','{{v}_{5}}','{{v}_{6}}');