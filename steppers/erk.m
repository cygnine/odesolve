function[yn] = erk(coeffs, dt, f, t, y)
% erk -- Single time-step of an explicit Runge-Kutta method
%
% yn = erk(coeffs, dt, f, t, y)
%
%    Takes a single time step using the explicit RK solver defined by the
%    Butcher tableau coefficients coeffs. The equation is
%
%    y' = f(t,y)
%
%    Therefore f is a function handle accepting two arguments (t,y).

persistent ks temp yn
if isempty(ks)
  ys = cell([coeffs.p 1]);
  temp = zeros(size(y));
  yn = zeros(size(y));
end

ts = t + coeffs.local_times;
yn = y;

for q = 1:coeffs.p;

  temp = y;
  for qq = 1:(coeffs.p-1);
    temp = temp + coeffs.a(q, qq)*ks{qq}*dt;
  end

  ks{q} = f(ts(q), temp);
  
  yn = yn + coeffs.b(q)*ks{q};
end
