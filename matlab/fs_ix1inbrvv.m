% Required for ssxmb - core rear part
syms x z bb zmax hb xmin0 xmin real

psi1(x)=zmax-hb+hb*((-x^2+2*xmin0*x+xmin^2-2*xmin0*xmin)*(xmin0-xmin)^(-2))^0.5;

fi2r(x,z)=0.5*bb*((-z^2+2*(zmax-hb)*z-zmax*(zmax-2*hb))*hb^(-2)+(-x^2+2*xmin0*x+xmin^2-2*xmin0*xmin)*(xmin0-xmin)^(-2)-1);
% step 1 - fi2r to surface area
nbr(x,z) = simplify(sqrt(diff(fi2r, x)^2 + diff(fi2r, z)^2 + 1));
% integrate symbolically over z
inbr(x,z)=int(nbr(x,z),z);
inbrn(x)=simplify(inbr(x, psi1(x)) - inbr(x, zmax-hb));

inbrnv(x) = (hb*((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin - xmin0)^2 - (bb^2*(x - xmin)*(x + xmin - 2*xmin0))/hb^2)^(1/2)*(-(x - xmin)*(x + xmin - 2*xmin0))^(1/2))/(2*(xmin - xmin0)^2) + (hb^2*log((hb*((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin - xmin0)^2 - (bb^2*(x - xmin)*(x + xmin - 2*xmin0))/hb^2)^(1/2) + abs(bb)*(-(x - xmin)*(x + xmin - 2*xmin0))^(1/2))/(hb*abs(xmin - xmin0)))*(bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4))/(2*abs(bb)*(xmin - xmin0)^4) - (hb^2*log((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin - xmin0)^4)*(bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4))/(4*abs(bb)*(xmin - xmin0)^4);
 

% integrant for sxmb, body, rear
x1inbrn(x) = simplify(x * inbrn(x));

% from cmd
x1inbrnve(x) = x*((hb*((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin - xmin0)^2 - (bb^2*(x - xmin)*(x + xmin - 2*xmin0))/hb^2)^(1/2)*(-(x - xmin)*(x + xmin - 2*xmin0))^(1/2))/(2*(xmin - xmin0)^2) + (hb^2*log((hb*((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin - xmin0)^2 - (bb^2*(x - xmin)*(x + xmin - 2*xmin0))/hb^2)^(1/2) + abs(bb)*(-(x - xmin)*(x + xmin - 2*xmin0))^(1/2))/(hb*abs(xmin - xmin0)))*(bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4))/(2*abs(bb)*(xmin - xmin0)^4) - (hb^2*log((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin - xmin0)^4)*(bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4))/(4*abs(bb)*(xmin - xmin0)^4));