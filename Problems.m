%% Problems
%% P2.1 Generate sequences
% ----------------------------------------------------------------------------
% 1. x1(n) = 3delta(n+2) + 2delta(n) - delta(n-3) + 5delta(n-7), -5<=n<=15
n = [-5:15];
x1 = 3*impseq(-2,-5,15)+2*impseq(0,-5,15)-impseq(3,-5,15)+5*impseq(7,-5,15);
subplot(4,2,1);stem(n,x1);
xlabel('n'),ylabel('x1(n)');
title('P2.1-1: x1(n)');

% 2. x2(n) = sum(exp(-|k|)delta(n-2k)), -10<=n<=10
% % method 1:
% n = [-10:10];
% x2 = zeros(size(n));
% for k=-5:5
%     x2 = x2 + exp(-abs(k))*impseq(2*k,-10,10);
% end
% subplot(4,2,2);stem(n,x2);
% xlabel('n'),ylabel('x2(n)');
% title('P2.1-2: x2(n)');
% method 2:
n = -10:10; k = -5:5;
x2 = exp(-abs(k))*impseq(2*k',-10,10);
subplot(4,2,2);stem(n,x2);
xlabel('n'),ylabel('x2(n)');
title('P2.1-2: x2(n)');

% 3. x3(n) = 10u(n)-5u(n-5)-10u(n-10)-5u(n-15)
% method 1:
n = -5:20;
x3 = 10*stepseq(0,-5,20)-5*stepseq(5,-5,20)-10*stepseq(10,-5,20)+5*stepseq(15,-5,20);
subplot(4,2,3);stem(n,x3);
xlabel('n'),ylabel('x3(n)');
title('P2.1-3: x3(n)');

% 4. x4(n) = exp(0.1n)[u(n+20)-u(n-10)]
n = -25:15;
x4 = exp(0.1*n).*(stepseq(-20,-25,15)-stepseq(10,-25,15));
subplot(4,2,4);stem(n,x4);
xlabel('n'),ylabel('x4(n)');
title('P2.1-4: x4(n)');

% 5. comment on the waveform shape
% x5(n) = 5[cos(0.49*pi*n)+cos(0.51*pi*n)],-200<=n<=200
n = -200:200;
x5 = 5*(cos(0.49*pi*n)+cos(0.51*pi*n));
waveshape = abs(x5);
subplot(4,2,5);stem(n,waveshape);
xlabel('n'),ylabel('waveform shape');
title('P2.1-5: abs(x5(n))');

% 6. comment on the waveform shape
% x6(n) = 2sin(0.01*pi*n)cos(0.5*pi*n),-200<=n<=200
n = -200:200;
x6 = 2*sin(0.01*pi*n).*cos(0.5*pi*n);
waveshape = abs(x6);
subplot(4,2,6);stem(n,waveshape);
xlabel('n'),ylabel('waveform shape');
title('P2.1-6: abs(x6(n))');

% 7. comment on the waveform shape
% x7(n) = exp(-0.05n)sin(0.1*pi*n+pi/3),0<=n<=100
n = 0:100;
x7 = exp(-0.05*n).*sin(0.1*pi*n+pi/3);
waveshape = abs(x7);
subplot(4,2,7);stem(n,waveshape);
xlabel('n'),ylabel('waveform shape');
title('P2.1-7: abs(x7(n))');

% 8. comment on the waveform shape
% x8(n) = exp(0.01n)sin(0.1*pi*n),0<=n<=100
n = 0:100;
x8 = exp(0.01*n).*sin(0.1*pi*n);
waveshape = abs(x8);
subplot(4,2,8);stem(n,waveshape);
xlabel('n'),ylabel('waveform shape');
title('P2.1-8: abs(x8(n))');

%% P2.2 Generate random sequences







