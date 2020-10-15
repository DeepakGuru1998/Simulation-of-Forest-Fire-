
forest= randi([0,1],128,128);
p=0.1;
f=0.8;
for iteration=1:30
    for i= 1:128
        for j= 1:128
            if forest(i,j) == 0
                if rand<p
                    forest(i,j) = 1;
                end
            end
        end
    end
    fire=[];
    r=rand;
    disp(r);
    if r<f
        x=randi([1,128],1,1);
        y=randi([1,128],1,1);
        disp(forest(x,y));
        if forest(x,y) == 1
            forest(x,y)=3;
            fire=[fire;x y];
            i=1;
            while i<16384
                if fire(i,1)>1 && forest(fire(i,1)-1,fire(i,2))==1
                    temp1 = fire(i,1)-1;
                    temp2 = fire(i,2);
                    forest(temp1,temp2)=3;
                    fire=[fire;temp1 temp2];
                end
                
                if fire(i,1)<128 && forest(fire(i,1)+1,fire(i,2))==1
                    temp1 = fire(i,1)+1;
                    temp2 = fire(i,2);
                    forest(temp1,temp2)=3;
                    fire=[fire;temp1 temp2];
                end
                
                if fire(i,2)<128 && forest(fire(i,1),fire(i,2)+1)==1
                    temp1 = fire(i,1);
                    temp2 = fire(i,2)+1;
                    forest(temp1,temp2)=3;
                    fire=[fire;temp1 temp2];
                end
                
                if fire(i,2)>1 && forest(fire(i,1),fire(i,2)-1)==1
                    temp1 = fire(i,1);
                    temp2 = fire(i,2)-1;
                    forest(temp1,temp2)=3;
                    fire=[fire;temp1 temp2];
                end
                if i==size(fire,1)
                    break;
                end
                i=i+1;
            end   

        else
            forest(x,y)=0;
        end
    end
    white=[];
    green=[];
    orange=[];
    for m = 1:128
        for n = 1:128
            if forest(m,n) == 0
                white=[white;m n];
            end
            if forest(m,n) == 1
                green = [green;m n];
            end
            if forest(m,n) == 3
                orange = [orange;m n];
            end
        end
    end
    plot(white(:,1),white(:,2),'.w');
    hold on
    plot(green(:,1),green(:,2),'.g');
    hold on
    if size(orange,1) >= 1
        plot(orange(:,1),orange(:,2),'.r');
    end
    xlim([1,128]);
    ylim([1,128]);
    hold off
    pause(1);
    
    for m=1:128
        for n=1:128
            if forest(m,n) == 3
                forest(m,n) = 0;
            end
        end
    end
    
end