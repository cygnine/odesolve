function[odesolve] = init__()
% init__ -- Initialization file for odesolve package
%
% [nodes] = init__()

module_list = {'coeffs', 'steppers', 'solvers'};
%odesolve = recurse_files(pwd, module_list);

odesolve.module_list = module_list;
odesolve.recurse_files = true;
odesolve.addpaths = {};
