% Define the initial state of the system
state = [0; 0; pi/4; 0];

% Define the mass of the cart (M) and pendulum (m)
M = 1;
m = 0.1;

% Define the length of the pendulum (L)
L = 1;

% Define the time step (dt) and the number of steps (n)
dt = 0.01;
n = 182;

% Loop through the number of steps
for i = 1:n
    % Update the state of the system using your dynamics equations
    % Draw the pendulum in its current position

    drawpend([0,0,y(i,1),0], m, M, 2);

    % Pause for a short time to create animation
    pause(0.01);
end