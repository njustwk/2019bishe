stepall=100;
for i=1:stepall
    i
    picname=[num2str(i) '.fig'];
    open(picname)%     
   %  set(gcf,'outerposition',get(0,'screensize'));% matlab窗口最大化
    frame=getframe(gcf);  
    im=frame2im(frame);%制作gif文件，图像必须是index索引图像  
    [I,map]=rgb2ind(im,256);          
    if i==1
        imwrite(I,map,'baidujingyan.gif','gif', 'Loopcount',inf,'DelayTime',0.1);%第一次必须创建！
    elseif i==stepall
        imwrite(I,map,'baidujingyan.gif','gif','WriteMode','append','DelayTime',0.1);
    else
        imwrite(I,map,'baidujingyan.gif','gif','WriteMode','append','DelayTime',0.1);
    end;  
    close all
end