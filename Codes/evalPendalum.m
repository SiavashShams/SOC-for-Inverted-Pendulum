a=newfis('Inverted Pendalum');
a=addvar(a,'input','error (e)',[-pi/2 pi/2]);
a=addmf(a,'input',1,'NL','trimf', [-10 -pi/2 -pi/4]);
a=addmf(a,'input',1,'NS','trimf', [-pi/2 -pi/4 0]);
a=addmf(a,'input',1,'Z','trimf', [-pi/4 0 pi/4]);
a=addmf(a,'input',1,'PS','trimf', [0 pi/4 pi/2]);
a=addmf(a,'input',1,'PL','trimf', [pi/4 pi/2 +10]);
a=addvar(a,'input','change of error (de/dt)',[-pi/2 pi/2]);
a=addmf(a,'input',2,'NL','trimf', [-10 -pi/2 -pi/4]);
a=addmf(a,'input',2,'NS','trimf', [-pi/2 -pi/4 0]);
a=addmf(a,'input',2,'Z','trimf', [-pi/4 0 pi/4]);
a=addmf(a,'input',2,'PS','trimf', [0 pi/4 pi/2]);
a=addmf(a,'input',2,'PL','trimf', [pi/4 pi/2 +10]);
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
figure(1)
plotmf(a,'input',1);
axis([-pi/2 pi/2 0 1])
figure(2)
plotmf(a,'input',2);
axis([-pi/2 pi/2 0 1])
figure(3)
plotmf(a,'output',1);
axis([-30 30 0 1])
% temp=8;
% out=evalfis(temp,a);
figure(4)
gensurf(a);
    % i=1;
    % for temp=0:0.1:100;
    %     out(i)=evalfis(temp,a);
    %     i=i+1;
    % end
    % plot(out,temp)
% a.input.mf(1).params
% a.input.mf(1).type




