perf_table = newfis('performance_table','FISType','sugeno');
perf_table = addvar(perf_table,'input','error',[-4 4]);
perf_table = addvar(perf_table,'input','change_error',[-4 4]);
perf_table = addmf(perf_table,'input',1,'NNSmall','trimf',[-10 -4 -3]);
perf_table = addmf(perf_table,'input',1,'NSmall','trimf',[-4 -3 -2]);
perf_table = addmf(perf_table,'input',1,'Small','trimf',[-3 -2 -1]);
perf_table = addmf(perf_table,'input',1,'Big','trimf',[-2 -1 0]);
perf_table = addmf(perf_table,'input',1,'NBig','trimf',[-1 0 1]);
perf_table = addmf(perf_table,'input',1,'NSBig','trimf',[0 1 2]);
perf_table = addmf(perf_table,'input',1,'SBig','trimf',[1 2 3]);
perf_table = addmf(perf_table,'input',1,'MBig','trimf',[2 3 4]);
perf_table = addmf(perf_table,'input',1,'MMBig','trimf',[3 4 10]);

perf_table = addmf(perf_table,'input',2,'NNSmall','trimf',[-10 -4 -3]);
perf_table = addmf(perf_table,'input',2,'NSmall','trimf',[-4 -3 -2]);
perf_table = addmf(perf_table,'input',2,'Small','trimf',[-3 -2 -1]);
perf_table = addmf(perf_table,'input',2,'Big','trimf',[-2 -1 0]);
perf_table = addmf(perf_table,'input',2,'NBig','trimf',[-1 0 1]);
perf_table = addmf(perf_table,'input',2,'NSBig','trimf',[0 1 2]);
perf_table = addmf(perf_table,'input',2,'SBig','trimf',[1 2 3]);
perf_table = addmf(perf_table,'input',2,'MBig','trimf',[2 3 4]);
perf_table = addmf(perf_table,'input',2,'MMBig','trimf',[3 4 10]);
perf_table = addvar(perf_table,'output','performance_index',[-4 4]);
for i=-4:4
    perf_table = addmf(perf_table,'output',1,strcat("output",num2str(i)),'constant',i);

end


% rule 1: If error is NSmall and change in error is NSmall, then performance index is -4
perf_table = addrule(perf_table, [1 1 1 1 1]);

% rule 2: If error is NSmall and change in error is Small, then performance index is -3
perf_table = addrule(perf_table, [1 2 1 1 1]);

% rule 3: If error is NSmall and change in error is Medium, then performance index is -2
perf_table = addrule(perf_table, [1 3 1 1 1]);

% rule 4: If error is NSmall and change in error is Big, then performance index is -1
perf_table = addrule(perf_table, [1 4 1 1 1]);

% rule 5: If error is Small and change in error is NSmall, then performance index is -3
perf_table = addrule(perf_table, [1 5 1 1 1]);

% rule 6: If error is Small and change in error is Small, then performance index is -2
perf_table = addrule(perf_table, [1 6 2 1 1]);

% rule 7: If error is Small and change in error is Medium, then performance index is -1
perf_table = addrule(perf_table, [1 7 3 1 1]);
perf_table = addrule(perf_table, [1 8 4 1 1]);
perf_table = addrule(perf_table, [1 9 5 1 1]);

perf_table = addrule(perf_table, [2 1 1 1 1]);
perf_table = addrule(perf_table, [2 2 1 1 1]);
perf_table = addrule(perf_table, [2 3 2 1 1]);
perf_table = addrule(perf_table, [2 4 2 1 1]);
perf_table = addrule(perf_table, [2 5 2 1 1]);
perf_table = addrule(perf_table, [2 6 2 1 1]);
perf_table = addrule(perf_table, [2 7 4 1 1]);
perf_table = addrule(perf_table, [2 8 5 1 1]);
perf_table = addrule(perf_table, [2 9 6 1 1]);

% rule 8: If error is Small and change in error is Big, then performance index is 0
perf_table = addrule(perf_table, [2 4 2 4 1]);
perf_table = addrule(perf_table,ruleList);

