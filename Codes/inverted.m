
function dx = inverted(t,x)
if isfile("mamfis.fis")
     a=readfis("mamfis.fis");
else
a=newfis('Inverted Pendalum');
a=addvar(a,'input','error (e)',[-pi/2 pi/2]);
a=addmf(a,'input',1,'NL','trimf', [-10 -pi/2 -pi/4]);
a=addmf(a,'input',1,'NS','trimf', [-pi/2 -pi/4 0]);
a=addmf(a,'input',1,'Z','trimf', [-pi/4 0 pi/4]);
a=addmf(a,'input',1,'PS','trimf', [0 pi/4 pi/2]);
a=addmf(a,'input',1,'PL','trimf', [pi/4 pi/2 +10]);
a=addvar(a,'input','change of error (de/dt)',[-pi/2 pi/2]);
a=addmf(a,'input',2,'NL','trimf', [-10 -pi/4 -pi/8]);
a=addmf(a,'input',2,'NS','trimf', [-pi/4 -pi/8 0]);
a=addmf(a,'input',2,'Z','trimf', [-pi/8 0 pi/8]);
a=addmf(a,'input',2,'PS','trimf', [0 pi/8 pi/4]);
a=addmf(a,'input',2,'PL','trimf', [pi/8 pi/4 +10]);
a=addvar(a,'output','u(t)', [-30 30]);
a=addmf(a,'output',1,'NL','trimf', [-30 -20 -10]);
a=addmf(a,'output',1,'NS','trimf', [-20 -10 0]);
a=addmf(a,'output',1,'Z','trimf', [-10 0 10]);
a=addmf(a,'output',1,'PS','trimf', [0 10 20]);
a=addmf(a,'output',1,'PL','trimf', [10 20 30]);
rulelist=[1 1 5 1 1;
          1 2 5 1 1;
          1 3 5 1 1;
          1 4 4 1 1;
          1 5 3 1 1;
          2 1 5 1 1;
          2 2 5 1 1;
          2 3 4 1 1;
          2 4 3 1 1;
          2 5 2 1 1;
          3 1 5 1 1;
          3 2 4 1 1;
          3 3 3 1 1;
          3 4 2 1 1;
          3 5 1 1 1;
          4 1 4 1 1;
          4 2 3 1 1;
          4 3 2 1 1;
          4 4 1 1 1;
          4 5 1 1 1;
          5 1 3 1 1;
          5 2 2 1 1;
          5 3 1 1 1;
          5 4 1 1 1;
          5 5 1 1 1;];
a=addrule(a,rulelist);
end

g0=2;
g1=0.1;
h=1;
inp=[-x(1)*g0 -x(2)*g1];
U=evalfis(inp,a)
fuzz=readfis("FFis.fis");
pref = evalfis(fuzz,[g0*x(1),g1*x(2)])
if U >-20 && U<-10
    h=5;
    disp("rule 1 and 2")
    %a = removeMF(a,"u(t)","NL");
    %a = removeMF(a,"u(t)","NS");
    modif1 = -20+pref*(U+20)/10*2;
    modif2=-10+pref*0.2+(1-(U+20)/10)*2;
    %a=addmf(a,'output',1,'NL','trimf', [-30 modif1 -10]);
    %a=addmf(a,'output',1,'NS','trimf', [-20 modif2 0]);
    a.outputs.MembershipFunctions(1).parameters=[-30 modif1 -10];
    a.outputs.MembershipFunctions(2).parameters=[-20 modif2 0];
elseif  U >-10 && U<0
    h=5;
    disp("rule 2 and 3") 
    %a = removeMF(a,"u(t)","NS");
    %a = removeMF(a,"u(t)","Z");
    modif1 = -10+pref*(U+10)/10*2;
    modif2= pref*0.2+(1-(U+10)/10)*2;
    %a=addmf(a,'output',1,'NS','trimf', [-20 modif1 0]);
    %a=addmf(a,'output',1,'Z','trimf', [-10 modif2 10]);
    a.outputs.MembershipFunctions(2).parameters=[-20 modif1 0];
    a.outputs.MembershipFunctions(3).parameters=[-10 modif2 10];
elseif  U >0 && U<10
    h=5;
    disp("rule 3 and 4") 
    %a = removeMF(a,"u(t)","Z");
    %a = removeMF(a,"u(t)","PS");
    modif1 =pref*(U)/10*2;
    modif2= 10+pref*(1-U/10)*2;
    %a=addmf(a,'output',1,'Z','trimf', [-10 modif1 10]);
    %a=addmf(a,'output',1,'PS','trimf', [0 modif2 20]);
    a.outputs.MembershipFunctions(3).parameters=[-10 modif1 10];
    a.outputs.MembershipFunctions(4).parameters=[0 modif2 20];
elseif  U >10 && U<20
    h=5;
    disp("rule 4 and 5")
    %a = removeMF(a,"u(t)","PS");
    %a = removeMF(a,"u(t)","PL");
    modif1 = 10+pref*(U-10)/10*2;
    modif2= 20+pref*(1-(U-10)/10)*2;
    %a=addmf(a,'output',1,'PS','trimf', [0 modif1 20]);
    %a=addmf(a,'output',1,'PL','trimf', [10 modif2 30]);
    a.outputs.MembershipFunctions(4).parameters=[0 modif1 20];
    a.outputs.MembershipFunctions(5).parameters=[10 modif2 30];
end

U=U*h;
dx(1)=x(2);

writeFIS(a,"mamfis");



dx(2)=((9.8*sin(x(1))+cos(x(1))*((-x(3)-0.25*(x(2))^2*sin(x(1)))/(1.5)))/(0.5*(4/3-(1/3)*(cos(x(1))^2))));
dx(3)= -100*x(3)+100*U;
dx=dx';
end
