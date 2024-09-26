%% Example 2.1
%% a. implements x(n)=2*delta(n+2)-delta(n-4), -5<=n<=5
n1 = -5;
n2 = 5;
n = [n1:n2];
n01 = -2;
[x1,x1n] = impseq(n01, n1 ,n2);
n02 = 4;
[x2,x2n] = impseq(n02, n1,n2);
x = sigadd(2*x1,x1n,-1*x2,x2n);

% [x1, n1] = impseq(-2, -5, 5);
% [x2, n2] = impseq(4, -5, 5);
% x = sigadd(2*x1,n1,-1*x2,n2);

% plot x(n)
stem(n,x); title('Sequence in Problem 2.1a')
xlabel('n'); ylabel('x(n)');

%% b. implements x(n)=n[u(n)-u(n-10)] + 10exp(-0.3(n-10))[u(n-10)-u(n-20)] 0<=n<=20
n = [0:20];
x1 = n.*(stepseq(0,0,20)-stepseq(10,0,20));
x2 = 10*exp(-0.3*(n-10)).*(stepseq(10,0,20)-stepseq(20,0,20));
x = x1 + x2;
% plot x(n)
stem(n,x); title('Sequence in Problem 2.1b')
xlabel('n'); ylabel('x(n)');
%% c. implements x(n)=cos(0.04*pi*n) + 0.2w(n) 0<=n<=50
n = [0: 50];
x = cos(0.04*pi*n) + 0.2*randn(size(n));
% plot x(n)
stem(n,x); title('Sequence in Problem 2.1c')
xlabel('n'); ylabel('x(n)');
%% d. implements x(n)={...,5,4,3,2,1,5,4,3,2,1,5,4,3,2,1,...} -10<=n<=9
n = [-10: 9];
x = [5,4,3,2,1];
xtilde = x' * ones(1, 4);
xtilde = (xtilde(:))';
% plot x(n)
stem(n,xtilde); title('Sequence in Problem 2.1d')
xlabel('n'); ylabel('xtilde(n)');

%% -----------------------------------------------------------------------

%% Example 2.2
% x(n) = {1,2,3,4,5,6,7,6,5,4,3,2,1}, -2<=n<=10
%% a. implements x1(n) = 2x(n-5)-3x(n+4)
x = [1:1:7,6:-1:1];
n = -2: 10;
[x11, n11] = sigshift(x,n,5);
[x12, n12] = sigshift(x,n,-4);
[x1, n1] = sigadd(2*x11,n11,-3*x12,n12);
% plot x(n)
stem(n1,x1); title('Sequence in Problem 2.2a')
xlabel('n'); ylabel('x1(n)');

%% b. implements x2(n) = x(3-n)+ x(n)x(n-2)
x = [1:1:7,6:-1:1];
n = -2: 10;
[x21,n21] = sigfold(x,n);
[x21,n21] = sigshift(x21,n21,3);
[x22,n22] = sigshift(x,n,2);
[x22,n22] = sigmult(x,n,x22,n22);
[x2,n2] = sigadd(x21,n21,x22,n22);
% plot x(n)
stem(n2,x2); title('Sequence in Problem 2.2b')
xlabel('n'); ylabel('x2(n)');

%% Example 2.3 
% x(n) = exp((-0.1+j*0.3)n), -10<=n<=10
% plot magnitude, phase, the real part, and the imaginary part 
n = -10: 10;
x = exp((-0.1+j*0.3)*n);
% shizhi
subplot(2,2,1);
stem(n, real(x));
title('real part');
xlabel('n');

subplot(2,2,2);
stem(n, imag(x));
title('imagninary part');
xlabel('n');

subplot(2,2,3);
stem(n, abs(x));
title('magnitude part');
xlabel('n');

subplot(2,2,4);
stem(n, angle(x)*(180/pi));
title('phase part');
xlabel('n');

%% Example 2.4
% x(n) = u(n)-u(n-10), decompose x(n) into even and odd components
n = [0:10];
x = stepseq(0,0,10) - stepseq(10,0,10);
[xe,xo,m] = evenodd(x,n);

subplot(2,2,1);
stem(n,x);
title("Rectangulatr pulse");
xlabel('n'); ylabel('xe(n)'); axis([-10,10,0,1.2]);

subplot(2,2,2);
stem(m,xe);
title('Even part');
xlabel('n'); ylabel('xe(n)'); axis([-10,10,0,1.2]);

subplot(2,2,4);
stem(m,xo);
title('Odd part');
xlabel('n'); ylabel('xo(n)');axis([-10,10,-0.6,0.6]);

%% Example 2.10 implements crosscorrelation operator
% x(n) = [3,11,7,0,-1,4,2]; nx=[-3:3];
% y(n) = x(n-2) + w(n); w(n) is Gaussian with mean 0 and variance 1 

% noise sequence 1
x = [3,11,7,0,-1,4,2]; nx=[-3:3];
[y,ny] = sigshift(x, nx, 2);
y = y + randn(size(ny));
[x, nx] = sigfold(x, nx);
[rxy, nrxy] = conv_m(x,nx,y,ny);

subplot(3,1,1);
stem(nrxy,rxy);
axis([-5,10,-50,250]);
xlabel('lag variable l'); ylabel('rxy');
title('Crosscorrelation: noise sequence 1');

% noise sequence 2
x = [3,11,7,0,-1,4,2]; nx=[-3:3];
[y,ny] = sigshift(x, nx, 2);
w = randn(size(ny)); nw = ny;
[y,ny] = sigadd(y,ny,w,nw);
% y = y + randn(size(ny));
[x, nx] = sigfold(x, nx);
[rxy, nrxy] = conv_m(x,nx,y,ny);
subplot(3,1,2);
stem(nrxy,rxy);
axis([-5,10,-50,250]);
xlabel('lag variable l'); ylabel('rxy');
title('Crosscorrelation: noise sequence 2');

% sequence correlation computation in matlab called xcorr
% rxy = xcorr(x,y);
% rxx = xcorr(x);
% [rxy,lags_xy] = xcorr(x,y);
% [rxx,lags_xx] = xcorr(x);

%% Example 2.11 solve difference equation
% y(n) - y(n-1) + 0.9y(n-2) = x(n)
% -------------------------------------------
% a. calculate and plot the impulse response h(n) at n=[-20:100]
n = [-20: 100];
b = [1];
a = [1, -1, 0.9];
h = impz(b, a, n);
subplot(2,1,1); stem(n,h);
title('Impulse Response'); xlabel('n'); ylabel('h(n)');
% b. calculate and plot the unit step response s(n) at n=[-20:100]
x = stepseq(0,-20,100);
s = filter(b,a,x);
subplot(2,1,2); stem(n,s);
title('Step Response'); xlabel('n'); ylabel('s(n)');
% c. Is the system specified by h(n) stabel?
sum(abs(h)); %implies the system is stable
z = roots(a); magz = abs(z); % altenate approach: using stability condition(magz<1)

%% Example 2.12 Convolution computation with filter for one of signal sequence is infinite
% x(n) = u(n) - u(n-10)
% h(n) = (0.9)^n*u(n)
% determine y(n) = x(n)*h(n)
% step 1: h(n)-(0.9)h(n-1) = delta(n)
% step 2: y(n)-(0.9)y(n-1) = x(n)*(h(n)-(0.9)h(n-1)) = x(n) (LTI)
b = [1];
a = [1, -0.9];
n = -5:50;
x = stepseq(0,-5,50) - stepseq(10,-5,50);
y = filter(b,a,x);
subplot(2,1,2); stem(n,y);title('Output sequence');
xlabel('n');ylabel('y(n)');axis([-5,50,-0.5,8]);













