stepall=100;
for i=1:stepall
    i
    picname=[num2str(i) '.fig'];
    open(picname)%     
   %  set(gcf,'outerposition',get(0,'screensize'));% matlab�������
    frame=getframe(gcf);  
    im=frame2im(frame);%����gif�ļ���ͼ�������index����ͼ��  
    [I,map]=rgb2ind(im,256);          
    if i==1
        imwrite(I,map,'baidujingyan.gif','gif', 'Loopcount',inf,'DelayTime',0.1);%��һ�α��봴����
    elseif i==stepall
        imwrite(I,map,'baidujingyan.gif','gif','WriteMode','append','DelayTime',0.1);
    else
        imwrite(I,map,'baidujingyan.gif','gif','WriteMode','append','DelayTime',0.1);
    end;  
    close all
end