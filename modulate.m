function y = modulate(b)
%
load('data.mat');
subplot(5,1,1);
plot(b,'.');
t = linspace(1, tauS*length(b), tauS*length(b));
b_t = [];
for i = [1:length(b)]
    for j = [1:tauS]
        b_t = [b_t b(i)];
    end
end
subplot(5,1,2);
plot(b_t,'.');
x1_t = [];
for i = [1:length(t)]
    if b_t(i) == 0
        x1_t(i) = cos(2*pi*t(i)/tau0);
    else 
        x1_t(i) = 0;
    end
end
subplot(5,1,3);
plot(x1_t);
x2_t = [];
for i = [1:length(t)]
    if b_t(i) == 1
        x2_t(i) = cos(2*pi*t(i)/tau1);
    else 
        x2_t(i) = 0;
    end
end
subplot(5,1,4);
plot(x2_t);
y_t = x1_t + x2_t;
subplot(5,1,5);
plot(y_t);