%Given the function f(x,y) find determine the
%minimum of the function and the minimum direction
%in the point [0.5, 0].


[a,b]=meshgrid(-1:0.1:1,-1:0.1:1);

syms x y
f(x,y) =sin(1/2*x.^2 - 1/4*y.^2+3) * cos(2*x+1+exp(y));
z = double(subs(f(a ,b)));
dx = diff(f,x);
dy = diff(f,y);


surf(a,b,z), hold on;

sol = [0.5; 0];


it = 0;
for i=1:800
    
    x=sol(1,i);
    y=sol(2,i);
    
    rdx = double(subs(dx(x,y)));
    rdy = double(subs(dy(x,y)));
    sol(:,i+1) = sol(:,i) - 0.01* [rdx;rdy];
    plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r', 'LineWidth',3)
    
    if sol(1,i+1) == sol(1,i) && sol(2,i) == sol(2,i+1)
        it = i;
        minimo = double(subs(f(sol(1,i),sol(2,i))));
        break;
    end
    
    
end