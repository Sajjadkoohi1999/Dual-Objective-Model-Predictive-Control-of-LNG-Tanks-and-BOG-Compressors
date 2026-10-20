function J= objFunc(p)
global QQ1 QQ2 Yp
[T,Xp,Yp,J] = solveModel(p);
%Add control effort to the objectibve function
du=sum((diff(p).^2));
J=J+QQ2*du;
end