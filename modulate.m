function y = modulate(b)
% Modulates a bitsequence 'b' into frequencies

% Initial bitsequence 'b'
fields  = load('data.mat');
tau0 = fields.tau0;
tau1 = fields.tau1;
tauS = fields.tauS;

% Repeated bitsequence 'b_t'
t = linspace(1, tauS*length(b), tauS*length(b));
b_t = repelem(b, tauS);

% 0-frequency modulation 'x1_t'
x1_t = [];
for i = [1:length(t)]
    if b_t(i) == 0
        x1_t(i) = cos(2*pi*t(i)/tau0);
    else 
        x1_t(i) = 0;
    end
end

% 1-frequency modulation  'x2_t'
x2_t = [];
for i = [1:length(t)]
    if b_t(i) == 1
        x2_t(i) = cos(2*pi*t(i)/tau1);
    else 
        x2_t(i) = 0;
    end
end

% Combined modulation 'y_t'
y_t = x1_t + x2_t;


y = y_t;