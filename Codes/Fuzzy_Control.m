clc
clear

[t0,y]=ode23('inverted',[0 3],[0.5 0 0])
% while t < 1
%     [~, x] = ode45(@inverted, [t, t+0.01], [0.5 0 0]);
%     var(end+1) = pref; % replace x(3) with the variable you want to save
%     x0 = x(end,:);
%     t = t + dt;
% end
subplot(2,1,1),plot(t0,y(:,1)) % for e
ylabel ('Angular position (rad)')
subplot(2,1,2),plot(t0,y(:,3)) % for u
ylabel ('Input force (N)')
