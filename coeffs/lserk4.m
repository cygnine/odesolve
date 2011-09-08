function[coeffs] = lserk4()
% lserk4 -- returns coefficients for the lserk4 method
%
% coeffs = lserk4()
%
%     Returns the Butcher tableau and other relevant information about the
%     Low-storage SSP method for time-stepping (4th order). Returns information
%     as a struct.

a = [0 ...
    -567301805773/1357537059087 ...
    -2404267990393/2016746695238 ...
    -3550918686646/2091501179385 ...
    -1275806237668/842570457699];

b = [1432997174477/9575080441755 ...
    5161836677717/13612068292357 ...
    1720146321549/2090206949498 ...
    3134564353537/4481467310338 ...
    2277821191437/14882151754819];

c = [ 0.0 ...
    1432997174477.0/9575080441755.0 ...
    2526269341429.0/6820363962896.0 ...
    2006345519317.0/3224310063776.0 ...
    2802321613138.0/2924317926251.0 ...
    1.0];

p = 5;

[coeffs.a, coeffs.b, coeffs.c, coeffs.p] = deal(a,b,c,p);

% Implementation:
% while t<T;
%   ku = zeros(size(u));
%   stage_time = t;
%   if t+dt>T;
%     dt = T - t;
%   end
% 
%   % RK stages
%   for p = 1:length(rk.rka);
%     stage_time = t + dt*rk.rkc(p);
%     make_rhs;
%     ku = rk.rka(p)*ku + dt*urhs;
%     u = u + rk.rkb(p)*ku;
% 
%   end
% 
%   % Update time, iteration count
%   t = t+dt;
%   niter = niter+1;
%   ts(niter) = t;
% end
