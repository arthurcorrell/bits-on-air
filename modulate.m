function y = modulate(b)
%
load('data.mat');
subplot(5,1,1);
plot(b,'.');
t = linspace(0, tauS*length(b)-1, tauS*length(b))
b_t = [];
for i = [1:length(b)]
    for j = [1:tauS]
        b_t = [b_t b(i)];
    end
end
subplot(5,1,2);
plot(b_t,'.');
y_t = [];
%for i = [0:length(t)]
%    y_t(i) = cos(2*pi*(1/tau1*b_t(i) + 1/tau0*(1-b_t(i)))*t(i))*
