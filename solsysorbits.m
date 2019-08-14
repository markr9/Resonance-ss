format compact
format long

m=[0.387,0.723,1,1.524,2.77,5.202,9.555,19.218,30.110,39.482]
o=m*1
rr=91
a=[1/12,1/11,1/10,1/9,1/8,1/7,1/6,2/11,1/5,2/9,1/4,3/11,2/7,3/10,1/3,4/11,3/8,2/5,5/12,3/7,4/9,5/11,1/2,6/11,5/9,4/7,7/12,3/5,5/8,7/11,2/3,7/10,5/7,8/11,3/4,7/9,4/5,9/11,5/9,6/7,7/8,8/9,9/10,10/11,11/12];
r=zeros(1,rr*length(o));
s=zeros(1,rr*length(o));
M=1.989e30/1.989e30
p=sqrt(1/M*o.^3)

j=1;
while j<(length(o)+1)
    r(j)=o(j);
    s(j)=1;
    j=j+1;
end

z=1;
while z<(length(o)+1)
    k=1;
    while k<(length(a)+1)
       r(j)=((p(z)*a(k))^2*M)^(1/3);
       s(j)=z+1;
       j=j+1;
       r(j)=((p(z)*1/a(k))^2*M)^(1/3);
       s(j)=z+1;
        k=k+1;
        j=j+1;
    end
    z=z+1;
end

i=(j-1);
figure
while i>0 %<(length(r)+1)
    theta=0;
    theta=0:0.01*pi:2*pi;
    x=r(i)*cos(theta);
    y=r(i)*sin(theta);
    if s(i)==1
        plot(x,y,'ro')
    elseif s(i)==2 | s(i)==9 | s(i)==16
        plot(x,y,'b')
    elseif s(i)==3 | s(i)==10
        plot(x,y,'g')
    elseif s(i)==4 | s(i)==11
        plot(x,y,'m')
    elseif s(i)==5 | s(i)==12
        plot(x,y,'y')
    elseif s(i)==6 | s(i)==13
        plot(x,y,'c')
    elseif s(i)==7 | s(i)==14
        plot(x,y,'k')
    else s(i)==8 | s(i)==15
            plot(x,y,'r')
    end
    hold on
    i=i-1;
end
plot(0,0,'ro')
hold off
grid on
disp('blue for mercury; green for venus; magenta for earth; yellow for mars; cyan for ceres; black for jupiter; red for saturn; blue for uranus; green neptune, magneta for pluto')
