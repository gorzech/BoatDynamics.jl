# fi2r(x,z)=0.5*bb*((-z^2+2*(zmax-hb)*z-zmax*(zmax-2*hb))*hb^(-2)+(-x^2+2*xmin0*x+xmin^2-2*xmin0*xmin)*(xmin0-xmin)^(-2)-1);
# fi1r(x,z)=-0.5*bb*((-z^2+2*(zmax-hb)*z-zmax*(zmax-2*hb))*hb^(-2)+(-x^2+2*xmin0*x+xmin^2-2*xmin0*xmin)*(xmin0-xmin)^(-2)-1);

# fi2m(x,z)=0.5*bb*((-z^2+2*(zmax-hb)*z-zmax*(zmax-2*hb))*hb^(-2));
# fi1m(x,z)=-0.5*bb*((-z^2+2*(zmax-hb)*z-zmax*(zmax-2*hb))*hb^(-2));

# fi2f(x,z)=0.5*bb*((-z^2+2*(zmax-hb)*z-zmax*(zmax-2*hb))*hb^(-2)+(-x^2+2*xmax0*x+xmax^2-2*xmax0*xmax)*(xmax-xmax0)^(-2)-1);
# fi1f(x,z)=-0.5*bb*((-z^2+2*(zmax-hb)*z-zmax*(zmax-2*hb))*hb^(-2)+(-x^2+2*xmax0*x+xmax^2-2*xmax0*xmax)*(xmax-xmax0)^(-2)-1);

# psi1(x)=zmax-hb+hb*((-x^2+2*xmin0*x+xmin^2-2*xmin0*xmin)*(xmin0-xmin)^(-2))^0.5;
# psi2(x)=zmax-hb+hb*((-x^2+2*xmax0*x+xmax^2-2*xmax0*xmax)*(xmax-xmax0)^(-2))^0.5;

# nbf(x,z)=(1+0.25*bb^2*(((-2*z+2*(zmax-hb))*hb^(-2))^2+((-2*x+2*xmax0)*(xmax-xmax0)^(-2))^2))^0.5;
# nbm(z)=(1+0.25*bb^2*((-2*z+2*(zmax-hb))*hb^(-2))^2)^0.5;
# nbr(x,z)=(1+0.25*bb^2*(((-2*z+2*(zmax-hb))*hb^(-2))^2+((-2*x+2*xmin0)*(xmin0-xmin)^(-2))^2))^0.5;
# inbm(z)=int(nbm(z),z);
# inbmv(z)=(((bb^2*(2*hb + 2*z - 2*zmax)^2)/(4*hb^4) + 1)^(1/2)*(2*hb + 2*z - 2*zmax))/4 + asinh(((bb^2/hb^4)^(1/2)*(2*hb + 2*z - 2*zmax))/2)/(2*(bb^2/hb^4)^(1/2));

# inbf(x,z)=int(nbf(x,z),z);

# inbfv(x,z)=(((bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)/(xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4) + (bb^2*(2*hb + 2*z - 2*zmax)^2)/(4*hb^4))^(1/2)*(2*hb + 2*z - 2*zmax))/4 + (log(((bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)/(xmax - xmax0)^4 + (bb^2*(hb + z - zmax)^2)/hb^4)^(1/2) + (bb^2/hb^4)^(1/2)*(hb + z - zmax))*(bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4))/(4*(bb^2/(4*hb^4))^(1/2)*(xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4));
# inbr(x,z)=int(nbr(x,z),z);
# inbrv(x,z)=(((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4) + (bb^2*(2*hb + 2*z - 2*zmax)^2)/(4*hb^4))^(1/2)*(2*hb + 2*z - 2*zmax))/4 + (log(((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin - xmin0)^4 + (bb^2*(hb + z - zmax)^2)/hb^4)^(1/2) + (bb^2/hb^4)^(1/2)*(hb + z - zmax))*(bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4))/(4*(bb^2/(4*hb^4))^(1/2)*(xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4));
# inbfn(x)=inbf(x,psi2(x))-inbf(x,zmax-hb);
# inbfnv(x)=(hb*((bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)/(xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4) + (bb^2*(- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax))/(hb^2*(xmax - xmax0)^2))^(1/2)*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))/2 + (log(((bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)/(xmax - xmax0)^4 + (bb^2*(- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax))/(hb^2*(xmax - xmax0)^2))^(1/2) + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)*(bb^2/hb^4)^(1/2))*(bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4))/(4*(bb^2/(4*hb^4))^(1/2)*(xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)) - (log(((bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)/(xmax - xmax0)^4)^(1/2))*(bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4))/(4*(bb^2/(4*hb^4))^(1/2)*(xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4));
const xgle0 = -0.973906528515625
const xgle1 = -0.8650633666406251
const xgle2 = -0.6794095683593748
const xgle3 = -0.433395394140625
const xgle4 = -0.1488743390625
const xgle5 = 0.1488743390625
const xgle6 = 0.433395394140625
const xgle7 = 0.6794095683593748
const xgle8 = 0.8650633666406251
const xgle9 = 0.973906528515625
const gle0 = 6.667134434535385E-002
const gle1 = 0.1494513491066249
const gle2 = 0.2190863624861139
const gle3 = 0.2692667192861255
const gle4 = 0.2955242247757779
const gle5 = 0.2955242247757832
const gle6 = 0.2692667192861259
const gle7 = 0.2190863624861151
const gle8 = 0.1494513491066215
const gle9 = 6.667134434536157E-002
const xf0 = 0.5 * (xmax0 + xmax) + 0.5 * (xmax - xmax0) * xgle0
const xf1 = 0.5 * (xmax0 + xmax) + 0.5 * (xmax - xmax0) * xgle1
const xf2 = 0.5 * (xmax0 + xmax) + 0.5 * (xmax - xmax0) * xgle2
const xf3 = 0.5 * (xmax0 + xmax) + 0.5 * (xmax - xmax0) * xgle3
const xf4 = 0.5 * (xmax0 + xmax) + 0.5 * (xmax - xmax0) * xgle4
const xf5 = 0.5 * (xmax0 + xmax) + 0.5 * (xmax - xmax0) * xgle5
const xf6 = 0.5 * (xmax0 + xmax) + 0.5 * (xmax - xmax0) * xgle6
const xf7 = 0.5 * (xmax0 + xmax) + 0.5 * (xmax - xmax0) * xgle7
const xf8 = 0.5 * (xmax0 + xmax) + 0.5 * (xmax - xmax0) * xgle8
const xf9 = 0.5 * (xmax0 + xmax) + 0.5 * (xmax - xmax0) * xgle9
# xm0=0.5*(xmax0+xmin0)+0.5*(xmax0-xmin0)*xgle0;
# xm1=0.5*(xmax0+xmin0)+0.5*(xmax0-xmin0)*xgle1;
# xm2=0.5*(xmax0+xmin0)+0.5*(xmax0-xmin0)*xgle2;
# xm3=0.5*(xmax0+xmin0)+0.5*(xmax0-xmin0)*xgle3;
# xm4=0.5*(xmax0+xmin0)+0.5*(xmax0-xmin0)*xgle4;
# xm5=0.5*(xmax0+xmin0)+0.5*(xmax0-xmin0)*xgle5;
# xm6=0.5*(xmax0+xmin0)+0.5*(xmax0-xmin0)*xgle6;
# xm7=0.5*(xmax0+xmin0)+0.5*(xmax0-xmin0)*xgle7;
# xm8=0.5*(xmax0+xmin0)+0.5*(xmax0-xmin0)*xgle8;
# xm9=0.5*(xmax0+xmin0)+0.5*(xmax0-xmin0)*xgle9;
const xr0 = 0.5 * (xmin0 + xmin) + 0.5 * (xmin0 - xmin) * xgle0
const xr1 = 0.5 * (xmin0 + xmin) + 0.5 * (xmin0 - xmin) * xgle1
const xr2 = 0.5 * (xmin0 + xmin) + 0.5 * (xmin0 - xmin) * xgle2
const xr3 = 0.5 * (xmin0 + xmin) + 0.5 * (xmin0 - xmin) * xgle3
const xr4 = 0.5 * (xmin0 + xmin) + 0.5 * (xmin0 - xmin) * xgle4
const xr5 = 0.5 * (xmin0 + xmin) + 0.5 * (xmin0 - xmin) * xgle5
const xr6 = 0.5 * (xmin0 + xmin) + 0.5 * (xmin0 - xmin) * xgle6
const xr7 = 0.5 * (xmin0 + xmin) + 0.5 * (xmin0 - xmin) * xgle7
const xr8 = 0.5 * (xmin0 + xmin) + 0.5 * (xmin0 - xmin) * xgle8
const xr9 = 0.5 * (xmin0 + xmin) + 0.5 * (xmin0 - xmin) * xgle9
# inbfvx0=inbfnv(xf0);
# inbfvx1=inbfnv(xf1);
# inbfvx2=inbfnv(xf2);
# inbfvx3=inbfnv(xf3);
# inbfvx4=inbfnv(xf4);
# inbfvx5=inbfnv(xf5);
# inbfvx6=inbfnv(xf6);
# inbfvx7=inbfnv(xf7);
# inbfvx8=inbfnv(xf8);
# inbfvx9=inbfnv(xf9);
# iinbfvv=0.5*(xmax-xmax0)*(inbfvx0*gle0+inbfvx1*gle1+inbfvx2*gle2+inbfvx3*gle3+inbfvx4*gle4+inbfvx5*gle5+inbfvx6*gle6+inbfvx7*gle7+inbfvx8*gle8+inbfvx9*gle9);
# x1inbfnv(x)=x*inbfnv(x);
x1inbfnve(x) = x * ((hb * ((bb^2 * x^2 - 2 * bb^2 * x * xmax0 + bb^2 * xmax0^2 + xmax^4 - 4 * xmax^3 * xmax0 + 6 * xmax^2 * xmax0^2 - 4 * xmax * xmax0^3 + xmax0^4) / (xmax^4 - 4 * xmax^3 * xmax0 + 6 * xmax^2 * xmax0^2 - 4 * xmax * xmax0^3 + xmax0^4) + (bb^2 * (-x^2 + 2 * xmax0 * x + xmax^2 - 2 * xmax0 * xmax)) / (hb^2 * (xmax - xmax0)^2))^(1 / 2) * ((-x^2 + 2 * xmax0 * x + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2)) / 2 + (log(((bb^2 * x^2 - 2 * bb^2 * x * xmax0 + bb^2 * xmax0^2 + xmax^4 - 4 * xmax^3 * xmax0 + 6 * xmax^2 * xmax0^2 - 4 * xmax * xmax0^3 + xmax0^4) / (xmax - xmax0)^4 + (bb^2 * (-x^2 + 2 * xmax0 * x + xmax^2 - 2 * xmax0 * xmax)) / (hb^2 * (xmax - xmax0)^2))^(1 / 2) + hb * ((-x^2 + 2 * xmax0 * x + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2) * (bb^2 / hb^4)^(1 / 2)) * (bb^2 * x^2 - 2 * bb^2 * x * xmax0 + bb^2 * xmax0^2 + xmax^4 - 4 * xmax^3 * xmax0 + 6 * xmax^2 * xmax0^2 - 4 * xmax * xmax0^3 + xmax0^4)) / (4 * (bb^2 / (4 * hb^4))^(1 / 2) * (xmax^4 - 4 * xmax^3 * xmax0 + 6 * xmax^2 * xmax0^2 - 4 * xmax * xmax0^3 + xmax0^4)) - (log(((bb^2 * x^2 - 2 * bb^2 * x * xmax0 + bb^2 * xmax0^2 + xmax^4 - 4 * xmax^3 * xmax0 + 6 * xmax^2 * xmax0^2 - 4 * xmax * xmax0^3 + xmax0^4) / (xmax - xmax0)^4)^(1 / 2)) * (bb^2 * x^2 - 2 * bb^2 * x * xmax0 + bb^2 * xmax0^2 + xmax^4 - 4 * xmax^3 * xmax0 + 6 * xmax^2 * xmax0^2 - 4 * xmax * xmax0^3 + xmax0^4)) / (4 * (bb^2 / (4 * hb^4))^(1 / 2) * (xmax^4 - 4 * xmax^3 * xmax0 + 6 * xmax^2 * xmax0^2 - 4 * xmax * xmax0^3 + xmax0^4)))
const x1inbfvx0 = x1inbfnve(xf0)
const x1inbfvx1 = x1inbfnve(xf1)
const x1inbfvx2 = x1inbfnve(xf2)
const x1inbfvx3 = x1inbfnve(xf3)
const x1inbfvx4 = x1inbfnve(xf4)
const x1inbfvx5 = x1inbfnve(xf5)
const x1inbfvx6 = x1inbfnve(xf6)
const x1inbfvx7 = x1inbfnve(xf7)
const x1inbfvx8 = x1inbfnve(xf8)
const x1inbfvx9 = x1inbfnve(xf9)
const ix1inbfvv = 0.5 * (xmax - xmax0) * (x1inbfvx0 * gle0 + x1inbfvx1 * gle1 + x1inbfvx2 * gle2 + x1inbfvx3 * gle3 + x1inbfvx4 * gle4 + x1inbfvx5 * gle5 + x1inbfvx6 * gle6 + x1inbfvx7 * gle7 + x1inbfvx8 * gle8 + x1inbfvx9 * gle9)

# x2inbfnv(x)=x^2*inbfnv(x);
# x2inbfnve(x)=x^2*((hb*((bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)/(xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4) + (bb^2*(- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax))/(hb^2*(xmax - xmax0)^2))^(1/2)*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))/2 + (log(((bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)/(xmax - xmax0)^4 + (bb^2*(- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax))/(hb^2*(xmax - xmax0)^2))^(1/2) + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)*(bb^2/hb^4)^(1/2))*(bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4))/(4*(bb^2/(4*hb^4))^(1/2)*(xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)) - (log(((bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)/(xmax - xmax0)^4)^(1/2))*(bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4))/(4*(bb^2/(4*hb^4))^(1/2)*(xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)));
# x2inbfvx0=x2inbfnve(xf0);
# x2inbfvx1=x2inbfnve(xf1);
# x2inbfvx2=x2inbfnve(xf2);
# x2inbfvx3=x2inbfnve(xf3);
# x2inbfvx4=x2inbfnve(xf4);
# x2inbfvx5=x2inbfnve(xf5);
# x2inbfvx6=x2inbfnve(xf6);
# x2inbfvx7=x2inbfnve(xf7);
# x2inbfvx8=x2inbfnve(xf8);
# x2inbfvx9=x2inbfnve(xf9);
# ix2inbfvv=0.5*(xmax-xmax0)*(x2inbfvx0*gle0+x2inbfvx1*gle1+x2inbfvx2*gle2+x2inbfvx3*gle3+x2inbfvx4*gle4+x2inbfvx5*gle5+x2inbfvx6*gle6+x2inbfvx7*gle7+x2inbfvx8*gle8+x2inbfvx9*gle9);

# inbrn(x)=inbr(x,psi1(x))-inbr(x,zmax-hb);
# inbrnv(x)=(hb*((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4) + (bb^2*(- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin))/(hb^2*(xmin - xmin0)^2))^(1/2)*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))/2 + (log(((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin - xmin0)^4 + (bb^2*(- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin))/(hb^2*(xmin - xmin0)^2))^(1/2) + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)*(bb^2/hb^4)^(1/2))*(bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4))/(4*(bb^2/(4*hb^4))^(1/2)*(xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)) - (log(((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin - xmin0)^4)^(1/2))*(bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4))/(4*(bb^2/(4*hb^4))^(1/2)*(xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4));
# inbrvx0=inbrnv(xr0);
# inbrvx1=inbrnv(xr1);
# inbrvx2=inbrnv(xr2);
# inbrvx3=inbrnv(xr3);
# inbrvx4=inbrnv(xr4);
# inbrvx5=inbrnv(xr5);
# inbrvx6=inbrnv(xr6);
# inbrvx7=inbrnv(xr7);
# inbrvx8=inbrnv(xr8);
# inbrvx9=inbrnv(xr9);
# iinbrvv=0.5*(xmin0-xmin)*(inbrvx0*gle0+inbrvx1*gle1+inbrvx2*gle2+inbrvx3*gle3+inbrvx4*gle4+inbrvx5*gle5+inbrvx6*gle6+inbrvx7*gle7+inbrvx8*gle8+inbrvx9*gle9);
# x1inbrnv(x)=x*inbrnv(x);
x1inbrnve(x) = x * (hb * ((bb^2 * x^2 - 2 * bb^2 * x * xmin0 + bb^2 * xmin0^2 + xmin^4 - 4 * xmin^3 * xmin0 + 6 * xmin^2 * xmin0^2 - 4 * xmin * xmin0^3 + xmin0^4) / (xmin^4 - 4 * xmin^3 * xmin0 + 6 * xmin^2 * xmin0^2 - 4 * xmin * xmin0^3 + xmin0^4) + (bb^2 * (-x^2 + 2 * xmin0 * x + xmin^2 - 2 * xmin0 * xmin)) / (hb^2 * (xmin - xmin0)^2))^(1 / 2) * ((-x^2 + 2 * xmin0 * x + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2)) / 2 + (log(((bb^2 * x^2 - 2 * bb^2 * x * xmin0 + bb^2 * xmin0^2 + xmin^4 - 4 * xmin^3 * xmin0 + 6 * xmin^2 * xmin0^2 - 4 * xmin * xmin0^3 + xmin0^4) / (xmin - xmin0)^4 + (bb^2 * (-x^2 + 2 * xmin0 * x + xmin^2 - 2 * xmin0 * xmin)) / (hb^2 * (xmin - xmin0)^2))^(1 / 2) + hb * ((-x^2 + 2 * xmin0 * x + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2) * (bb^2 / hb^4)^(1 / 2)) * (bb^2 * x^2 - 2 * bb^2 * x * xmin0 + bb^2 * xmin0^2 + xmin^4 - 4 * xmin^3 * xmin0 + 6 * xmin^2 * xmin0^2 - 4 * xmin * xmin0^3 + xmin0^4)) / (4 * (bb^2 / (4 * hb^4))^(1 / 2) * (xmin^4 - 4 * xmin^3 * xmin0 + 6 * xmin^2 * xmin0^2 - 4 * xmin * xmin0^3 + xmin0^4)) - (log(((bb^2 * x^2 - 2 * bb^2 * x * xmin0 + bb^2 * xmin0^2 + xmin^4 - 4 * xmin^3 * xmin0 + 6 * xmin^2 * xmin0^2 - 4 * xmin * xmin0^3 + xmin0^4) / (xmin - xmin0)^4)^(1 / 2)) * (bb^2 * x^2 - 2 * bb^2 * x * xmin0 + bb^2 * xmin0^2 + xmin^4 - 4 * xmin^3 * xmin0 + 6 * xmin^2 * xmin0^2 - 4 * xmin * xmin0^3 + xmin0^4)) / (4 * (bb^2 / (4 * hb^4))^(1 / 2) * (xmin^4 - 4 * xmin^3 * xmin0 + 6 * xmin^2 * xmin0^2 - 4 * xmin * xmin0^3 + xmin0^4))
const x1inbrvx0 = x1inbrnve(xr0)
const x1inbrvx1 = x1inbrnve(xr1)
const x1inbrvx2 = x1inbrnve(xr2)
const x1inbrvx3 = x1inbrnve(xr3)
const x1inbrvx4 = x1inbrnve(xr4)
const x1inbrvx5 = x1inbrnve(xr5)
const x1inbrvx6 = x1inbrnve(xr6)
const x1inbrvx7 = x1inbrnve(xr7)
const x1inbrvx8 = x1inbrnve(xr8)
const x1inbrvx9 = x1inbrnve(xr9)
const ix1inbrvv = 0.5 * (xmin0 - xmin) * (x1inbrvx0 * gle0 + x1inbrvx1 * gle1 + x1inbrvx2 * gle2 + x1inbrvx3 * gle3 + x1inbrvx4 * gle4 + x1inbrvx5 * gle5 + x1inbrvx6 * gle6 + x1inbrvx7 * gle7 + x1inbrvx8 * gle8 + x1inbrvx9 * gle9)
# x2inbrnv(x)=x^2*inbrnv(x);
# x2inbrnve(x)=x^2*(hb*((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4) + (bb^2*(- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin))/(hb^2*(xmin - xmin0)^2))^(1/2)*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))/2 + (log(((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin - xmin0)^4 + (bb^2*(- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin))/(hb^2*(xmin - xmin0)^2))^(1/2) + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)*(bb^2/hb^4)^(1/2))*(bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4))/(4*(bb^2/(4*hb^4))^(1/2)*(xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)) - (log(((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin - xmin0)^4)^(1/2))*(bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4))/(4*(bb^2/(4*hb^4))^(1/2)*(xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4));
# x2inbrvx0=x2inbrnve(xr0);
# x2inbrvx1=x2inbrnve(xr1);
# x2inbrvx2=x2inbrnve(xr2);
# x2inbrvx3=x2inbrnve(xr3);
# x2inbrvx4=x2inbrnve(xr4);
# x2inbrvx5=x2inbrnve(xr5);
# x2inbrvx6=x2inbrnve(xr6);
# x2inbrvx7=x2inbrnve(xr7);
# x2inbrvx8=x2inbrnve(xr8);
# x2inbrvx9=x2inbrnve(xr9);
# ix2inbrvv=0.5*(xmin0-xmin)*(x2inbrvx0*gle0+x2inbrvx1*gle1+x2inbrvx2*gle2+x2inbrvx3*gle3+x2inbrvx4*gle4+x2inbrvx5*gle5+x2inbrvx6*gle6+x2inbrvx7*gle7+x2inbrvx8*gle8+x2inbrvx9*gle9);
# x2inbfn(x)=int(x^2*(a*x^2+b*x+c)^0.5,x);
# x1inbfn(x)=int(x*(a*x^2+b*x+c)^0.5,x);
# z2inbf(x)=int(x^2*(a*x^2+b*x+c)^0.5,x);
# z1inbf(x)=int(x*(a*x^2+b*x+c)^0.5,x);
# a1=bb^2*hb^(-4);
# b1=-2*(zmax-hb)*bb^2*hb^(-4);
# c1=1+(zmax-hb)^2*bb^2*hb^(-4)+(x^2-2*xmin0*x+xmin0^2)*(xmin-xmin0)^(-4);
# z2inbre(z)=int(z^2*(a*z^2+b*z+c)^0.5,z);
# z1inbre(z)=int(z*(a*z^2+b*z+c)^0.5,z);
# z2inbrev(z)=(z*(a1*z^2 + b1*z + c1)^(3/2))/(4*a1) - (5*b1*((log((b1 + 2*a1*z)/a1^(1/2) + 2*(a1*z^2 + b1*z + c1)^(1/2))*(b1^3 - 4*a1*c1*b1))/(16*a1^(5/2)) + ((- 3*b1^2 + 2*a1*z*b1 + 8*a1*(a1*z^2 + c1))*(a1*z^2 + b1*z + c1)^(1/2))/(24*a1^2)))/(8*a1) - (c1*((z/2 + b1/(4*a1))*(a1*z^2 + b1*z + c1)^(1/2) + (log((b1/2 + a1*z)/a1^(1/2) + (a1*z^2 + b1*z + c1)^(1/2))*(- b1^2/4 + a1*c1))/(2*a1^(3/2))))/(4*a1);
# z1inbrev(z)=(log((b1 + 2*a1*z)/a1^(1/2) + 2*(a1*z^2 + b1*z + c1)^(1/2))*(b1^3 - 4*a1*c1*b1))/(16*a1^(5/2)) + ((- 3*b1^2 + 2*a1*z*b1 + 8*a1*(a1*z^2 + c1))*(a1*z^2 + b1*z + c1)^(1/2))/(24*a1^2);
# z2inbren=z2inbrev(psi1(x))-z2inbrev(zmax-hb);
# z1inbren=z1inbrev(psi1(x))-z1inbrev(zmax-hb);
# z2inbrenx(x)=(5*(2*hb - 2*zmax)*((log(2*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (2*bb^2*(hb - zmax)^2)/hb^4 - (bb^2*(2*hb - 2*zmax)*(hb - zmax))/hb^4 + 1)^(1/2) - ((2*bb^2*(hb - zmax))/hb^4 - (bb^2*(2*hb - 2*zmax))/hb^4)/(bb^2/hb^4)^(1/2))*((bb^6*(2*hb - 2*zmax)^3)/hb^12 - (4*bb^4*(2*hb - 2*zmax)*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/hb^8))/(16*(bb^2/hb^4)^(5/2)) - (hb^8*((3*bb^4*(2*hb - 2*zmax)^2)/hb^8 - (8*bb^2*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (2*bb^2*(hb - zmax)^2)/hb^4 + 1))/hb^4 + (2*bb^4*(2*hb - 2*zmax)*(hb - zmax))/hb^8)*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (2*bb^2*(hb - zmax)^2)/hb^4 - (bb^2*(2*hb - 2*zmax)*(hb - zmax))/hb^4 + 1)^(1/2))/(24*bb^4)))/8 - (5*(2*hb - 2*zmax)*((log(((2*bb^2*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)))/hb^4 + (bb^2*(2*hb - 2*zmax))/hb^4)/(bb^2/hb^4)^(1/2) + 2*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (bb^2*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2)/hb^4 + (bb^2*(hb - zmax)^2)/hb^4 + (bb^2*(2*hb - 2*zmax)*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)))/hb^4 + 1)^(1/2))*((bb^6*(2*hb - 2*zmax)^3)/hb^12 - (4*bb^4*(2*hb - 2*zmax)*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/hb^8))/(16*(bb^2/hb^4)^(5/2)) + (hb^8*((8*bb^2*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (bb^2*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2)/hb^4 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/hb^4 - (3*bb^4*(2*hb - 2*zmax)^2)/hb^8 + (2*bb^4*(2*hb - 2*zmax)*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)))/hb^8)*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (bb^2*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2)/hb^4 + (bb^2*(hb - zmax)^2)/hb^4 + (bb^2*(2*hb - 2*zmax)*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)))/hb^4 + 1)^(1/2))/(24*bb^4)))/8 + (hb^4*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (bb^2*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2)/hb^4 + (bb^2*(hb - zmax)^2)/hb^4 + (bb^2*(2*hb - 2*zmax)*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)))/hb^4 + 1)^(3/2))/(4*bb^2) + (hb^4*(hb - zmax)*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (2*bb^2*(hb - zmax)^2)/hb^4 - (bb^2*(2*hb - 2*zmax)*(hb - zmax))/hb^4 + 1)^(3/2))/(4*bb^2) + (hb^4*((log(((bb^2*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)))/hb^4 + (bb^2*(2*hb - 2*zmax))/(2*hb^4))/(bb^2/hb^4)^(1/2) + ((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (bb^2*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2)/hb^4 + (bb^2*(hb - zmax)^2)/hb^4 + (bb^2*(2*hb - 2*zmax)*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)))/hb^4 + 1)^(1/2))*((bb^4*(2*hb - 2*zmax)^2)/(4*hb^8) - (bb^2*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/hb^4))/(2*(bb^2/hb^4)^(3/2)) - (hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (bb^2*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2)/hb^4 + (bb^2*(hb - zmax)^2)/hb^4 + (bb^2*(2*hb - 2*zmax)*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)))/hb^4 + 1)^(1/2))/2)*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/(4*bb^2) - (hb^4*log(((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (2*bb^2*(hb - zmax)^2)/hb^4 - (bb^2*(2*hb - 2*zmax)*(hb - zmax))/hb^4 + 1)^(1/2) - ((bb^2*(hb - zmax))/hb^4 - (bb^2*(2*hb - 2*zmax))/(2*hb^4))/(bb^2/hb^4)^(1/2))*((bb^4*(2*hb - 2*zmax)^2)/(4*hb^8) - (bb^2*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/hb^4)*((x^2 - 2*x*xmin0 + xmin0^2)/(xmin - xmin0)^4 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/(8*bb^2*(bb^2/hb^4)^(3/2));
# z2inbrvx0=z2inbrenx(xr0);
# z2inbrvx1=z2inbrenx(xr1);
# z2inbrvx2=z2inbrenx(xr2);
# z2inbrvx3=z2inbrenx(xr3);
# z2inbrvx4=z2inbrenx(xr4);
# z2inbrvx5=z2inbrenx(xr5);
# z2inbrvx6=z2inbrenx(xr6);
# z2inbrvx7=z2inbrenx(xr7);
# z2inbrvx8=z2inbrenx(xr8);
# z2inbrvx9=z2inbrenx(xr9);
# iz2inbrvv=0.5*(xmin0-xmin)*(z2inbrvx0*gle0+z2inbrvx1*gle1+z2inbrvx2*gle2+z2inbrvx3*gle3+z2inbrvx4*gle4+z2inbrvx5*gle5+z2inbrvx6*gle6+z2inbrvx7*gle7+z2inbrvx8*gle8+z2inbrvx9*gle9);
z1inbrenx(x) = (log(((2 * bb^2 * (zmax - hb + hb * ((2 * xmin0 * x - x^2 + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2))) / hb^4 + (bb^2 * (2 * hb - 2 * zmax)) / hb^4) / (bb^2 / hb^4)^(1 / 2) + 2 * ((x^2 - 2 * x * xmin0 + xmin0^2) / (xmin - xmin0)^4 + (bb^2 * (zmax - hb + hb * ((2 * xmin0 * x - x^2 + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2))^2) / hb^4 + (bb^2 * (hb - zmax)^2) / hb^4 + (bb^2 * (2 * hb - 2 * zmax) * (zmax - hb + hb * ((2 * xmin0 * x - x^2 + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2))) / hb^4 + 1)^(1 / 2)) * ((bb^6 * (2 * hb - 2 * zmax)^3) / hb^12 - (4 * bb^4 * (2 * hb - 2 * zmax) * ((x^2 - 2 * x * xmin0 + xmin0^2) / (xmin - xmin0)^4 + (bb^2 * (hb - zmax)^2) / hb^4 + 1)) / hb^8)) / (16 * (bb^2 / hb^4)^(5 / 2)) - (log(2 * ((x^2 - 2 * x * xmin0 + xmin0^2) / (xmin - xmin0)^4 + (2 * bb^2 * (hb - zmax)^2) / hb^4 - (bb^2 * (2 * hb - 2 * zmax) * (hb - zmax)) / hb^4 + 1)^(1 / 2) - ((2 * bb^2 * (hb - zmax)) / hb^4 - (bb^2 * (2 * hb - 2 * zmax)) / hb^4) / (bb^2 / hb^4)^(1 / 2)) * ((bb^6 * (2 * hb - 2 * zmax)^3) / hb^12 - (4 * bb^4 * (2 * hb - 2 * zmax) * ((x^2 - 2 * x * xmin0 + xmin0^2) / (xmin - xmin0)^4 + (bb^2 * (hb - zmax)^2) / hb^4 + 1)) / hb^8)) / (16 * (bb^2 / hb^4)^(5 / 2)) + (hb^8 * ((3 * bb^4 * (2 * hb - 2 * zmax)^2) / hb^8 - (8 * bb^2 * ((x^2 - 2 * x * xmin0 + xmin0^2) / (xmin - xmin0)^4 + (2 * bb^2 * (hb - zmax)^2) / hb^4 + 1)) / hb^4 + (2 * bb^4 * (2 * hb - 2 * zmax) * (hb - zmax)) / hb^8) * ((x^2 - 2 * x * xmin0 + xmin0^2) / (xmin - xmin0)^4 + (2 * bb^2 * (hb - zmax)^2) / hb^4 - (bb^2 * (2 * hb - 2 * zmax) * (hb - zmax)) / hb^4 + 1)^(1 / 2)) / (24 * bb^4) + (hb^8 * ((8 * bb^2 * ((x^2 - 2 * x * xmin0 + xmin0^2) / (xmin - xmin0)^4 + (bb^2 * (zmax - hb + hb * ((2 * xmin0 * x - x^2 + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2))^2) / hb^4 + (bb^2 * (hb - zmax)^2) / hb^4 + 1)) / hb^4 - (3 * bb^4 * (2 * hb - 2 * zmax)^2) / hb^8 + (2 * bb^4 * (2 * hb - 2 * zmax) * (zmax - hb + hb * ((2 * xmin0 * x - x^2 + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2))) / hb^8) * ((x^2 - 2 * x * xmin0 + xmin0^2) / (xmin - xmin0)^4 + (bb^2 * (zmax - hb + hb * ((2 * xmin0 * x - x^2 + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2))^2) / hb^4 + (bb^2 * (hb - zmax)^2) / hb^4 + (bb^2 * (2 * hb - 2 * zmax) * (zmax - hb + hb * ((2 * xmin0 * x - x^2 + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2))) / hb^4 + 1)^(1 / 2)) / (24 * bb^4)
const z1inbrvx0 = z1inbrenx(xr0)
const z1inbrvx1 = z1inbrenx(xr1)
const z1inbrvx2 = z1inbrenx(xr2)
const z1inbrvx3 = z1inbrenx(xr3)
const z1inbrvx4 = z1inbrenx(xr4)
const z1inbrvx5 = z1inbrenx(xr5)
const z1inbrvx6 = z1inbrenx(xr6)
const z1inbrvx7 = z1inbrenx(xr7)
const z1inbrvx8 = z1inbrenx(xr8)
const z1inbrvx9 = z1inbrenx(xr9)
const iz1inbrvv = 0.5 * (xmin0 - xmin) * (z1inbrvx0 * gle0 + z1inbrvx1 * gle1 + z1inbrvx2 * gle2 + z1inbrvx3 * gle3 + z1inbrvx4 * gle4 + z1inbrvx5 * gle5 + z1inbrvx6 * gle6 + z1inbrvx7 * gle7 + z1inbrvx8 * gle8 + z1inbrvx9 * gle9)

# lb=xmax-xmin;

# a2=bb^2*hb^(-4);
# b2=-2*(zmax-hb)*bb^2*hb^(-4);
# c2=1+(zmax-hb)^2*bb^2*hb^(-4)+(x^2-2*xmax0*x+xmax0^2)*(xmax-xmax0)^(-4);
# z2inbfe(z)=int(z^2*(a*z^2+b*z+c)^0.5,z);
# z1inbfe(z)=int(z*(a*z^2+b*z+c)^0.5,z);
# z2inbfev(z)=(z*(a2*z^2 + b2*z + c2)^(3/2))/(4*a2) - (5*b2*((log((b2 + 2*a2*z)/a2^(1/2) + 2*(a2*z^2 + b2*z + c2)^(1/2))*(b2^3 - 4*a2*c2*b2))/(16*a2^(5/2)) + ((- 3*b2^2 + 2*a2*z*b2 + 8*a2*(a2*z^2 + c2))*(a2*z^2 + b2*z + c2)^(1/2))/(24*a2^2)))/(8*a2) - (c2*((z/2 + b2/(4*a2))*(a2*z^2 + b2*z + c2)^(1/2) + (log((b2/2 + a2*z)/a2^(1/2) + (a2*z^2 + b2*z + c2)^(1/2))*(- b2^2/4 + a2*c2))/(2*a2^(3/2))))/(4*a2);
# z1inbfev(z)=(log((b2 + 2*a2*z)/a2^(1/2) + 2*(a2*z^2 + b2*z + c2)^(1/2))*(b2^3 - 4*a2*c2*b2))/(16*a2^(5/2)) + ((- 3*b2^2 + 2*a2*z*b2 + 8*a2*(a2*z^2 + c2))*(a2*z^2 + b2*z + c2)^(1/2))/(24*a2^2);
# z2inbfen=z2inbfev(psi2(x))-z2inbfev(zmax-hb);
# z1inbfen=z1inbfev(psi2(x))-z1inbfev(zmax-hb);
# z2inbfenx(x)=(5*(2*hb - 2*zmax)*((log(2*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (2*bb^2*(hb - zmax)^2)/hb^4 - (bb^2*(2*hb - 2*zmax)*(hb - zmax))/hb^4 + 1)^(1/2) - ((2*bb^2*(hb - zmax))/hb^4 - (bb^2*(2*hb - 2*zmax))/hb^4)/(bb^2/hb^4)^(1/2))*((bb^6*(2*hb - 2*zmax)^3)/hb^12 - (4*bb^4*(2*hb - 2*zmax)*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/hb^8))/(16*(bb^2/hb^4)^(5/2)) - (hb^8*((3*bb^4*(2*hb - 2*zmax)^2)/hb^8 - (8*bb^2*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (2*bb^2*(hb - zmax)^2)/hb^4 + 1))/hb^4 + (2*bb^4*(2*hb - 2*zmax)*(hb - zmax))/hb^8)*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (2*bb^2*(hb - zmax)^2)/hb^4 - (bb^2*(2*hb - 2*zmax)*(hb - zmax))/hb^4 + 1)^(1/2))/(24*bb^4)))/8 - (5*(2*hb - 2*zmax)*((log(((2*bb^2*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)))/hb^4 + (bb^2*(2*hb - 2*zmax))/hb^4)/(bb^2/hb^4)^(1/2) + 2*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (bb^2*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2)/hb^4 + (bb^2*(hb - zmax)^2)/hb^4 + (bb^2*(2*hb - 2*zmax)*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)))/hb^4 + 1)^(1/2))*((bb^6*(2*hb - 2*zmax)^3)/hb^12 - (4*bb^4*(2*hb - 2*zmax)*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/hb^8))/(16*(bb^2/hb^4)^(5/2)) + (hb^8*((8*bb^2*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (bb^2*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2)/hb^4 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/hb^4 - (3*bb^4*(2*hb - 2*zmax)^2)/hb^8 + (2*bb^4*(2*hb - 2*zmax)*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)))/hb^8)*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (bb^2*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2)/hb^4 + (bb^2*(hb - zmax)^2)/hb^4 + (bb^2*(2*hb - 2*zmax)*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)))/hb^4 + 1)^(1/2))/(24*bb^4)))/8 + (hb^4*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (bb^2*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2)/hb^4 + (bb^2*(hb - zmax)^2)/hb^4 + (bb^2*(2*hb - 2*zmax)*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)))/hb^4 + 1)^(3/2))/(4*bb^2) + (hb^4*(hb - zmax)*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (2*bb^2*(hb - zmax)^2)/hb^4 - (bb^2*(2*hb - 2*zmax)*(hb - zmax))/hb^4 + 1)^(3/2))/(4*bb^2) + (hb^4*((log(((bb^2*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)))/hb^4 + (bb^2*(2*hb - 2*zmax))/(2*hb^4))/(bb^2/hb^4)^(1/2) + ((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (bb^2*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2)/hb^4 + (bb^2*(hb - zmax)^2)/hb^4 + (bb^2*(2*hb - 2*zmax)*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)))/hb^4 + 1)^(1/2))*((bb^4*(2*hb - 2*zmax)^2)/(4*hb^8) - (bb^2*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/hb^4))/(2*(bb^2/hb^4)^(3/2)) - (hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (bb^2*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2)/hb^4 + (bb^2*(hb - zmax)^2)/hb^4 + (bb^2*(2*hb - 2*zmax)*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)))/hb^4 + 1)^(1/2))/2)*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/(4*bb^2) - (hb^4*log(((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (2*bb^2*(hb - zmax)^2)/hb^4 - (bb^2*(2*hb - 2*zmax)*(hb - zmax))/hb^4 + 1)^(1/2) - ((bb^2*(hb - zmax))/hb^4 - (bb^2*(2*hb - 2*zmax))/(2*hb^4))/(bb^2/hb^4)^(1/2))*((bb^4*(2*hb - 2*zmax)^2)/(4*hb^8) - (bb^2*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/hb^4)*((x^2 - 2*x*xmax0 + xmax0^2)/(xmax - xmax0)^4 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/(8*bb^2*(bb^2/hb^4)^(3/2));
# z2inbfvx0=z2inbfenx(xf0);
# z2inbfvx1=z2inbfenx(xf1);
# z2inbfvx2=z2inbfenx(xf2);
# z2inbfvx3=z2inbfenx(xf3);
# z2inbfvx4=z2inbfenx(xf4);
# z2inbfvx5=z2inbfenx(xf5);
# z2inbfvx6=z2inbfenx(xf6);
# z2inbfvx7=z2inbfenx(xf7);
# z2inbfvx8=z2inbfenx(xf8);
# z2inbfvx9=z2inbfenx(xf9);
# iz2inbfvv=0.5*(xmax-xmax0)*(z2inbfvx0*gle0+z2inbfvx1*gle1+z2inbfvx2*gle2+z2inbfvx3*gle3+z2inbfvx4*gle4+z2inbfvx5*gle5+z2inbfvx6*gle6+z2inbfvx7*gle7+z2inbfvx8*gle8+z2inbfvx9*gle9);
z1inbfenx(x) = (log(((2 * bb^2 * (zmax - hb + hb * ((2 * xmax0 * x - x^2 + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2))) / hb^4 + (bb^2 * (2 * hb - 2 * zmax)) / hb^4) / (bb^2 / hb^4)^(1 / 2) + 2 * ((x^2 - 2 * x * xmax0 + xmax0^2) / (xmax - xmax0)^4 + (bb^2 * (zmax - hb + hb * ((2 * xmax0 * x - x^2 + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2))^2) / hb^4 + (bb^2 * (hb - zmax)^2) / hb^4 + (bb^2 * (2 * hb - 2 * zmax) * (zmax - hb + hb * ((2 * xmax0 * x - x^2 + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2))) / hb^4 + 1)^(1 / 2)) * ((bb^6 * (2 * hb - 2 * zmax)^3) / hb^12 - (4 * bb^4 * (2 * hb - 2 * zmax) * ((x^2 - 2 * x * xmax0 + xmax0^2) / (xmax - xmax0)^4 + (bb^2 * (hb - zmax)^2) / hb^4 + 1)) / hb^8)) / (16 * (bb^2 / hb^4)^(5 / 2)) - (log(2 * ((x^2 - 2 * x * xmax0 + xmax0^2) / (xmax - xmax0)^4 + (2 * bb^2 * (hb - zmax)^2) / hb^4 - (bb^2 * (2 * hb - 2 * zmax) * (hb - zmax)) / hb^4 + 1)^(1 / 2) - ((2 * bb^2 * (hb - zmax)) / hb^4 - (bb^2 * (2 * hb - 2 * zmax)) / hb^4) / (bb^2 / hb^4)^(1 / 2)) * ((bb^6 * (2 * hb - 2 * zmax)^3) / hb^12 - (4 * bb^4 * (2 * hb - 2 * zmax) * ((x^2 - 2 * x * xmax0 + xmax0^2) / (xmax - xmax0)^4 + (bb^2 * (hb - zmax)^2) / hb^4 + 1)) / hb^8)) / (16 * (bb^2 / hb^4)^(5 / 2)) + (hb^8 * ((3 * bb^4 * (2 * hb - 2 * zmax)^2) / hb^8 - (8 * bb^2 * ((x^2 - 2 * x * xmax0 + xmax0^2) / (xmax - xmax0)^4 + (2 * bb^2 * (hb - zmax)^2) / hb^4 + 1)) / hb^4 + (2 * bb^4 * (2 * hb - 2 * zmax) * (hb - zmax)) / hb^8) * ((x^2 - 2 * x * xmax0 + xmax0^2) / (xmax - xmax0)^4 + (2 * bb^2 * (hb - zmax)^2) / hb^4 - (bb^2 * (2 * hb - 2 * zmax) * (hb - zmax)) / hb^4 + 1)^(1 / 2)) / (24 * bb^4) + (hb^8 * ((8 * bb^2 * ((x^2 - 2 * x * xmax0 + xmax0^2) / (xmax - xmax0)^4 + (bb^2 * (zmax - hb + hb * ((2 * xmax0 * x - x^2 + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2))^2) / hb^4 + (bb^2 * (hb - zmax)^2) / hb^4 + 1)) / hb^4 - (3 * bb^4 * (2 * hb - 2 * zmax)^2) / hb^8 + (2 * bb^4 * (2 * hb - 2 * zmax) * (zmax - hb + hb * ((2 * xmax0 * x - x^2 + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2))) / hb^8) * ((x^2 - 2 * x * xmax0 + xmax0^2) / (xmax - xmax0)^4 + (bb^2 * (zmax - hb + hb * ((2 * xmax0 * x - x^2 + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2))^2) / hb^4 + (bb^2 * (hb - zmax)^2) / hb^4 + (bb^2 * (2 * hb - 2 * zmax) * (zmax - hb + hb * ((2 * xmax0 * x - x^2 + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2))) / hb^4 + 1)^(1 / 2)) / (24 * bb^4)
const z1inbfvx0 = z1inbfenx(xf0)
const z1inbfvx1 = z1inbfenx(xf1)
const z1inbfvx2 = z1inbfenx(xf2)
const z1inbfvx3 = z1inbfenx(xf3)
const z1inbfvx4 = z1inbfenx(xf4)
const z1inbfvx5 = z1inbfenx(xf5)
const z1inbfvx6 = z1inbfenx(xf6)
const z1inbfvx7 = z1inbfenx(xf7)
const z1inbfvx8 = z1inbfenx(xf8)
const z1inbfvx9 = z1inbfenx(xf9)
const iz1inbfvv = 0.5 * (xmax - xmax0) * (z1inbfvx0 * gle0 + z1inbfvx1 * gle1 + z1inbfvx2 * gle2 + z1inbfvx3 * gle3 + z1inbfvx4 * gle4 + z1inbfvx5 * gle5 + z1inbfvx6 * gle6 + z1inbfvx7 * gle7 + z1inbfvx8 * gle8 + z1inbfvx9 * gle9)

# inbrn(x)=inbr(x,psi1(x))-inbr(x,zmax-hb);

# inbm(z)=int(nbm(z));
# inbmv(z)=(((bb^2*(2*hb + 2*z - 2*zmax)^2)/(4*hb^4) + 1)^(1/2)*(2*hb + 2*z - 2*zmax))/4 + asinh(((bb^2/hb^4)^(1/2)*(2*hb + 2*z - 2*zmax))/2)/(2*(bb^2/hb^4)^(1/2));
# inbmn=inbmv(zmax)-inbmv(zmax-hb);

# inbmnv=asinh(hb*(bb^2/hb^4)^(1/2))/(2*(bb^2/hb^4)^(1/2)) + (hb*(bb^2/hb^2 + 1)^(1/2))/2;
# snbm=2*inbmn*(xmax0-xmin0);
# snbmv=(xmax0 - xmin0)*(asinh(hb*(bb^2/hb^4)^(1/2))/(bb^2/hb^4)^(1/2) + hb*(bb^2/hb^2 + 1)^(1/2));
# x1snbm=2*inbmn*(xmax0^2-xmin0^2)/2;
const x1snbmv = ((xmax0^2 - xmin0^2) * (asinh(hb * (bb^2 / hb^4)^(1 / 2)) / (bb^2 / hb^4)^(1 / 2) + hb * (bb^2 / hb^2 + 1)^(1 / 2))) / 2
# x2snbm=2*inbmn*(xmax0^3-xmin0^3)/3;
# x2snbmv=((xmax0^3 - xmin0^3)*(asinh(hb*(bb^2/hb^4)^(1/2))/(bb^2/hb^4)^(1/2) + hb*(bb^2/hb^2 + 1)^(1/2)))/3;




# snb=2*iinbfvv+snbmv+2*iinbrvv;
# x2snb=2*ix2inbfvv+x2snbmv+2*ix2inbrvv;
const x1snb = 2 * ix1inbfvv + x1snbmv + 2 * ix1inbrvv
# a0=bb^2*hb^(-4);
# b0=-2*(zmax-hb)*bb^2*hb^(-4);
const c0 = 1 + (zmax - hb)^2 * bb^2 * hb^(-4)

# z2inbm(z)=int((a*z^2+b*z+c)^(0.5)*z^2,z);
# z1inbm(z)=int((a*z^2+b*z+c)^(0.5)*z,z);
# z2nbf(x,z)=z^2*nbf(x,z);
# z2nbr(x,z)=z^2*nbr(x,z);
# z2inbmn=z2inbm(zmax)-z2inbm(zmax-hb);
# z2inbmnv=((hb - zmax)*(c0 - b0*(hb - zmax) + a0*(hb - zmax)^2)^(3/2))/(4*a0) - (5*b0*((log((b0 + 2*a0*zmax)/a0^(1/2) + 2*(a0*zmax^2 + b0*zmax + c0)^(1/2))*(b0^3 - 4*a0*c0*b0))/(16*a0^(5/2)) + ((- 3*b0^2 + 2*a0*zmax*b0 + 8*a0*(a0*zmax^2 + c0))*(a0*zmax^2 + b0*zmax + c0)^(1/2))/(24*a0^2)))/(8*a0) + (5*b0*((log((b0 - 2*a0*(hb - zmax))/a0^(1/2) + 2*(c0 - b0*(hb - zmax) + a0*(hb - zmax)^2)^(1/2))*(b0^3 - 4*a0*c0*b0))/(16*a0^(5/2)) - ((3*b0^2 + 2*a0*(hb - zmax)*b0 - 8*a0*(c0 + a0*(hb - zmax)^2))*(c0 - b0*(hb - zmax) + a0*(hb - zmax)^2)^(1/2))/(24*a0^2)))/(8*a0) + (c0*((zmax/2 - hb/2 + b0/(4*a0))*(c0 - b0*(hb - zmax) + a0*(hb - zmax)^2)^(1/2) + (log((c0 - b0*(hb - zmax) + a0*(hb - zmax)^2)^(1/2) + (b0/2 - a0*(hb - zmax))/a0^(1/2))*(- b0^2/4 + a0*c0))/(2*a0^(3/2))))/(4*a0) + (zmax*(a0*zmax^2 + b0*zmax + c0)^(3/2))/(4*a0) - (c0*((zmax/2 + b0/(4*a0))*(a0*zmax^2 + b0*zmax + c0)^(1/2) + (log((b0/2 + a0*zmax)/a0^(1/2) + (a0*zmax^2 + b0*zmax + c0)^(1/2))*(- b0^2/4 + a0*c0))/(2*a0^(3/2))))/(4*a0);
# z2snbmn=2*(xmax0-xmin0)*z2inbmnv;
# z2snbmnv=-(2*xmax0 - 2*xmin0)*((5*(2*hb - 2*zmax)*((log(2*((hb - zmax)^2/hb^2 + (bb^2*zmax^2)/hb^4 + (bb^2*zmax*(2*hb - 2*zmax))/hb^4 + 1)^(1/2) + ((2*bb^2*zmax)/hb^4 + (bb^2*(2*hb - 2*zmax))/hb^4)/(bb^2/hb^4)^(1/2))*((bb^6*(2*hb - 2*zmax)^3)/hb^12 - (4*bb^4*(2*hb - 2*zmax)*((hb - zmax)^2/hb^2 + 1))/hb^8))/(16*(bb^2/hb^4)^(5/2)) + (hb^8*((8*bb^2*((hb - zmax)^2/hb^2 + (bb^2*zmax^2)/hb^4 + 1))/hb^4 - (3*bb^4*(2*hb - 2*zmax)^2)/hb^8 + (2*bb^4*zmax*(2*hb - 2*zmax))/hb^8)*((hb - zmax)^2/hb^2 + (bb^2*zmax^2)/hb^4 + (bb^2*zmax*(2*hb - 2*zmax))/hb^4 + 1)^(1/2))/(24*bb^4)))/8 - (5*(2*hb - 2*zmax)*((log(2*((hb - zmax)^2/hb^2 + (bb^2*(hb - zmax)^2)/hb^4 - (bb^2*(2*hb - 2*zmax)*(hb - zmax))/hb^4 + 1)^(1/2) - ((2*bb^2*(hb - zmax))/hb^4 - (bb^2*(2*hb - 2*zmax))/hb^4)/(bb^2/hb^4)^(1/2))*((bb^6*(2*hb - 2*zmax)^3)/hb^12 - (4*bb^4*(2*hb - 2*zmax)*((hb - zmax)^2/hb^2 + 1))/hb^8))/(16*(bb^2/hb^4)^(5/2)) - (hb^8*((3*bb^4*(2*hb - 2*zmax)^2)/hb^8 - (8*bb^2*((hb - zmax)^2/hb^2 + (bb^2*(hb - zmax)^2)/hb^4 + 1))/hb^4 + (2*bb^4*(2*hb - 2*zmax)*(hb - zmax))/hb^8)*((hb - zmax)^2/hb^2 + (bb^2*(hb - zmax)^2)/hb^4 - (bb^2*(2*hb - 2*zmax)*(hb - zmax))/hb^4 + 1)^(1/2))/(24*bb^4)))/8 - (hb^4*zmax*((hb - zmax)^2/hb^2 + (bb^2*zmax^2)/hb^4 + (bb^2*zmax*(2*hb - 2*zmax))/hb^4 + 1)^(3/2))/(4*bb^2) + (hb^4*((hb*((hb - zmax)^2/hb^2 + (bb^2*zmax^2)/hb^4 + (bb^2*zmax*(2*hb - 2*zmax))/hb^4 + 1)^(1/2))/2 - (log(((hb - zmax)^2/hb^2 + (bb^2*zmax^2)/hb^4 + (bb^2*zmax*(2*hb - 2*zmax))/hb^4 + 1)^(1/2) + ((bb^2*zmax)/hb^4 + (bb^2*(2*hb - 2*zmax))/(2*hb^4))/(bb^2/hb^4)^(1/2))*((bb^4*(2*hb - 2*zmax)^2)/(4*hb^8) - (bb^2*((hb - zmax)^2/hb^2 + 1))/hb^4))/(2*(bb^2/hb^4)^(3/2)))*((hb - zmax)^2/hb^2 + 1))/(4*bb^2) - (hb^4*(hb - zmax)*((hb - zmax)^2/hb^2 + (bb^2*(hb - zmax)^2)/hb^4 - (bb^2*(2*hb - 2*zmax)*(hb - zmax))/hb^4 + 1)^(3/2))/(4*bb^2) + (hb^4*log(((hb - zmax)^2/hb^2 + (bb^2*(hb - zmax)^2)/hb^4 - (bb^2*(2*hb - 2*zmax)*(hb - zmax))/hb^4 + 1)^(1/2) - ((bb^2*(hb - zmax))/hb^4 - (bb^2*(2*hb - 2*zmax))/(2*hb^4))/(bb^2/hb^4)^(1/2))*((bb^4*(2*hb - 2*zmax)^2)/(4*hb^8) - (bb^2*((hb - zmax)^2/hb^2 + 1))/hb^4)*((hb - zmax)^2/hb^2 + 1))/(8*bb^2*(bb^2/hb^4)^(3/2)));
# z1inbmn=z1inbm(zmax)-z1inbm(zmax-hb);
# z1inbmnv=(log((b0 + 2*a0*zmax)/a0^(1/2) + 2*(a0*zmax^2 + b0*zmax + c0)^(1/2))*(b0^3 - 4*a0*c0*b0))/(16*a0^(5/2)) + ((- 3*b0^2 + 2*a0*zmax*b0 + 8*a0*(a0*zmax^2 + c0))*(a0*zmax^2 + b0*zmax + c0)^(1/2))/(24*a0^2) - (log((b0 - 2*a0*(hb - zmax))/a0^(1/2) + 2*(c0 - b0*(hb - zmax) + a0*(hb - zmax)^2)^(1/2))*(b0^3 - 4*a0*c0*b0))/(16*a0^(5/2)) + ((3*b0^2 + 2*a0*(hb - zmax)*b0 - 8*a0*(c0 + a0*(hb - zmax)^2))*(c0 - b0*(hb - zmax) + a0*(hb - zmax)^2)^(1/2))/(24*a0^2);
# z1snbmn=2*(xmax0-xmin0)*z1inbmnv;

const z1snbmnv = (2 * xmax0 - 2 * xmin0) * ((log(2 * (c0 + (bb^2 * zmax^2) / hb^4 + (bb^2 * zmax * (2 * hb - 2 * zmax)) / hb^4)^(1 / 2) + ((2 * bb^2 * zmax) / hb^4 + (bb^2 * (2 * hb - 2 * zmax)) / hb^4) / (bb^2 / hb^4)^(1 / 2)) * ((bb^6 * (2 * hb - 2 * zmax)^3) / hb^12 - (4 * bb^4 * (2 * hb - 2 * zmax) * ((hb - zmax)^2 / hb^2 + 1)) / hb^8)) / (16 * (bb^2 / hb^4)^(5 / 2)) - (log(2 * ((hb - zmax)^2 / hb^2 + (bb^2 * (hb - zmax)^2) / hb^4 - (bb^2 * (2 * hb - 2 * zmax) * (hb - zmax)) / hb^4 + 1)^(1 / 2) - ((2 * bb^2 * (hb - zmax)) / hb^4 - (bb^2 * (2 * hb - 2 * zmax)) / hb^4) / (bb^2 / hb^4)^(1 / 2)) * ((bb^6 * (2 * hb - 2 * zmax)^3) / hb^12 - (4 * bb^4 * (2 * hb - 2 * zmax) * ((hb - zmax)^2 / hb^2 + 1)) / hb^8)) / (16 * (bb^2 / hb^4)^(5 / 2)) + (hb^8 * ((8 * bb^2 * ((hb - zmax)^2 / hb^2 + (bb^2 * zmax^2) / hb^4 + 1)) / hb^4 - (3 * bb^4 * (2 * hb - 2 * zmax)^2) / hb^8 + (2 * bb^4 * zmax * (2 * hb - 2 * zmax)) / hb^8) * ((hb - zmax)^2 / hb^2 + (bb^2 * zmax^2) / hb^4 + (bb^2 * zmax * (2 * hb - 2 * zmax)) / hb^4 + 1)^(1 / 2)) / (24 * bb^4) + (hb^8 * ((3 * bb^4 * (2 * hb - 2 * zmax)^2) / hb^8 - (8 * bb^2 * ((hb - zmax)^2 / hb^2 + (bb^2 * (hb - zmax)^2) / hb^4 + 1)) / hb^4 + (2 * bb^4 * (2 * hb - 2 * zmax) * (hb - zmax)) / hb^8) * ((hb - zmax)^2 / hb^2 + (bb^2 * (hb - zmax)^2) / hb^4 - (bb^2 * (2 * hb - 2 * zmax) * (hb - zmax)) / hb^4 + 1)^(1 / 2)) / (24 * bb^4))
# z2snb=2*iz2inbfvv+z2snbmnv+2*iz2inbrvv;
const z1snb = 2 * iz1inbfvv + z1snbmnv + 2 * iz1inbrvv

const sbdf = bb * (-(xmax^3 - xmax0^3) * 3^(-1) + xmax0 * (xmax^2 - xmax0^2) + (xmax - xmax0) * (xmax^2 - 2 * xmax0 * xmax)) * (xmax - xmax0)^(-2)
const sbdm = bb * (xmax0 - xmin0)
const sbdr = bb * (-(xmin0^3 - xmin^3) * 3^(-1) + xmin0 * (xmin0^2 - xmin^2) + (xmin0 - xmin) * (xmin^2 - 2 * xmin0 * xmin)) * (xmin0 - xmin)^(-2)
const sbd = sbdf + sbdm + sbdr
# x2sbdf=bb*(-(xmax^5-xmax0^5)*5^(-1)+xmax0*(xmax^4-xmax0^4)*2^(-1)+(xmax^3-xmax0^3)*(xmax^2-2*xmax0*xmax)*3^(-1))*(xmax-xmax0)^(-2);
# x2sbdm=bb*(xmax0^3-xmin0^3)*3^(-1);
# x2sbdr=bb*(-(xmin0^5-xmin^5)*5^(-1)+xmin0*(xmin0^4-xmin^4)*2^(-1)+(xmin0^3-xmin^3)*(xmin^2-2*xmin0*xmin)*3^(-1))*(xmin0-xmin)^(-2);
# x2sbd=x2sbdf+x2sbdm+x2sbdr;
const x1sbdf = bb * (-(xmax^4 - xmax0^4) * 4^(-1) + 2 * xmax0 * (xmax^3 - xmax0^3) * 3^(-1) + (xmax^2 - xmax0^2) * (xmax^2 - 2 * xmax0 * xmax) * 2^(-1)) * (xmax - xmax0)^(-2)
const x1sbdm = bb * (xmax0^2 - xmin0^2) * 2^(-1)
const x1sbdr = bb * (-(xmin0^4 - xmin^4) * 4^(-1) + 2 * xmin0 * (xmin0^3 - xmin^3) * 3^(-1) + (xmin0^2 - xmin^2) * (xmin^2 - 2 * xmin0 * xmin) * 2^(-1)) * (xmin0 - xmin)^(-2)
const x1sbd = x1sbdf + x1sbdm + x1sbdr
# z2sbd=(zmax-hb)^2*sbd;
const z1sbd = (zmax - hb) * sbd
# sbde=bbe*(xmaxe-xmine);
const x1sbde = bbe * (xmaxe^2 - xmine^2) * 2^(-1)
# x2sbde=bbe*(xmaxe^3-xmine^3)*3^(-1);
const z1sbde = (zmax - hb) * bbe * (xmaxe - xmine)
# z2sbde=(zmax-hb)^2*bbe*(xmaxe-xmine);
# sbdg=bbg*(xmaxg-xming);
# sbo=snb+sbd-sbde+sbdg;
const x1sbdg = bbg * (xmaxg^2 - xming^2) * 2^(-1)
# x2sbdg=bbg*(xmaxg^3-xming^3)*3^(-1);
const zg = zmax - hb + hbg
const z1sbdg = zg * bbg * (xmaxg - xming)
# z2sbdg=zg^2*bbg*(xmaxg-xming);

######### m_B=rhob*deltab*snb+rhod*deltad*(sbd-sbde)+rhog*deltag*sbdg;

const sxmb = rhob * deltab * x1snb + rhod * deltad * (x1sbd - x1sbde) + rhog * deltag * x1sbdg
const szmb = rhob * deltab * z1snb + rhod * deltad * (z1sbd - z1sbde) + rhog * deltag * z1sbdg
const xo = sxmb / m_B
const zo = szmb / m_B
# jymb=rhob*deltab*(x2snb+z2snb)+rhod*deltad*(x2sbd+z2sbd-x2sbde-z2sbde)+rhog*deltag*(x2sbdg+z2sbdg)-m_B*(xo^2+zo^2);
# sbof=snb+sbd;

# xxbm(x,z)=int(2*fi2m(x,z),z);
# xxbme(x,z)=-((bb*z*(z^2 - 3*z*zmax + 3*zmax^2))/3 + (bb*hb*z*(3*z - 6*zmax))/3)/hb^2;
# xxbmev(x)=xxbme(x,zmax)-xxbme(x,zmax-hb);
# xxbmevv(x)=- ((bb*zmax^3)/3 - bb*hb*zmax^2)/hb^2 - ((bb*(hb - zmax)*((hb - zmax)^2 + 3*zmax*(hb - zmax) + 3*zmax^2))/3 - (bb*hb*(3*hb + 3*zmax)*(hb - zmax))/3)/hb^2;
# ixxbmev(x)=int(xxbmevv(x),x);
# ixxbmeve(x)=-x*(((bb*zmax^3)/3 - bb*hb*zmax^2)/hb^2 + ((bb*(hb - zmax)*((hb - zmax)^2 + 3*zmax*(hb - zmax) + 3*zmax^2))/3 - (bb*hb*(3*hb + 3*zmax)*(hb - zmax))/3)/hb^2);
# ixxbmevv=ixxbmeve(xmax0)-ixxbmeve(xmin0);
# vbmte=xmin0*(((bb*zmax^3)/3 - bb*hb*zmax^2)/hb^2 + ((bb*(hb - zmax)*((hb - zmax)^2 + 3*zmax*(hb - zmax) + 3*zmax^2))/3 - (bb*hb*(3*hb + 3*zmax)*(hb - zmax))/3)/hb^2) - xmax0*(((bb*zmax^3)/3 - bb*hb*zmax^2)/hb^2 + ((bb*(hb - zmax)*((hb - zmax)^2 + 3*zmax*(hb - zmax) + 3*zmax^2))/3 - (bb*hb*(3*hb + 3*zmax)*(hb - zmax))/3)/hb^2);
# vbms=simplify(vbmte);
# vbm=(2*bb*hb*(xmax0 - xmin0))/3;

# xxbf(x,z)=int(2*fi2f(x,z),z);
# xxbfe(x,z)=- ((bb*z*(xmax^2*z^2 - 3*xmax^2*z*zmax + 3*xmax^2*zmax^2 - 2*xmax*xmax0*z^2 + 6*xmax*xmax0*z*zmax - 6*xmax*xmax0*zmax^2 + xmax0^2*z^2 - 3*xmax0^2*z*zmax + 3*xmax0^2*zmax^2))/3 + (bb*hb*z*(3*xmax^2*z + 3*xmax0^2*z - 6*xmax^2*zmax - 6*xmax0^2*zmax - 6*xmax*xmax0*z + 12*xmax*xmax0*zmax))/3)/(hb^2*(xmax - xmax0)^2) - (bb*z*(3*x^2 - 6*x*xmax0 + 3*xmax0^2))/(3*(xmax - xmax0)^2);

# xxbfev(x)=xxbfe(x,psi2(x))-xxbfe(x,zmax-hb);




# xxbfvex(x)=(2*bb*hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(3/2))/3;

# xxbfvx0=xxbfvex(xf0);
# xxbfvx1=xxbfvex(xf1);
# xxbfvx2=xxbfvex(xf2);
# xxbfvx3=xxbfvex(xf3);
# xxbfvx4=xxbfvex(xf4);
# xxbfvx5=xxbfvex(xf5);
# xxbfvx6=xxbfvex(xf6);
# xxbfvx7=xxbfvex(xf7);
# xxbfvx8=xxbfvex(xf8);
# xxbfvx9=xxbfvex(xf9);
# ixxbfvv=0.5*(xmax-xmax0)*(xxbfvx0*gle0+xxbfvx1*gle1+xxbfvx2*gle2+xxbfvx3*gle3+xxbfvx4*gle4+xxbfvx5*gle5+xxbfvx6*gle6+xxbfvx7*gle7+xxbfvx8*gle8+xxbfvx9*gle9);
# vbf=ixxbfvv;

# xxbfv(x)=int(2*fi2f(x,z),z,zmax-hb,psi2(x));
# xxbfvx(x)=(2*bb*hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(3/2))/3;

# erxxbfvex(x)=xxbfvex(x)-xxbfvx(x);
# erxxbfvexv(x)=(bb*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))*(6*x*xmax0 - 3*x^2 - 3*xmax0^2 + 3*xmax*xmax0))/(3*(xmax - xmax0)^2) - ((bb*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))*(3*xmax^2*zmax^2 + 3*xmax0^2*zmax^2 + xmax^2*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2 + xmax0^2*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2 - 6*xmax*xmax0*zmax^2 - 2*xmax*xmax0*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2 - 3*xmax^2*zmax*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) - 3*xmax0^2*zmax*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) + 6*xmax*xmax0*zmax*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))))/3 + (bb*hb*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))*(3*xmax^2*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) + 3*xmax0^2*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) - 6*xmax^2*zmax - 6*xmax0^2*zmax - 6*xmax*xmax0*(zmax - hb + hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) + 12*xmax*xmax0*zmax))/3)/(hb^2*(xmax - xmax0)^2) - ((bb*(hb - zmax)*(3*xmax^2*zmax^2 + 3*xmax0^2*zmax^2 + xmax^2*(hb - zmax)^2 + xmax0^2*(hb - zmax)^2 - 6*xmax*xmax0*zmax^2 - 2*xmax*xmax0*(hb - zmax)^2 + 3*xmax^2*zmax*(hb - zmax) + 3*xmax0^2*zmax*(hb - zmax) - 6*xmax*xmax0*zmax*(hb - zmax)))/3 - (bb*hb*(hb - zmax)*(6*xmax^2*zmax + 6*xmax0^2*zmax + 3*xmax^2*(hb - zmax) + 3*xmax0^2*(hb - zmax) - 12*xmax*xmax0*zmax - 6*xmax*xmax0*(hb - zmax)))/3)/(hb^2*(xmax - xmax0)^2) + (bb*(hb - zmax)*(6*x*xmax0 - 3*x^2 - 3*xmax0^2 + 3*xmax*xmax0))/(3*(xmax - xmax0)^2) + (bb*hb*((2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)*(3*xmax*xmax0 - 6*x*xmax0 + 3*x^2 - 3*xmax^2 + (xmax^2*(2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax))/(xmax - xmax0)^2 + (xmax0^2*(2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax))/(xmax - xmax0)^2 - (2*xmax*xmax0*(2*xmax0*x - x^2 + xmax^2 - 2*xmax0*xmax))/(xmax - xmax0)^2))/(3*(xmax - xmax0)^2);
# erxxbfvexvx(x)=simplify(erxxbfvexv(x));


# xxbr(x,z)=int(2*fi2r(x,z),z);
# xxbre(x,z)=- ((bb*z*(xmin^2*z^2 - 3*xmin^2*z*zmax + 3*xmin^2*zmax^2 - 2*xmin*xmin0*z^2 + 6*xmin*xmin0*z*zmax - 6*xmin*xmin0*zmax^2 + xmin0^2*z^2 - 3*xmin0^2*z*zmax + 3*xmin0^2*zmax^2))/3 + (bb*hb*z*(3*xmin^2*z + 3*xmin0^2*z - 6*xmin^2*zmax - 6*xmin0^2*zmax - 6*xmin*xmin0*z + 12*xmin*xmin0*zmax))/3)/(hb^2*(xmin - xmin0)^2) - (bb*z*(3*x^2 - 6*x*xmin0 + 3*xmin0^2))/(3*(xmin - xmin0)^2);
# xxbrv(x)=int(2*fi2r(x,z),z,zmax-hb,psi1(x));
# xxbrvx(x)=(2*bb*hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(3/2))/3;


# xxbrev(x)=xxbre(x,psi1(x))-xxbre(x,zmax-hb);
# xxbrvex(x)=(2*bb*hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(3/2))/3;

# erxxbrvex(x)=xxbrvex(x)-xxbrvx(x);
# erxxbrvexv(x)=(bb*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))*(6*x*xmin0 - 3*x^2 - 3*xmin0^2 + 3*xmin*xmin0))/(3*(xmin - xmin0)^2) - ((bb*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))*(3*xmin^2*zmax^2 + 3*xmin0^2*zmax^2 + xmin^2*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2 + xmin0^2*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2 - 6*xmin*xmin0*zmax^2 - 2*xmin*xmin0*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2 - 3*xmin^2*zmax*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) - 3*xmin0^2*zmax*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) + 6*xmin*xmin0*zmax*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))))/3 + (bb*hb*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))*(3*xmin^2*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) + 3*xmin0^2*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) - 6*xmin^2*zmax - 6*xmin0^2*zmax - 6*xmin*xmin0*(zmax - hb + hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) + 12*xmin*xmin0*zmax))/3)/(hb^2*(xmin - xmin0)^2) - ((bb*(hb - zmax)*(3*xmin^2*zmax^2 + 3*xmin0^2*zmax^2 + xmin^2*(hb - zmax)^2 + xmin0^2*(hb - zmax)^2 - 6*xmin*xmin0*zmax^2 - 2*xmin*xmin0*(hb - zmax)^2 + 3*xmin^2*zmax*(hb - zmax) + 3*xmin0^2*zmax*(hb - zmax) - 6*xmin*xmin0*zmax*(hb - zmax)))/3 - (bb*hb*(hb - zmax)*(6*xmin^2*zmax + 6*xmin0^2*zmax + 3*xmin^2*(hb - zmax) + 3*xmin0^2*(hb - zmax) - 12*xmin*xmin0*zmax - 6*xmin*xmin0*(hb - zmax)))/3)/(hb^2*(xmin - xmin0)^2) + (bb*(hb - zmax)*(6*x*xmin0 - 3*x^2 - 3*xmin0^2 + 3*xmin*xmin0))/(3*(xmin - xmin0)^2) + (bb*hb*((2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)*(3*xmin*xmin0 - 6*x*xmin0 + 3*x^2 - 3*xmin^2 + (xmin^2*(2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin))/(xmin - xmin0)^2 + (xmin0^2*(2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin))/(xmin - xmin0)^2 - (2*xmin*xmin0*(2*xmin0*x - x^2 + xmin^2 - 2*xmin0*xmin))/(xmin - xmin0)^2))/(3*(xmin - xmin0)^2);
# erxxbrvexvx(x)=simplify(erxxbrvexv(x));
# xxbrvx0=xxbrvex(xr0);
# xxbrvx1=xxbrvex(xr1);
# xxbrvx2=xxbrvex(xr2);
# xxbrvx3=xxbrvex(xr3);
# xxbrvx4=xxbrvex(xr4);
# xxbrvx5=xxbrvex(xr5);
# xxbrvx6=xxbrvex(xr6);
# xxbrvx7=xxbrvex(xr7);
# xxbrvx8=xxbrvex(xr8);
# xxbrvx9=xxbrvex(xr9);
# ixxbrvv=0.5*(xmin0-xmin)*(xxbrvx0*gle0+xxbrvx1*gle1+xxbrvx2*gle2+xxbrvx3*gle3+xxbrvx4*gle4+xxbrvx5*gle5+xxbrvx6*gle6+xxbrvx7*gle7+xxbrvx8*gle8+xxbrvx9*gle9);
# vbr=ixxbrvv;
# vb=vbf+vbm+vbr;
# x1xxbf(x,z)=x*xxbf(x,z);
# x1xxbfv(x,z)=-x*(((bb*z*(xmax^2*z^2 - 3*xmax^2*z*zmax + 3*xmax^2*zmax^2 - 2*xmax*xmax0*z^2 + 6*xmax*xmax0*z*zmax - 6*xmax*xmax0*zmax^2 + xmax0^2*z^2 - 3*xmax0^2*z*zmax + 3*xmax0^2*zmax^2))/3 + (bb*hb*z*(3*xmax^2*z + 3*xmax0^2*z - 6*xmax^2*zmax - 6*xmax0^2*zmax - 6*xmax*xmax0*z + 12*xmax*xmax0*zmax))/3)/(hb^2*(xmax - xmax0)^2) + (bb*z*(3*x^2 - 6*x*xmax0 + 3*xmax0^2))/(3*(xmax - xmax0)^2));

# x1xxbfx(x)=x1xxbfv(x,psi2(x))-x1xxbfv(x,zmax-hb);
# x1xxbfvex(x)=- x*(((bb*(hb - zmax)*(3*xmax^2*zmax^2 + 3*xmax0^2*zmax^2 + xmax^2*(hb - zmax)^2 + xmax0^2*(hb - zmax)^2 - 6*xmax*xmax0*zmax^2 - 2*xmax*xmax0*(hb - zmax)^2 + 3*xmax^2*zmax*(hb - zmax) + 3*xmax0^2*zmax*(hb - zmax) - 6*xmax*xmax0*zmax*(hb - zmax)))/3 - (bb*hb*(hb - zmax)*(6*xmax^2*zmax + 6*xmax0^2*zmax + 3*xmax^2*(hb - zmax) + 3*xmax0^2*(hb - zmax) - 12*xmax*xmax0*zmax - 6*xmax*xmax0*(hb - zmax)))/3)/(hb^2*(xmax - xmax0)^2) + (bb*(hb - zmax)*(3*x^2 - 6*x*xmax0 + 3*xmax0^2))/(3*(xmax - xmax0)^2)) - x*(((bb*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))*(3*xmax^2*zmax^2 + 3*xmax0^2*zmax^2 + xmax^2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2 + xmax0^2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2 - 6*xmax*xmax0*zmax^2 - 2*xmax*xmax0*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2 - 3*xmax^2*zmax*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) - 3*xmax0^2*zmax*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) + 6*xmax*xmax0*zmax*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))))/3 + (bb*hb*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))*(3*xmax^2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) + 3*xmax0^2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) - 6*xmax^2*zmax - 6*xmax0^2*zmax - 6*xmax*xmax0*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) + 12*xmax*xmax0*zmax))/3)/(hb^2*(xmax - xmax0)^2) + (bb*(3*x^2 - 6*x*xmax0 + 3*xmax0^2)*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)))/(3*(xmax - xmax0)^2));


# x1xxbfvx0=x1xxbfvex(xf0);
# x1xxbfvx1=x1xxbfvex(xf1);
# x1xxbfvx2=x1xxbfvex(xf2);
# x1xxbfvx3=x1xxbfvex(xf3);
# x1xxbfvx4=x1xxbfvex(xf4);
# x1xxbfvx5=x1xxbfvex(xf5);
# x1xxbfvx6=x1xxbfvex(xf6);
# x1xxbfvx7=x1xxbfvex(xf7);
# x1xxbfvx8=x1xxbfvex(xf8);
# x1xxbfvx9=x1xxbfvex(xf9);
# ix1xxbfvv=0.5*(xmax-xmax0)*(x1xxbfvx0*gle0+x1xxbfvx1*gle1+x1xxbfvx2*gle2+x1xxbfvx3*gle3+x1xxbfvx4*gle4+x1xxbfvx5*gle5+x1xxbfvx6*gle6+x1xxbfvx7*gle7+x1xxbfvx8*gle8+x1xxbfvx9*gle9);
# x1xxbm(x,z)=x*xxbm(x,z);
# x1xxbmv(x,z)=-(x*((bb*z*(z^2 - 3*z*zmax + 3*zmax^2))/3 + (bb*hb*z*(3*z - 6*zmax))/3))/hb^2;
# x1xxbmx(x)=x1xxbmv(x,zmax)-x1xxbmv(x,zmax-hb);
# x1xxbmxv(x)=- (x*((bb*(hb - zmax)*((hb - zmax)^2 + 3*zmax*(hb - zmax) + 3*zmax^2))/3 - (bb*hb*(3*hb + 3*zmax)*(hb - zmax))/3))/hb^2 - (x*((bb*zmax^3)/3 - bb*hb*zmax^2))/hb^2;
# ix1xxbmve=int(x1xxbmxv(x),x,xmin0,xmax0);
# ix1xxbmvv=(bb*hb*(xmax0^2 - xmin0^2))/3;
# x1xxbr(x,z)=x*xxbr(x,z);
# x1xxbrv(x,z)=-x*(((bb*z*(xmin^2*z^2 - 3*xmin^2*z*zmax + 3*xmin^2*zmax^2 - 2*xmin*xmin0*z^2 + 6*xmin*xmin0*z*zmax - 6*xmin*xmin0*zmax^2 + xmin0^2*z^2 - 3*xmin0^2*z*zmax + 3*xmin0^2*zmax^2))/3 + (bb*hb*z*(3*xmin^2*z + 3*xmin0^2*z - 6*xmin^2*zmax - 6*xmin0^2*zmax - 6*xmin*xmin0*z + 12*xmin*xmin0*zmax))/3)/(hb^2*(xmin - xmin0)^2) + (bb*z*(3*x^2 - 6*x*xmin0 + 3*xmin0^2))/(3*(xmin - xmin0)^2));

# x1xxbrx(x)=x1xxbrv(x,psi1(x))-x1xxbrv(x,zmax-hb);
# x1xxbrvex(x)=- x*(((bb*(hb - zmax)*(3*xmin^2*zmax^2 + 3*xmin0^2*zmax^2 + xmin^2*(hb - zmax)^2 + xmin0^2*(hb - zmax)^2 - 6*xmin*xmin0*zmax^2 - 2*xmin*xmin0*(hb - zmax)^2 + 3*xmin^2*zmax*(hb - zmax) + 3*xmin0^2*zmax*(hb - zmax) - 6*xmin*xmin0*zmax*(hb - zmax)))/3 - (bb*hb*(hb - zmax)*(6*xmin^2*zmax + 6*xmin0^2*zmax + 3*xmin^2*(hb - zmax) + 3*xmin0^2*(hb - zmax) - 12*xmin*xmin0*zmax - 6*xmin*xmin0*(hb - zmax)))/3)/(hb^2*(xmin - xmin0)^2) + (bb*(hb - zmax)*(3*x^2 - 6*x*xmin0 + 3*xmin0^2))/(3*(xmin - xmin0)^2)) - x*(((bb*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))*(3*xmin^2*zmax^2 + 3*xmin0^2*zmax^2 + xmin^2*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2 + xmin0^2*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2 - 6*xmin*xmin0*zmax^2 - 2*xmin*xmin0*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2 - 3*xmin^2*zmax*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) - 3*xmin0^2*zmax*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) + 6*xmin*xmin0*zmax*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))))/3 + (bb*hb*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))*(3*xmin^2*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) + 3*xmin0^2*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) - 6*xmin^2*zmax - 6*xmin0^2*zmax - 6*xmin*xmin0*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) + 12*xmin*xmin0*zmax))/3)/(hb^2*(xmin - xmin0)^2) + (bb*(3*x^2 - 6*x*xmin0 + 3*xmin0^2)*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)))/(3*(xmin - xmin0)^2));


# x1xxbrvx0=x1xxbrvex(xr0);
# x1xxbrvx1=x1xxbrvex(xr1);
# x1xxbrvx2=x1xxbrvex(xr2);
# x1xxbrvx3=x1xxbrvex(xr3);
# x1xxbrvx4=x1xxbrvex(xr4);
# x1xxbrvx5=x1xxbrvex(xr5);
# x1xxbrvx6=x1xxbrvex(xr6);
# x1xxbrvx7=x1xxbrvex(xr7);
# x1xxbrvx8=x1xxbrvex(xr8);
# x1xxbrvx9=x1xxbrvex(xr9);
# ix1xxbrvv=0.5*(xmin0-xmin)*(x1xxbrvx0*gle0+x1xxbrvx1*gle1+x1xxbrvx2*gle2+x1xxbrvx3*gle3+x1xxbrvx4*gle4+x1xxbrvx5*gle5+x1xxbrvx6*gle6+x1xxbrvx7*gle7+x1xxbrvx8*gle8+x1xxbrvx9*gle9);
# z1xxbf(x,z)=int(2*z*fi2f(x,z),z);
# z1xxbfv(x,z)=- ((bb*z^2*(3*xmax^2*z^2 - 8*xmax^2*z*zmax + 6*xmax^2*zmax^2 - 6*xmax*xmax0*z^2 + 16*xmax*xmax0*z*zmax - 12*xmax*xmax0*zmax^2 + 3*xmax0^2*z^2 - 8*xmax0^2*z*zmax + 6*xmax0^2*zmax^2))/12 + (bb*hb*z^2*(8*xmax^2*z + 8*xmax0^2*z - 12*xmax^2*zmax - 12*xmax0^2*zmax - 16*xmax*xmax0*z + 24*xmax*xmax0*zmax))/12)/(hb^2*(xmax - xmax0)^2) - (bb*z^2*(6*x^2 - 12*x*xmax0 + 6*xmax0^2))/(12*(xmax - xmax0)^2);

# z1xxbfx(x)=z1xxbfv(x,psi2(x))-z1xxbfv(x,zmax-hb);
# z1xxbfvex(x)=((bb*(hb - zmax)^2*(6*xmax^2*zmax^2 + 6*xmax0^2*zmax^2 + 3*xmax^2*(hb - zmax)^2 + 3*xmax0^2*(hb - zmax)^2 - 12*xmax*xmax0*zmax^2 - 6*xmax*xmax0*(hb - zmax)^2 + 8*xmax^2*zmax*(hb - zmax) + 8*xmax0^2*zmax*(hb - zmax) - 16*xmax*xmax0*zmax*(hb - zmax)))/12 - (bb*hb*(hb - zmax)^2*(12*xmax^2*zmax + 12*xmax0^2*zmax + 8*xmax^2*(hb - zmax) + 8*xmax0^2*(hb - zmax) - 24*xmax*xmax0*zmax - 16*xmax*xmax0*(hb - zmax)))/12)/(hb^2*(xmax - xmax0)^2) - ((bb*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2*(6*xmax^2*zmax^2 + 6*xmax0^2*zmax^2 + 3*xmax^2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2 + 3*xmax0^2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2 - 12*xmax*xmax0*zmax^2 - 6*xmax*xmax0*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2 - 8*xmax^2*zmax*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) - 8*xmax0^2*zmax*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) + 16*xmax*xmax0*zmax*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))))/12 + (bb*hb*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2*(8*xmax^2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) + 8*xmax0^2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) - 12*xmax^2*zmax - 12*xmax0^2*zmax - 16*xmax*xmax0*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) + 24*xmax*xmax0*zmax))/12)/(hb^2*(xmax - xmax0)^2) - (bb*(6*x^2 - 12*x*xmax0 + 6*xmax0^2)*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2)/(12*(xmax - xmax0)^2) + (bb*(hb - zmax)^2*(6*x^2 - 12*x*xmax0 + 6*xmax0^2))/(12*(xmax - xmax0)^2);

# z1xxbfvx0=z1xxbfvex(xf0);
# z1xxbfvx1=z1xxbfvex(xf1);
# z1xxbfvx2=z1xxbfvex(xf2);
# z1xxbfvx3=z1xxbfvex(xf3);
# z1xxbfvx4=z1xxbfvex(xf4);
# z1xxbfvx5=z1xxbfvex(xf5);
# z1xxbfvx6=z1xxbfvex(xf6);
# z1xxbfvx7=z1xxbfvex(xf7);
# z1xxbfvx8=z1xxbfvex(xf8);
# z1xxbfvx9=z1xxbfvex(xf9);
# iz1xxbfvv=0.5*(xmax-xmax0)*(z1xxbfvx0*gle0+z1xxbfvx1*gle1+z1xxbfvx2*gle2+z1xxbfvx3*gle3+z1xxbfvx4*gle4+z1xxbfvx5*gle5+z1xxbfvx6*gle6+z1xxbfvx7*gle7+z1xxbfvx8*gle8+z1xxbfvx9*gle9);
# z1xxbm(x,z)=int(2*z*fi2m(x,z),z);
# z1xxbmv(x,z)=-((bb*z^2*(3*z^2 - 8*z*zmax + 6*zmax^2))/12 + (bb*hb*z^2*(8*z - 12*zmax))/12)/hb^2;
# z1xxbmx(x)=z1xxbmv(x,zmax)-z1xxbmv(x,zmax-hb);
# z1xxbmxv(x)=((bb*(hb - zmax)^2*(3*(hb - zmax)^2 + 8*zmax*(hb - zmax) + 6*zmax^2))/12 - (bb*hb*(8*hb + 4*zmax)*(hb - zmax)^2)/12)/hb^2 - ((bb*zmax^4)/12 - (bb*hb*zmax^3)/3)/hb^2;
# iz1xxbmve=int(z1xxbmxv(x),x,xmin0,xmax0);
# iz1xxbmvv=-(bb*hb*(5*hb - 8*zmax)*(xmax0 - xmin0))/12;
# z1xxbr(x,z)=int(2*z*fi2r(x,z),z);
# z1xxbrv(x,z)=- ((bb*z^2*(3*xmin^2*z^2 - 8*xmin^2*z*zmax + 6*xmin^2*zmax^2 - 6*xmin*xmin0*z^2 + 16*xmin*xmin0*z*zmax - 12*xmin*xmin0*zmax^2 + 3*xmin0^2*z^2 - 8*xmin0^2*z*zmax + 6*xmin0^2*zmax^2))/12 + (bb*hb*z^2*(8*xmin^2*z + 8*xmin0^2*z - 12*xmin^2*zmax - 12*xmin0^2*zmax - 16*xmin*xmin0*z + 24*xmin*xmin0*zmax))/12)/(hb^2*(xmin - xmin0)^2) - (bb*z^2*(6*x^2 - 12*x*xmin0 + 6*xmin0^2))/(12*(xmin - xmin0)^2);

# z1xxbrx(x)=z1xxbrv(x,psi1(x))-z1xxbrv(x,zmax-hb);
# z1xxbrvex(x)=((bb*(hb - zmax)^2*(6*xmin^2*zmax^2 + 6*xmin0^2*zmax^2 + 3*xmin^2*(hb - zmax)^2 + 3*xmin0^2*(hb - zmax)^2 - 12*xmin*xmin0*zmax^2 - 6*xmin*xmin0*(hb - zmax)^2 + 8*xmin^2*zmax*(hb - zmax) + 8*xmin0^2*zmax*(hb - zmax) - 16*xmin*xmin0*zmax*(hb - zmax)))/12 - (bb*hb*(hb - zmax)^2*(12*xmin^2*zmax + 12*xmin0^2*zmax + 8*xmin^2*(hb - zmax) + 8*xmin0^2*(hb - zmax) - 24*xmin*xmin0*zmax - 16*xmin*xmin0*(hb - zmax)))/12)/(hb^2*(xmin - xmin0)^2) - ((bb*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2*(6*xmin^2*zmax^2 + 6*xmin0^2*zmax^2 + 3*xmin^2*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2 + 3*xmin0^2*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2 - 12*xmin*xmin0*zmax^2 - 6*xmin*xmin0*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2 - 8*xmin^2*zmax*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) - 8*xmin0^2*zmax*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) + 16*xmin*xmin0*zmax*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))))/12 + (bb*hb*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2*(8*xmin^2*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) + 8*xmin0^2*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) - 12*xmin^2*zmax - 12*xmin0^2*zmax - 16*xmin*xmin0*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) + 24*xmin*xmin0*zmax))/12)/(hb^2*(xmin - xmin0)^2) - (bb*(6*x^2 - 12*x*xmin0 + 6*xmin0^2)*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2)/(12*(xmin - xmin0)^2) + (bb*(hb - zmax)^2*(6*x^2 - 12*x*xmin0 + 6*xmin0^2))/(12*(xmin - xmin0)^2);

# z1xxbrvx0=z1xxbrvex(xr0);
# z1xxbrvx1=z1xxbrvex(xr1);
# z1xxbrvx2=z1xxbrvex(xr2);
# z1xxbrvx3=z1xxbrvex(xr3);
# z1xxbrvx4=z1xxbrvex(xr4);
# z1xxbrvx5=z1xxbrvex(xr5);
# z1xxbrvx6=z1xxbrvex(xr6);
# z1xxbrvx7=z1xxbrvex(xr7);
# z1xxbrvx8=z1xxbrvex(xr8);
# z1xxbrvx9=z1xxbrvex(xr9);
# iz1xxbrvv=0.5*(xmin0-xmin)*(z1xxbrvx0*gle0+z1xxbrvx1*gle1+z1xxbrvx2*gle2+z1xxbrvx3*gle3+z1xxbrvx4*gle4+z1xxbrvx5*gle5+z1xxbrvx6*gle6+z1xxbrvx7*gle7+z1xxbrvx8*gle8+z1xxbrvx9*gle9);
# x1vb=ix1xxbfvv+ix1xxbmvv+ix1xxbrvv;
# z1vb=iz1xxbfvv+iz1xxbmvv+iz1xxbrvv;
# sxvb=x1vb-xo*vb;
# szvb=z1vb-zo*vb;


# a1snake(the,bh2o,xmin0,xmin)=tan(the)^2+hb^2*(xmin0-xmin)^(-2);
# b1snake(the,bh2o,hb,zmax,xmin0,xmin,xo)=2*(xo*tan(the)^2+(bh2o+hb-zmax)*tan(the)+xmin0*hb^2*(xmin0-xmin)^(-2));
# c1snake(the,bh2o,hb,zmax,xmin0,xmin,xo)=(xo*tan(the))^2+2*xo*(bh2o+hb-zmax)*tan(the)+(bh2o+hb-zmax)^2-(xmin^2-2*xmin0*xmin)*hb^2*(xmin0-xmin)^(-2);
# diskr1snake(the,bh2o,hb,zmax,xmin0,xmin,xo)=b1snake(the,bh2o,hb,zmax,xmin0,xmin,xo)^2-4*a1snake(the,bh2o,xmin0,xmin)*c1snake(the,bh2o,hb,zmax,xmin0,xmin,xo);
# xminsnake(the,bh2o,hb,zmax,xmin0,xmin,xo)=0.5*(b1snake(the,bh2o,hb,zmax,xmin0,xmin,xo)-diskr1snake(the,bh2o,hb,zmax,xmin0,xmin,xo)^(0.5))*a1snake(the,bh2o,xmin0,xmin)^(-1);
minsnake(the, bh2o) = (xo * tan(the)^2 + tan(the) * (bh2o + hb - zmax) - ((2 * xo * tan(the)^2 + 2 * tan(the) * (bh2o + hb - zmax) + (2 * hb^2 * xmin0) / (xmin - xmin0)^2)^2 - ((4 * hb^2) / (xmin - xmin0)^2 + 4 * tan(the)^2) * ((bh2o + hb - zmax)^2 + xo^2 * tan(the)^2 + (hb^2 * (-xmin^2 + 2 * xmin0 * xmin)) / (xmin - xmin0)^2 + 2 * xo * tan(the) * (bh2o + hb - zmax)))^(1 / 2) / 2 + (hb^2 * xmin0) / (xmin - xmin0)^2) / (hb^2 / (xmin - xmin0)^2 + tan(the)^2)

# a2snake(the,bh2o,xmax0,xmax)=tan(the)^2+hb^2*(xmax-xmax0)^(-2);
# b2snake(the,bh2o,hb,zmax,xmax,xmax0,xo)=2*(xo*tan(the)^2+(bh2o+hb-zmax)*tan(the)+xmax0*hb^2*(xmax-xmax0)^(-2));
# c2snake(the,bh2o,hb,zmax,xmax,xmax0,xo)=(xo*tan(the))^2+2*xo*(bh2o+hb-zmax)*tan(the)+(bh2o+hb-zmax)^2-(xmax^2-2*xmax0*xmax)*hb^2*(xmax-xmax0)^(-2);
# diskr2snake(the,bh2o,hb,zmax,xmax,xmax0,xo)=b2snake(the,bh2o,hb,zmax,xmax,xmax0,xo)^2-4*a2snake(the,bh2o,xmax,xmax0)*c2snake(the,bh2o,hb,zmax,xmax,xmax0,xo);
# xmaxsnake(the,bh2o,hb,zmax,xmax,xmax0,xo)=0.5*(b2snake(the,bh2o,hb,zmax,xmax,xmax0,xo)+diskr2snake(the,bh2o,hb,zmax,xmax,xmax0,xo)^(0.5))*a2snake(the,bh2o,xmax,xmax0)^(-1);
maxsnake(the, bh2o) = (xo * tan(the)^2 + tan(the) * (bh2o + hb - zmax) + ((2 * xo * tan(the)^2 + 2 * tan(the) * (bh2o + hb - zmax) + (2 * hb^2 * xmax0) / (xmax - xmax0)^2)^2 - ((4 * hb^2) / (xmax - xmax0)^2 + 4 * tan(the)^2) * ((bh2o + hb - zmax)^2 + xo^2 * tan(the)^2 + (hb^2 * (-xmax^2 + 2 * xmax0 * xmax)) / (xmax - xmax0)^2 + 2 * xo * tan(the) * (bh2o + hb - zmax)))^(1 / 2) / 2 + (hb^2 * xmax0) / (xmax - xmax0)^2) / (hb^2 / (xmax - xmax0)^2 + tan(the)^2)

xfsnake0(the, bh2o) = 0.5 * (xmax0 + maxsnake(the, bh2o)) + 0.5 * (maxsnake(the, bh2o) - xmax0) * xgle0
xfsnake1(the, bh2o) = 0.5 * (xmax0 + maxsnake(the, bh2o)) + 0.5 * (maxsnake(the, bh2o) - xmax0) * xgle1
xfsnake2(the, bh2o) = 0.5 * (xmax0 + maxsnake(the, bh2o)) + 0.5 * (maxsnake(the, bh2o) - xmax0) * xgle2
xfsnake3(the, bh2o) = 0.5 * (xmax0 + maxsnake(the, bh2o)) + 0.5 * (maxsnake(the, bh2o) - xmax0) * xgle3
xfsnake4(the, bh2o) = 0.5 * (xmax0 + maxsnake(the, bh2o)) + 0.5 * (maxsnake(the, bh2o) - xmax0) * xgle4
xfsnake5(the, bh2o) = 0.5 * (xmax0 + maxsnake(the, bh2o)) + 0.5 * (maxsnake(the, bh2o) - xmax0) * xgle5
xfsnake6(the, bh2o) = 0.5 * (xmax0 + maxsnake(the, bh2o)) + 0.5 * (maxsnake(the, bh2o) - xmax0) * xgle6
xfsnake7(the, bh2o) = 0.5 * (xmax0 + maxsnake(the, bh2o)) + 0.5 * (maxsnake(the, bh2o) - xmax0) * xgle7
xfsnake8(the, bh2o) = 0.5 * (xmax0 + maxsnake(the, bh2o)) + 0.5 * (maxsnake(the, bh2o) - xmax0) * xgle8
xfsnake9(the, bh2o) = 0.5 * (xmax0 + maxsnake(the, bh2o)) + 0.5 * (maxsnake(the, bh2o) - xmax0) * xgle9
xrsnake0(the, bh2o) = 0.5 * (xmin0 + minsnake(the, bh2o)) + 0.5 * (xmin0 - minsnake(the, bh2o)) * xgle0
xrsnake1(the, bh2o) = 0.5 * (xmin0 + minsnake(the, bh2o)) + 0.5 * (xmin0 - minsnake(the, bh2o)) * xgle1
xrsnake2(the, bh2o) = 0.5 * (xmin0 + minsnake(the, bh2o)) + 0.5 * (xmin0 - minsnake(the, bh2o)) * xgle2
xrsnake3(the, bh2o) = 0.5 * (xmin0 + minsnake(the, bh2o)) + 0.5 * (xmin0 - minsnake(the, bh2o)) * xgle3
xrsnake4(the, bh2o) = 0.5 * (xmin0 + minsnake(the, bh2o)) + 0.5 * (xmin0 - minsnake(the, bh2o)) * xgle4
xrsnake5(the, bh2o) = 0.5 * (xmin0 + minsnake(the, bh2o)) + 0.5 * (xmin0 - minsnake(the, bh2o)) * xgle5
xrsnake6(the, bh2o) = 0.5 * (xmin0 + minsnake(the, bh2o)) + 0.5 * (xmin0 - minsnake(the, bh2o)) * xgle6
xrsnake7(the, bh2o) = 0.5 * (xmin0 + minsnake(the, bh2o)) + 0.5 * (xmin0 - minsnake(the, bh2o)) * xgle7
xrsnake8(the, bh2o) = 0.5 * (xmin0 + minsnake(the, bh2o)) + 0.5 * (xmin0 - minsnake(the, bh2o)) * xgle8
xrsnake9(the, bh2o) = 0.5 * (xmin0 + minsnake(the, bh2o)) + 0.5 * (xmin0 - minsnake(the, bh2o)) * xgle9
# xx(x,z)=int(2*fi2m(x,z),z,-(x-xo)*tan(the)+bh2o,zmax);
# xxv(x)=(bb*(bh2o - zmax - x*tan(the) + xo*tan(the))^2*(bh2o + 3*hb - zmax - x*tan(the) + xo*tan(the)))/(3*hb^2);

# xxbmeh2o(x)=xxbme(x,zmax)-xxbme(x,-(x-xo)*tan(the)+bh2o);
# xxbmeh2ov(x)=((bb*(bh2o - tan(the)*(x - xo))*((bh2o - tan(the)*(x - xo))^2 - 3*zmax*(bh2o - tan(the)*(x - xo)) + 3*zmax^2))/3 - (bb*hb*(bh2o - tan(the)*(x - xo))*(6*zmax - 3*bh2o + 3*tan(the)*(x - xo)))/3)/hb^2 - ((bb*zmax^3)/3 - bb*hb*zmax^2)/hb^2;
# ixxbmeh2ov(x)=int(xxbmeh2o(x),x);
# ixxbmeh2ove(x)=(x*(bb*bh2o^3 - 3*bb*bh2o^2*zmax + 3*bb*hb*bh2o^2 + 3*bb*bh2o*zmax^2 - 6*bb*hb*bh2o*zmax - bb*zmax^3 + 3*bb*hb*zmax^2))/(3*hb^2) - ((x - xo)^2*(3*bb*tan(the)*bh2o^2 - 6*bb*tan(the)*bh2o*zmax + 6*bb*hb*tan(the)*bh2o + 3*bb*tan(the)*zmax^2 - 6*bb*hb*tan(the)*zmax))/(6*hb^2) + ((x - xo)^3*(3*bb*bh2o*tan(the)^2 + 3*bb*hb*tan(the)^2 - 3*bb*zmax*tan(the)^2))/(9*hb^2) - (bb*tan(the)^3*(x - xo)^4)/(12*hb^2);
# ixxbmeh2ovv=ixxbmeh2ove(xmax0)-ixxbmeh2ove(xmin0);
# vh2omte=((xmin0 - xo)^2*(3*bb*tan(the)*bh2o^2 - 6*bb*tan(the)*bh2o*zmax + 6*bb*hb*tan(the)*bh2o + 3*bb*tan(the)*zmax^2 - 6*bb*hb*tan(the)*zmax))/(6*hb^2) - ((xmax0 - xo)^2*(3*bb*tan(the)*bh2o^2 - 6*bb*tan(the)*bh2o*zmax + 6*bb*hb*tan(the)*bh2o + 3*bb*tan(the)*zmax^2 - 6*bb*hb*tan(the)*zmax))/(6*hb^2) + (xmax0*(bb*bh2o^3 - 3*bb*bh2o^2*zmax + 3*bb*hb*bh2o^2 + 3*bb*bh2o*zmax^2 - 6*bb*hb*bh2o*zmax - bb*zmax^3 + 3*bb*hb*zmax^2))/(3*hb^2) - (xmin0*(bb*bh2o^3 - 3*bb*bh2o^2*zmax + 3*bb*hb*bh2o^2 + 3*bb*bh2o*zmax^2 - 6*bb*hb*bh2o*zmax - bb*zmax^3 + 3*bb*hb*zmax^2))/(3*hb^2) + ((xmax0 - xo)^3*(3*bb*bh2o*tan(the)^2 + 3*bb*hb*tan(the)^2 - 3*bb*zmax*tan(the)^2))/(9*hb^2) - ((xmin0 - xo)^3*(3*bb*bh2o*tan(the)^2 + 3*bb*hb*tan(the)^2 - 3*bb*zmax*tan(the)^2))/(9*hb^2) - (bb*tan(the)^3*(xmax0 - xo)^4)/(12*hb^2) + (bb*tan(the)^3*(xmin0 - xo)^4)/(12*hb^2);

# vh2omtes=simplify(vh2omte);

# ixxv(x)=int(xxv(x),x);
# ixxve(x)=(x^3*(3*bb*bh2o*tan(the)^2 + 3*bb*hb*tan(the)^2 + 3*bb*xo*tan(the)^3 - 3*bb*zmax*tan(the)^2))/(9*hb^2) - (x^2*(3*bb*bh2o^2*tan(the) + 3*bb*zmax^2*tan(the) + 3*bb*xo^2*tan(the)^3 + 6*bb*bh2o*hb*tan(the) - 6*bb*bh2o*zmax*tan(the) - 6*bb*hb*zmax*tan(the) + 6*bb*bh2o*xo*tan(the)^2 + 6*bb*hb*xo*tan(the)^2 - 6*bb*xo*zmax*tan(the)^2))/(6*hb^2) + (x*(bb*bh2o^3 - bb*zmax^3 + 3*bb*hb*zmax^2 + bb*xo^3*tan(the)^3 + 3*bb*bh2o^2*hb + 3*bb*bh2o*zmax^2 - 3*bb*bh2o^2*zmax - 6*bb*bh2o*hb*zmax + 3*bb*bh2o*xo^2*tan(the)^2 + 3*bb*hb*xo^2*tan(the)^2 - 3*bb*xo^2*zmax*tan(the)^2 + 3*bb*bh2o^2*xo*tan(the) + 3*bb*xo*zmax^2*tan(the) - 6*bb*hb*xo*zmax*tan(the) + 6*bb*bh2o*hb*xo*tan(the) - 6*bb*bh2o*xo*zmax*tan(the)))/(3*hb^2) - (bb*x^4*tan(the)^3)/(12*hb^2);

# vh20mx(the,bh2o)=int(xxv(x),x,xmin0,xmax0);
# vh2omxt(the,bh2o)=xmax0^3*((bb*tan(the)^2*(bh2o + 3*hb - zmax))/(9*hb^2) - (2*bb*tan(the)^2*(bh2o - zmax))/(9*hb^2)) - xmin0^3*((bb*tan(the)^2*(bh2o + 3*hb - zmax))/(9*hb^2) - (2*bb*tan(the)^2*(bh2o - zmax))/(9*hb^2)) + xmax0^2*((bb*tan(the)*(bh2o - zmax)^2)/(6*hb^2) - (bb*tan(the)*(bh2o - zmax)*(bh2o + 3*hb - zmax))/(3*hb^2)) - xmin0^2*((bb*tan(the)*(bh2o - zmax)^2)/(6*hb^2) - (bb*tan(the)*(bh2o - zmax)*(bh2o + 3*hb - zmax))/(3*hb^2)) + (bb*xmax0^4*tan(the)^3)/(12*hb^2) - (bb*xmin0^4*tan(the)^3)/(12*hb^2) + (bb*xmax0*(bh2o - zmax)^2*(bh2o + 3*hb - zmax))/(3*hb^2) - (bb*xmin0*(bh2o - zmax)^2*(bh2o + 3*hb - zmax))/(3*hb^2);

# vh2oms(the,bh2o)=simplify(vh2omxt(the,bh2o));
vh2om(the, bh2o) = xmax0^3 * ((bb * tan(the)^2 * (bh2o + 3 * hb - zmax)) / (9 * hb^2) - (2 * bb * tan(the)^2 * (bh2o - zmax)) / (9 * hb^2)) - xmin0^3 * ((bb * tan(the)^2 * (bh2o + 3 * hb - zmax)) / (9 * hb^2) - (2 * bb * tan(the)^2 * (bh2o - zmax)) / (9 * hb^2)) + xmax0^2 * ((bb * tan(the) * (bh2o - zmax)^2) / (6 * hb^2) - (bb * tan(the) * (bh2o - zmax) * (bh2o + 3 * hb - zmax)) / (3 * hb^2)) - xmin0^2 * ((bb * tan(the) * (bh2o - zmax)^2) / (6 * hb^2) - (bb * tan(the) * (bh2o - zmax) * (bh2o + 3 * hb - zmax)) / (3 * hb^2)) + (bb * xmax0^4 * tan(the)^3) / (12 * hb^2) - (bb * xmin0^4 * tan(the)^3) / (12 * hb^2) + (bb * xmax0 * (bh2o - zmax)^2 * (bh2o + 3 * hb - zmax)) / (3 * hb^2) - (bb * xmin0 * (bh2o - zmax)^2 * (bh2o + 3 * hb - zmax)) / (3 * hb^2)

# ix1xxv(x)=int(x*xxv(x),x);

# ix1xxve(x)=(x^2*(bb*bh2o^3 - bb*zmax^3 + 3*bb*hb*zmax^2 + bb*xo^3*tan(the)^3 + 3*bb*bh2o^2*hb + 3*bb*bh2o*zmax^2 - 3*bb*bh2o^2*zmax - 6*bb*bh2o*hb*zmax + 3*bb*bh2o*xo^2*tan(the)^2 + 3*bb*hb*xo^2*tan(the)^2 - 3*bb*xo^2*zmax*tan(the)^2 + 3*bb*bh2o^2*xo*tan(the) + 3*bb*xo*zmax^2*tan(the) - 6*bb*hb*xo*zmax*tan(the) + 6*bb*bh2o*hb*xo*tan(the) - 6*bb*bh2o*xo*zmax*tan(the)))/(6*hb^2) + (x^4*(3*bb*bh2o*tan(the)^2 + 3*bb*hb*tan(the)^2 + 3*bb*xo*tan(the)^3 - 3*bb*zmax*tan(the)^2))/(12*hb^2) - (x^3*(3*bb*bh2o^2*tan(the) + 3*bb*zmax^2*tan(the) + 3*bb*xo^2*tan(the)^3 + 6*bb*bh2o*hb*tan(the) - 6*bb*bh2o*zmax*tan(the) - 6*bb*hb*zmax*tan(the) + 6*bb*bh2o*xo*tan(the)^2 + 6*bb*hb*xo*tan(the)^2 - 6*bb*xo*zmax*tan(the)^2))/(9*hb^2) - (bb*x^5*tan(the)^3)/(15*hb^2);
# ix1xxvv(the,bh2o)=ix1xxve(xmax0)-ix1xxve(xmin0);
x1vh2om(the, bh2o) = (xmax0^2 * (bb * bh2o^3 - bb * zmax^3 + 3 * bb * hb * zmax^2 + bb * xo^3 * tan(the)^3 + 3 * bb * bh2o^2 * hb + 3 * bb * bh2o * zmax^2 - 3 * bb * bh2o^2 * zmax - 6 * bb * bh2o * hb * zmax + 3 * bb * bh2o * xo^2 * tan(the)^2 + 3 * bb * hb * xo^2 * tan(the)^2 - 3 * bb * xo^2 * zmax * tan(the)^2 + 3 * bb * bh2o^2 * xo * tan(the) + 3 * bb * xo * zmax^2 * tan(the) - 6 * bb * hb * xo * zmax * tan(the) + 6 * bb * bh2o * hb * xo * tan(the) - 6 * bb * bh2o * xo * zmax * tan(the))) / (6 * hb^2) - (xmin0^2 * (bb * bh2o^3 - bb * zmax^3 + 3 * bb * hb * zmax^2 + bb * xo^3 * tan(the)^3 + 3 * bb * bh2o^2 * hb + 3 * bb * bh2o * zmax^2 - 3 * bb * bh2o^2 * zmax - 6 * bb * bh2o * hb * zmax + 3 * bb * bh2o * xo^2 * tan(the)^2 + 3 * bb * hb * xo^2 * tan(the)^2 - 3 * bb * xo^2 * zmax * tan(the)^2 + 3 * bb * bh2o^2 * xo * tan(the) + 3 * bb * xo * zmax^2 * tan(the) - 6 * bb * hb * xo * zmax * tan(the) + 6 * bb * bh2o * hb * xo * tan(the) - 6 * bb * bh2o * xo * zmax * tan(the))) / (6 * hb^2) + (xmax0^4 * (3 * bb * bh2o * tan(the)^2 + 3 * bb * hb * tan(the)^2 + 3 * bb * xo * tan(the)^3 - 3 * bb * zmax * tan(the)^2)) / (12 * hb^2) - (xmin0^4 * (3 * bb * bh2o * tan(the)^2 + 3 * bb * hb * tan(the)^2 + 3 * bb * xo * tan(the)^3 - 3 * bb * zmax * tan(the)^2)) / (12 * hb^2) - (xmax0^3 * (3 * bb * bh2o^2 * tan(the) + 3 * bb * zmax^2 * tan(the) + 3 * bb * xo^2 * tan(the)^3 + 6 * bb * bh2o * hb * tan(the) - 6 * bb * bh2o * zmax * tan(the) - 6 * bb * hb * zmax * tan(the) + 6 * bb * bh2o * xo * tan(the)^2 + 6 * bb * hb * xo * tan(the)^2 - 6 * bb * xo * zmax * tan(the)^2)) / (9 * hb^2) + (xmin0^3 * (3 * bb * bh2o^2 * tan(the) + 3 * bb * zmax^2 * tan(the) + 3 * bb * xo^2 * tan(the)^3 + 6 * bb * bh2o * hb * tan(the) - 6 * bb * bh2o * zmax * tan(the) - 6 * bb * hb * zmax * tan(the) + 6 * bb * bh2o * xo * tan(the)^2 + 6 * bb * hb * xo * tan(the)^2 - 6 * bb * xo * zmax * tan(the)^2)) / (9 * hb^2) - (bb * xmax0^5 * tan(the)^3) / (15 * hb^2) + (bb * xmin0^5 * tan(the)^3) / (15 * hb^2)

# xxf(x)=int(2*fi2f(x,z),z,-(x-xo)*tan(the)+bh2o,psi2(x));
# xxfv(x)=int(2*fi2f(x,z),z,-(x-xo)*tan(the)+bh2o,psi2(x));
xxfve(x, the, bh2o) = bb * (zmax - hb + hb * ((-x^2 + 2 * xmax0 * x + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2)) * ((-x^2 + 2 * xmax0 * x + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2 + (zmax * (2 * hb - zmax)) / hb^2 - 1) - (bb * (zmax - hb + hb * ((-x^2 + 2 * xmax0 * x + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2))^3) / (3 * hb^2) + (bb * (bh2o - tan(the) * (x - xo))^3) / (3 * hb^2) - bb * (bh2o - tan(the) * (x - xo)) * ((-x^2 + 2 * xmax0 * x + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2 + (zmax * (2 * hb - zmax)) / hb^2 - 1) - (bb * (2 * hb - 2 * zmax) * (zmax - hb + hb * ((-x^2 + 2 * xmax0 * x + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2))^2) / (2 * hb^2) + (bb * (2 * hb - 2 * zmax) * (bh2o - tan(the) * (x - xo))^2) / (2 * hb^2);

xxfvx0(the, bh2o) = xxfve(xfsnake0(the, bh2o), the, bh2o)
xxfvx1(the, bh2o) = xxfve(xfsnake1(the, bh2o), the, bh2o)
xxfvx2(the, bh2o) = xxfve(xfsnake2(the, bh2o), the, bh2o)
xxfvx3(the, bh2o) = xxfve(xfsnake3(the, bh2o), the, bh2o)
xxfvx4(the, bh2o) = xxfve(xfsnake4(the, bh2o), the, bh2o)
xxfvx5(the, bh2o) = xxfve(xfsnake5(the, bh2o), the, bh2o)
xxfvx6(the, bh2o) = xxfve(xfsnake6(the, bh2o), the, bh2o)
xxfvx7(the, bh2o) = xxfve(xfsnake7(the, bh2o), the, bh2o)
xxfvx8(the, bh2o) = xxfve(xfsnake8(the, bh2o), the, bh2o)
xxfvx9(the, bh2o) = xxfve(xfsnake9(the, bh2o), the, bh2o)
ixxfvv(the, bh2o) =
    0.5 *
    (maxsnake(the, bh2o) - xmax0) *
    (
        xxfvx0(the, bh2o) * gle0 +
        xxfvx1(the, bh2o) * gle1 +
        xxfvx2(the, bh2o) * gle2 +
        xxfvx3(the, bh2o) * gle3 +
        xxfvx4(the, bh2o) * gle4 +
        xxfvx5(the, bh2o) * gle5 +
        xxfvx6(the, bh2o) * gle6 +
        xxfvx7(the, bh2o) * gle7 +
        xxfvx8(the, bh2o) * gle8 +
        xxfvx9(the, bh2o) * gle9
    )

# ix1xxfve(x)=int(x*xxfve(x),x);
# ix1xxfvex(x)=(x^2*(bb*bh2o^3*xmax^2 - 2*bb*bh2o^3*xmax*xmax0 + bb*bh2o^3*xmax0^2 + 3*bb*bh2o^2*hb*xmax^2 - 6*bb*bh2o^2*hb*xmax*xmax0 + 3*bb*bh2o^2*hb*xmax0^2 - 3*bb*bh2o^2*xmax^2*zmax + 6*bb*bh2o^2*xmax*xmax0*zmax - 3*bb*bh2o^2*xmax0^2*zmax - 3*bb*bh2o*hb^2*xmax*xmax0 + 3*bb*bh2o*hb^2*xmax0^2 - 6*bb*bh2o*hb*xmax^2*zmax + 12*bb*bh2o*hb*xmax*xmax0*zmax - 6*bb*bh2o*hb*xmax0^2*zmax + 3*bb*bh2o*xmax^2*zmax^2 - 6*bb*bh2o*xmax*xmax0*zmax^2 + 3*bb*bh2o*xmax0^2*zmax^2 - 2*bb*hb^3*xmax^2 + bb*hb^3*xmax*xmax0 + bb*hb^3*xmax0^2 + 3*bb*hb^2*xmax*xmax0*zmax - 3*bb*hb^2*xmax0^2*zmax + 3*bb*hb*xmax^2*zmax^2 - 6*bb*hb*xmax*xmax0*zmax^2 + 3*bb*hb*xmax0^2*zmax^2 - bb*xmax^2*zmax^3 + 2*bb*xmax*xmax0*zmax^3 - bb*xmax0^2*zmax^3))/(2*(3*hb^2*xmax^2 - 6*hb^2*xmax*xmax0 + 3*hb^2*xmax0^2)) - (x^3*(3*bb*tan(the)*bh2o^2*xmax^2 - 6*bb*tan(the)*bh2o^2*xmax*xmax0 + 3*bb*tan(the)*bh2o^2*xmax0^2 + 6*bb*bh2o*hb^2*xmax0 + 6*bb*tan(the)*bh2o*hb*xmax^2 - 12*bb*tan(the)*bh2o*hb*xmax*xmax0 + 6*bb*tan(the)*bh2o*hb*xmax0^2 - 6*bb*tan(the)*bh2o*xmax^2*zmax + 12*bb*tan(the)*bh2o*xmax*xmax0*zmax - 6*bb*tan(the)*bh2o*xmax0^2*zmax + 6*bb*hb^3*xmax0 - 3*bb*tan(the)*hb^2*xmax*xmax0 + 3*bb*tan(the)*hb^2*xmax0^2 - 6*bb*hb^2*xmax0*zmax - 6*bb*tan(the)*hb*xmax^2*zmax + 12*bb*tan(the)*hb*xmax*xmax0*zmax - 6*bb*tan(the)*hb*xmax0^2*zmax + 3*bb*tan(the)*xmax^2*zmax^2 - 6*bb*tan(the)*xmax*xmax0*zmax^2 + 3*bb*tan(the)*xmax0^2*zmax^2))/(3*(3*hb^2*xmax^2 - 6*hb^2*xmax*xmax0 + 3*hb^2*xmax0^2)) - (x^5*(3*bb*hb^2*tan(the) + bb*xmax^2*tan(the)^3 + bb*xmax0^2*tan(the)^3 - 2*bb*xmax*xmax0*tan(the)^3))/(5*(3*hb^2*xmax^2 - 6*hb^2*xmax*xmax0 + 3*hb^2*xmax0^2)) - int((bb*hb*x*(x - xmax)*(x + xmax - 2*xmax0)*(- 2*x^2 + 4*xmax0*x + 2*xmax^2 - xmax0*xmax))/(3*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)*(xmax - xmax0)^4), x) + (x^4*(3*bb*hb^3 - 3*bb*hb^2*zmax + 3*bb*bh2o*hb^2 + 3*bb*bh2o*xmax^2*tan(the)^2 + 3*bb*bh2o*xmax0^2*tan(the)^2 + 3*bb*hb*xmax^2*tan(the)^2 + 3*bb*hb*xmax0^2*tan(the)^2 - 3*bb*xmax^2*zmax*tan(the)^2 - 3*bb*xmax0^2*zmax*tan(the)^2 + 6*bb*hb^2*xmax0*tan(the) - 6*bb*bh2o*xmax*xmax0*tan(the)^2 - 6*bb*hb*xmax*xmax0*tan(the)^2 + 6*bb*xmax*xmax0*zmax*tan(the)^2))/(4*(3*hb^2*xmax^2 - 6*hb^2*xmax*xmax0 + 3*hb^2*xmax0^2));

x1xxfve(x, the, bh2o) = x * xxfve(x, the, bh2o);
x1xxfvx0(the, bh2o) = x1xxfve(xfsnake0(the, bh2o), the, bh2o)
x1xxfvx1(the, bh2o) = x1xxfve(xfsnake1(the, bh2o), the, bh2o)
x1xxfvx2(the, bh2o) = x1xxfve(xfsnake2(the, bh2o), the, bh2o)
x1xxfvx3(the, bh2o) = x1xxfve(xfsnake3(the, bh2o), the, bh2o)
x1xxfvx4(the, bh2o) = x1xxfve(xfsnake4(the, bh2o), the, bh2o)
x1xxfvx5(the, bh2o) = x1xxfve(xfsnake5(the, bh2o), the, bh2o)
x1xxfvx6(the, bh2o) = x1xxfve(xfsnake6(the, bh2o), the, bh2o)
x1xxfvx7(the, bh2o) = x1xxfve(xfsnake7(the, bh2o), the, bh2o)
x1xxfvx8(the, bh2o) = x1xxfve(xfsnake8(the, bh2o), the, bh2o)
x1xxfvx9(the, bh2o) = x1xxfve(xfsnake9(the, bh2o), the, bh2o)
ix1xxfvv(the, bh2o) = 0.5 * (maxsnake(the, bh2o) - xmax0) * (x1xxfvx0(the, bh2o) * gle0 + x1xxfvx1(the, bh2o) * gle1 + x1xxfvx2(the, bh2o) * gle2 + x1xxfvx3(the, bh2o) * gle3 +
                                                             x1xxfvx4(the, bh2o) * gle4 + x1xxfvx5(the, bh2o) * gle5 + x1xxfvx6(the, bh2o) * gle6 + x1xxfvx7(the, bh2o) * gle7 + x1xxfvx8(the, bh2o) * gle8 + x1xxfvx9(the, bh2o) * gle9);

vh2ofn(the, bh2o) = ixxfvv(the, bh2o)

# xxr(x)=int(2*fi2r(x,z),z,-(x-xo)*tan(the)+bh2o,psi1(x));
xxrve(x, the, bh2o) = bb * (zmax - hb + hb * ((-x^2 + 2 * xmin0 * x + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2)) * ((-x^2 + 2 * xmin0 * x + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2 + (zmax * (2 * hb - zmax)) / hb^2 - 1) - (bb * (zmax - hb + hb * ((-x^2 + 2 * xmin0 * x + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2))^3) / (3 * hb^2) + (bb * (bh2o - tan(the) * (x - xo))^3) / (3 * hb^2) - bb * (bh2o - tan(the) * (x - xo)) * ((-x^2 + 2 * xmin0 * x + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2 + (zmax * (2 * hb - zmax)) / hb^2 - 1) - (bb * (2 * hb - 2 * zmax) * (zmax - hb + hb * ((-x^2 + 2 * xmin0 * x + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2))^2) / (2 * hb^2) + (bb * (2 * hb - 2 * zmax) * (bh2o - tan(the) * (x - xo))^2) / (2 * hb^2);
xxrvx0(the, bh2o) = xxrve(xrsnake0(the, bh2o), the, bh2o)
xxrvx1(the, bh2o) = xxrve(xrsnake1(the, bh2o), the, bh2o)
xxrvx2(the, bh2o) = xxrve(xrsnake2(the, bh2o), the, bh2o)
xxrvx3(the, bh2o) = xxrve(xrsnake3(the, bh2o), the, bh2o)
xxrvx4(the, bh2o) = xxrve(xrsnake4(the, bh2o), the, bh2o)
xxrvx5(the, bh2o) = xxrve(xrsnake5(the, bh2o), the, bh2o)
xxrvx6(the, bh2o) = xxrve(xrsnake6(the, bh2o), the, bh2o)
xxrvx7(the, bh2o) = xxrve(xrsnake7(the, bh2o), the, bh2o)
xxrvx8(the, bh2o) = xxrve(xrsnake8(the, bh2o), the, bh2o)
xxrvx9(the, bh2o) = xxrve(xrsnake9(the, bh2o), the, bh2o)
ixxrvv(the, bh2o) = 0.5 * (xmin0 - minsnake(the, bh2o)) * (xxrvx0(the, bh2o) * gle0 + xxrvx1(the, bh2o) * gle1 + xxrvx2(the, bh2o) * gle2 +
                                                           xxrvx3(the, bh2o) * gle3 + xxrvx4(the, bh2o) * gle4 + xxrvx5(the, bh2o) * gle5 + xxrvx6(the, bh2o) * gle6 + xxrvx7(the, bh2o) * gle7 + xxrvx8(the, bh2o) * gle8 + xxrvx9(the, bh2o) * gle9)
# ixxrve(x)=int(xxrve(x),x);


vh2orn(the, bh2o) = ixxrvv(the, bh2o)
# ix1xxrve(x)=int(x*xxrve(x),x);
# ix1xxrvex(x)=(x^2*(bb*bh2o^3*xmin^2 - 2*bb*bh2o^3*xmin*xmin0 + bb*bh2o^3*xmin0^2 + 3*bb*bh2o^2*hb*xmin^2 - 6*bb*bh2o^2*hb*xmin*xmin0 + 3*bb*bh2o^2*hb*xmin0^2 - 3*bb*bh2o^2*xmin^2*zmax + 6*bb*bh2o^2*xmin*xmin0*zmax - 3*bb*bh2o^2*xmin0^2*zmax - 3*bb*bh2o*hb^2*xmin*xmin0 + 3*bb*bh2o*hb^2*xmin0^2 - 6*bb*bh2o*hb*xmin^2*zmax + 12*bb*bh2o*hb*xmin*xmin0*zmax - 6*bb*bh2o*hb*xmin0^2*zmax + 3*bb*bh2o*xmin^2*zmax^2 - 6*bb*bh2o*xmin*xmin0*zmax^2 + 3*bb*bh2o*xmin0^2*zmax^2 - 2*bb*hb^3*xmin^2 + bb*hb^3*xmin*xmin0 + bb*hb^3*xmin0^2 + 3*bb*hb^2*xmin*xmin0*zmax - 3*bb*hb^2*xmin0^2*zmax + 3*bb*hb*xmin^2*zmax^2 - 6*bb*hb*xmin*xmin0*zmax^2 + 3*bb*hb*xmin0^2*zmax^2 - bb*xmin^2*zmax^3 + 2*bb*xmin*xmin0*zmax^3 - bb*xmin0^2*zmax^3))/(2*(3*hb^2*xmin^2 - 6*hb^2*xmin*xmin0 + 3*hb^2*xmin0^2)) - (x^3*(3*bb*tan(the)*bh2o^2*xmin^2 - 6*bb*tan(the)*bh2o^2*xmin*xmin0 + 3*bb*tan(the)*bh2o^2*xmin0^2 + 6*bb*bh2o*hb^2*xmin0 + 6*bb*tan(the)*bh2o*hb*xmin^2 - 12*bb*tan(the)*bh2o*hb*xmin*xmin0 + 6*bb*tan(the)*bh2o*hb*xmin0^2 - 6*bb*tan(the)*bh2o*xmin^2*zmax + 12*bb*tan(the)*bh2o*xmin*xmin0*zmax - 6*bb*tan(the)*bh2o*xmin0^2*zmax + 6*bb*hb^3*xmin0 - 3*bb*tan(the)*hb^2*xmin*xmin0 + 3*bb*tan(the)*hb^2*xmin0^2 - 6*bb*hb^2*xmin0*zmax - 6*bb*tan(the)*hb*xmin^2*zmax + 12*bb*tan(the)*hb*xmin*xmin0*zmax - 6*bb*tan(the)*hb*xmin0^2*zmax + 3*bb*tan(the)*xmin^2*zmax^2 - 6*bb*tan(the)*xmin*xmin0*zmax^2 + 3*bb*tan(the)*xmin0^2*zmax^2))/(3*(3*hb^2*xmin^2 - 6*hb^2*xmin*xmin0 + 3*hb^2*xmin0^2)) - (x^5*(3*bb*hb^2*tan(the) + bb*xmin^2*tan(the)^3 + bb*xmin0^2*tan(the)^3 - 2*bb*xmin*xmin0*tan(the)^3))/(5*(3*hb^2*xmin^2 - 6*hb^2*xmin*xmin0 + 3*hb^2*xmin0^2)) - int((bb*hb*x*(x - xmin)*(x + xmin - 2*xmin0)*(- 2*x^2 + 4*xmin0*x + 2*xmin^2 - xmin0*xmin))/(3*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)*(xmin - xmin0)^4), x) + (x^4*(3*bb*hb^3 - 3*bb*hb^2*zmax + 3*bb*bh2o*hb^2 + 3*bb*bh2o*xmin^2*tan(the)^2 + 3*bb*bh2o*xmin0^2*tan(the)^2 + 3*bb*hb*xmin^2*tan(the)^2 + 3*bb*hb*xmin0^2*tan(the)^2 - 3*bb*xmin^2*zmax*tan(the)^2 - 3*bb*xmin0^2*zmax*tan(the)^2 + 6*bb*hb^2*xmin0*tan(the) - 6*bb*bh2o*xmin*xmin0*tan(the)^2 - 6*bb*hb*xmin*xmin0*tan(the)^2 + 6*bb*xmin*xmin0*zmax*tan(the)^2))/(4*(3*hb^2*xmin^2 - 6*hb^2*xmin*xmin0 + 3*hb^2*xmin0^2));

x1xxrve(x, the, bh2o) = x * xxrve(x, the, bh2o)
x1xxrvx0(the, bh2o) = x1xxrve(xrsnake0(the, bh2o), the, bh2o)
x1xxrvx1(the, bh2o) = x1xxrve(xrsnake1(the, bh2o), the, bh2o)
x1xxrvx2(the, bh2o) = x1xxrve(xrsnake2(the, bh2o), the, bh2o)
x1xxrvx3(the, bh2o) = x1xxrve(xrsnake3(the, bh2o), the, bh2o)
x1xxrvx4(the, bh2o) = x1xxrve(xrsnake4(the, bh2o), the, bh2o)
x1xxrvx5(the, bh2o) = x1xxrve(xrsnake5(the, bh2o), the, bh2o)
x1xxrvx6(the, bh2o) = x1xxrve(xrsnake6(the, bh2o), the, bh2o)
x1xxrvx7(the, bh2o) = x1xxrve(xrsnake7(the, bh2o), the, bh2o)
x1xxrvx8(the, bh2o) = x1xxrve(xrsnake8(the, bh2o), the, bh2o)
x1xxrvx9(the, bh2o) = x1xxrve(xrsnake9(the, bh2o), the, bh2o)
ix1xxrvv(the, bh2o) = 0.5 * (xmin0 - minsnake(the, bh2o)) * (x1xxrvx0(the, bh2o) * gle0 + x1xxrvx1(the, bh2o) * gle1 + x1xxrvx2(the, bh2o) * gle2
                                                             + x1xxrvx3(the, bh2o) * gle3 + x1xxrvx4(the, bh2o) * gle4 + x1xxrvx5(the, bh2o) * gle5 + x1xxrvx6(the, bh2o) * gle6
                                                             + x1xxrvx7(the, bh2o) * gle7 + x1xxrvx8(the, bh2o) * gle8 + x1xxrvx9(the, bh2o) * gle9);

x1vh2o(the, bh2o) = ix1xxrvv(the, bh2o) + x1vh2om(the, bh2o) + ix1xxfvv(the, bh2o)

function bisectionMethodError(f, a, b, tol; maxiter = 200) #f=@(x)x^2-3; a=1; b=2; (ensure change of sign between a and b) error=1e-4
    c = (a + b) / 2
    ftry(x) =
        try
            f(x)
        catch
            1.0
        end

    iter = 1
    while abs(ftry(c)) > tol
        if ftry(c) < 0 && ftry(a) < 0
            a = c
        else
            b = c
        end
        c = (a + b) / 2
        iter += 1
        iter < maxiter || throw(DomainError("Maximum number of iterations reached in bisectionMethodError $iter."))
    end
    return c
end

vh2o(the, bh2o) = vh2ofn(the, bh2o) + vh2om(the, bh2o) + vh2orn(the, bh2o)

const vh2o_0 = m_total / rhoh2o
find_bh2o(the) = (bh2o) -> vh2o_0 - vh2o(the, bh2o)
bh2o0(the) = bisectionMethodError(find_bh2o(the), zmax - hb + 1e-10, zmax - 1e-10, 1e-10) # (zmax=>bh2o=>zmax-hb)

# inbfnah20(x)=inbf(x,psi2(x))-inbf(x,-(x-xo)*tan(the)+bh2o);
# inbfnah2o(x)=(hb*((bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)/(xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4) + (bb^2*(- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax))/(hb^2*(xmax - xmax0)^2))^(1/2)*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))/2 - (((bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)/(xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4) + (bb^2*(2*bh2o + 2*hb - 2*zmax - 2*tan(the)*(x - xo))^2)/(4*hb^4))^(1/2)*(2*bh2o + 2*hb - 2*zmax - 2*tan(the)*(x - xo)))/4 - (log((bb^2/hb^4)^(1/2)*(bh2o + hb - zmax - tan(the)*(x - xo)) + ((bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)/(xmax - xmax0)^4 + (bb^2*(bh2o + hb - zmax - tan(the)*(x - xo))^2)/hb^4)^(1/2))*(bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4))/(4*(bb^2/(4*hb^4))^(1/2)*(xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)) + (log(((bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4)/(xmax - xmax0)^4 + (bb^2*(- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax))/(hb^2*(xmax - xmax0)^2))^(1/2) + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)*(bb^2/hb^4)^(1/2))*(bb^2*x^2 - 2*bb^2*x*xmax0 + bb^2*xmax0^2 + xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4))/(4*(bb^2/(4*hb^4))^(1/2)*(xmax^4 - 4*xmax^3*xmax0 + 6*xmax^2*xmax0^2 - 4*xmax*xmax0^3 + xmax0^4));

# inbfvh2o0=inbfnah2o(xfsnake0);
# inbfvh2o1=inbfnah2o(xfsnake1);
# inbfvh2o2=inbfnah2o(xfsnake2);
# inbfvh2o3=inbfnah2o(xfsnake3);
# inbfvh2o4=inbfnah2o(xfsnake4);
# inbfvh2o5=inbfnah2o(xfsnake5);
# inbfvh2o6=inbfnah2o(xfsnake6);
# inbfvh2o7=inbfnah2o(xfsnake7);
# inbfvh2o8=inbfnah2o(xfsnake8);
# inbfvh2o9=inbfnah2o(xfsnake9);
# iinbfh2ovv(the,bh2o)=0.5*(maxsnake(the,bh2o)-xmax0)*(inbfvh2o0*gle0+inbfvh2o1*gle1+inbfvh2o2*gle2+inbfvh2o3*gle3+inbfvh2o4*gle4+inbfvh2o5*gle5+inbfvh2o6*gle6+inbfvh2o7*gle7+inbfvh2o8*gle8+inbfvh2o9*gle9);

# inbmnah20(x)=inbmv(zmax)-inbmv(-(x-xo)*tan(the)+bh2o);
# inbmnah2o(x)=asinh(hb*(bb^2/hb^4)^(1/2))/(2*(bb^2/hb^4)^(1/2)) - asinh(((bb^2/hb^4)^(1/2)*(2*bh2o + 2*hb - 2*zmax - 2*tan(the)*(x - xo)))/2)/(2*(bb^2/hb^4)^(1/2)) + (hb*(bb^2/hb^2 + 1)^(1/2))/2 - (((bb^2*(2*bh2o + 2*hb - 2*zmax - 2*tan(the)*(x - xo))^2)/(4*hb^4) + 1)^(1/2)*(2*bh2o + 2*hb - 2*zmax - 2*tan(the)*(x - xo)))/4;
# inbmvh2o0=inbmnah2o(xm0);
# inbmvh2o1=inbmnah2o(xm1);
# inbmvh2o2=inbmnah2o(xm2);
# inbmvh2o3=inbmnah2o(xm3);
# inbmvh2o4=inbmnah2o(xm4);
# inbmvh2o5=inbmnah2o(xm5);
# inbmvh2o6=inbmnah2o(xm6);
# inbmvh2o7=inbmnah2o(xm7);
# inbmvh2o8=inbmnah2o(xm8);
# inbmvh2o9=inbmnah2o(xm9);
# iinbmh2ovv(the,bh2o)=0.5*(xmax0-xmin0)*(inbmvh2o0*gle0+inbmvh2o1*gle1+inbmvh2o2*gle2+inbmvh2o3*gle3+inbmvh2o4*gle4+inbmvh2o5*gle5+inbmvh2o6*gle6+inbmvh2o7*gle7+inbmvh2o8*gle8+inbmvh2o9*gle9);

# inbrnah20(x)=inbr(x,psi1(x))-inbr(x,-(x-xo)*tan(the)+bh2o);
# inbrnah2o(x)=(hb*((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4) + (bb^2*(- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin))/(hb^2*(xmin - xmin0)^2))^(1/2)*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))/2 - (((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4) + (bb^2*(2*bh2o + 2*hb - 2*zmax - 2*tan(the)*(x - xo))^2)/(4*hb^4))^(1/2)*(2*bh2o + 2*hb - 2*zmax - 2*tan(the)*(x - xo)))/4 - (log((bb^2/hb^4)^(1/2)*(bh2o + hb - zmax - tan(the)*(x - xo)) + ((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin - xmin0)^4 + (bb^2*(bh2o + hb - zmax - tan(the)*(x - xo))^2)/hb^4)^(1/2))*(bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4))/(4*(bb^2/(4*hb^4))^(1/2)*(xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)) + (log(((bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4)/(xmin - xmin0)^4 + (bb^2*(- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin))/(hb^2*(xmin - xmin0)^2))^(1/2) + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)*(bb^2/hb^4)^(1/2))*(bb^2*x^2 - 2*bb^2*x*xmin0 + bb^2*xmin0^2 + xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4))/(4*(bb^2/(4*hb^4))^(1/2)*(xmin^4 - 4*xmin^3*xmin0 + 6*xmin^2*xmin0^2 - 4*xmin*xmin0^3 + xmin0^4));
# inbrvh2o0=inbrnah2o(xrsnake0);
# inbrvh2o1=inbrnah2o(xrsnake1);
# inbrvh2o2=inbrnah2o(xrsnake2);
# inbrvh2o3=inbrnah2o(xrsnake3);
# inbrvh2o4=inbrnah2o(xrsnake4);
# inbrvh2o5=inbrnah2o(xrsnake5);
# inbrvh2o6=inbrnah2o(xrsnake6);
# inbrvh2o7=inbrnah2o(xrsnake7);
# inbrvh2o8=inbrnah2o(xrsnake8);
# inbrvh2o9=inbrnah2o(xrsnake9);
# iinbrh2ovv(the,bh2o)=0.5*(xmin0-minsnake(the,bh2o))*(inbrvh2o0*gle0+inbrvh2o1*gle1+inbrvh2o2*gle2+inbrvh2o3*gle3+inbrvh2o4*gle4+inbrvh2o5*gle5+inbrvh2o6*gle6+inbrvh2o7*gle7+inbrvh2o8*gle8+inbrvh2o9*gle9);

# svbh2o(the,bh2o)=2*iinbfh2ovv(the,bh2o)+2*iinbmh2ovv(the,bh2o)+2*iinbrh2ovv(the,bh2o);
# x1ibfnah2o(x)=x*inbfnah2o(x);
# x1inbfvh2o0=x1ibfnah2o(xfsnake0);
# x1inbfvh2o1=x1ibfnah2o(xfsnake1);
# x1inbfvh2o2=x1ibfnah2o(xfsnake2);
# x1inbfvh2o3=x1ibfnah2o(xfsnake3);
# x1inbfvh2o4=x1ibfnah2o(xfsnake4);
# x1inbfvh2o5=x1ibfnah2o(xfsnake5);
# x1inbfvh2o6=x1ibfnah2o(xfsnake6);
# x1inbfvh2o7=x1ibfnah2o(xfsnake7);
# x1inbfvh2o8=x1ibfnah2o(xfsnake8);
# x1inbfvh2o9=x1ibfnah2o(xfsnake9);
# ix1inbfh2ovv(the,bh2o)=0.5*(maxsnake(the,bh2o)-xmax0)*(x1inbfvh2o0*gle0+x1inbfvh2o1*gle1+x1inbfvh2o2*gle2+x1inbfvh2o3*gle3+x1inbfvh2o4*gle4+x1inbfvh2o5*gle5+x1inbfvh2o6*gle6+x1inbfvh2o7*gle7+x1inbfvh2o8*gle8+x1inbfvh2o9*gle9);

# x1inbmnah2o(x)=x*(asinh(hb*(bb^2/hb^4)^(1/2))/(2*(bb^2/hb^4)^(1/2)) - asinh(((bb^2/hb^4)^(1/2)*(2*bh2o + 2*hb - 2*zmax - 2*tan(the)*(x - xo)))/2)/(2*(bb^2/hb^4)^(1/2)) + (hb*(bb^2/hb^2 + 1)^(1/2))/2 - (((bb^2*(2*bh2o + 2*hb - 2*zmax - 2*tan(the)*(x - xo))^2)/(4*hb^4) + 1)^(1/2)*(2*bh2o + 2*hb - 2*zmax - 2*tan(the)*(x - xo)))/4);
# x1inbmvh2o0=x1inbmnah2o(xm0);
# x1inbmvh2o1=x1inbmnah2o(xm1);
# x1inbmvh2o2=x1inbmnah2o(xm2);
# x1inbmvh2o3=x1inbmnah2o(xm3);
# x1inbmvh2o4=x1inbmnah2o(xm4);
# x1inbmvh2o5=x1inbmnah2o(xm5);
# x1inbmvh2o6=x1inbmnah2o(xm6);
# x1inbmvh2o7=x1inbmnah2o(xm7);
# x1inbmvh2o8=x1inbmnah2o(xm8);
# x1inbmvh2o9=x1inbmnah2o(xm9);
# ix1inbmh2ovv(the,bh2o)=0.5*(xmax0-xmin0)*(x1inbmvh2o0*gle0+x1inbmvh2o1*gle1+x1inbmvh2o2*gle2+x1inbmvh2o3*gle3+x1inbmvh2o4*gle4+x1inbmvh2o5*gle5+x1inbmvh2o6*gle6+x1inbmvh2o7*gle7+x1inbmvh2o8*gle8+x1inbmvh2o9*gle9);

# x1ibrnah2o(x)=x*inbrnah2o(x);
# x1inbrvh2o0=x1ibrnah2o(xrsnake0);
# x1inbrvh2o1=x1ibrnah2o(xrsnake1);
# x1inbrvh2o2=x1ibrnah2o(xrsnake2);
# x1inbrvh2o3=x1ibrnah2o(xrsnake3);
# x1inbrvh2o4=x1ibrnah2o(xrsnake4);
# x1inbrvh2o5=x1ibrnah2o(xrsnake5);
# x1inbrvh2o6=x1ibrnah2o(xrsnake6);
# x1inbrvh2o7=x1ibrnah2o(xrsnake7);
# x1inbrvh2o8=x1ibrnah2o(xrsnake8);
# x1inbrvh2o9=x1ibrnah2o(xrsnake9);
# ix1inbrh2ovv(the,bh2o)=0.5*(xmin0-minsnake(the,bh2o))*(x1inbrvh2o0*gle0+x1inbrvh2o1*gle1+x1inbrvh2o2*gle2+x1inbrvh2o3*gle3+x1inbrvh2o4*gle4+x1inbrvh2o5*gle5+x1inbrvh2o6*gle6+x1inbrvh2o7*gle7+x1inbrvh2o8*gle8+x1inbrvh2o9*gle9);

# sxsvbh2o(the,bh2o)=2*ix1inbfh2ovv(the,bh2o)+2*ix1inbmh2ovv(the,bh2o)+2*ix1inbrh2ovv(the,bh2o)-xo*svbh2o(the,bh2o);
# xsvbh2o(the,bh2o)=sxsvbh2o(the,bh2o)/svbh2o(the,bh2o);
# z1inbfnah2on(x)=z1inbfe(psi2(x));
# z1inbfnah2ov(x)=z1inbfe(-(x-xo)*tan(the)+bh2o);

# z1inbfnah2onx(x)=(log(2*(c2 + b2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) + a2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2)^(1/2) + (b2 + 2*a2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)))/a2^(1/2))*(b2^3 - 4*a2*c2*b2))/(16*a2^(5/2)) + ((c2 + b2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2)) + a2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2)^(1/2)*(- 3*b2^2 + 2*a2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))*b2 + 8*a2*(c2 + a2*(zmax - hb + hb*((- x^2 + 2*xmax0*x + xmax^2 - 2*xmax0*xmax)/(xmax - xmax0)^2)^(1/2))^2)))/(24*a2^2);
# z1inbfnah2ovx(x)=((c2 + b2*(bh2o - tan(the)*(x - xo)) + a2*(bh2o - tan(the)*(x - xo))^2)^(1/2)*(- 3*b2^2 + 2*a2*(bh2o - tan(the)*(x - xo))*b2 + 8*a2*(c2 + a2*(bh2o - tan(the)*(x - xo))^2)))/(24*a2^2) + (log((b2 + 2*a2*(bh2o - tan(the)*(x - xo)))/a2^(1/2) + 2*(c2 + b2*(bh2o - tan(the)*(x - xo)) + a2*(bh2o - tan(the)*(x - xo))^2)^(1/2))*(b2^3 - 4*a2*c2*b2))/(16*a2^(5/2));
# z1inbfnah2ox(x)=z1inbfnah2onx(x)-z1inbfnah2ovx(x);
# z1inbfvh2o0=z1inbfnah2ox(xfsnake0);
# z1inbfvh2o1=z1inbfnah2ox(xfsnake1);
# z1inbfvh2o2=z1inbfnah2ox(xfsnake2);
# z1inbfvh2o3=z1inbfnah2ox(xfsnake3);
# z1inbfvh2o4=z1inbfnah2ox(xfsnake4);
# z1inbfvh2o5=z1inbfnah2ox(xfsnake5);
# z1inbfvh2o6=z1inbfnah2ox(xfsnake6);
# z1inbfvh2o7=z1inbfnah2ox(xfsnake7);
# z1inbfvh2o8=z1inbfnah2ox(xfsnake8);
# z1inbfvh2o9=z1inbfnah2ox(xfsnake9);
# iz1inbfh2ovv(the,bh2o)=0.5*(maxsnake(the,bh2o)-xmax0)*(z1inbfvh2o0*gle0+z1inbfvh2o1*gle1+z1inbfvh2o2*gle2+z1inbfvh2o3*gle3+z1inbfvh2o4*gle4+z1inbfvh2o5*gle5+z1inbfvh2o6*gle6+z1inbfvh2o7*gle7+z1inbfvh2o8*gle8+z1inbfvh2o9*gle9);

# z1inbmnah2on=z1inbm(zmax);
# z1inbmnah2ov(x)=z1inbm(-(x-xo)*tan(the)+bh2o);
# z1inbmnah2onv=(log((b0 + 2*a0*zmax)/a0^(1/2) + 2*(a0*zmax^2 + b0*zmax + c0)^(1/2))*(b0^3 - 4*a0*c0*b0))/(16*a0^(5/2)) + ((- 3*b0^2 + 2*a0*zmax*b0 + 8*a0*(a0*zmax^2 + c0))*(a0*zmax^2 + b0*zmax + c0)^(1/2))/(24*a0^2);
# z1inbmnah2ovx(x)=((c0 + b0*(bh2o - tan(the)*(x - xo)) + a0*(bh2o - tan(the)*(x - xo))^2)^(1/2)*(- 3*b0^2 + 2*a0*(bh2o - tan(the)*(x - xo))*b0 + 8*a0*(c0 + a0*(bh2o - tan(the)*(x - xo))^2)))/(24*a0^2) + (log((b0 + 2*a0*(bh2o - tan(the)*(x - xo)))/a0^(1/2) + 2*(c0 + b0*(bh2o - tan(the)*(x - xo)) + a0*(bh2o - tan(the)*(x - xo))^2)^(1/2))*(b0^3 - 4*a0*c0*b0))/(16*a0^(5/2));
# z1inbmnah2ox(x)=z1inbmnah2onv-z1inbmnah2ovx(x);
# z1inbmvh2o0=z1inbmnah2ox(xm0);
# z1inbmvh2o1=z1inbmnah2ox(xm1);
# z1inbmvh2o2=z1inbmnah2ox(xm2);
# z1inbmvh2o3=z1inbmnah2ox(xm3);
# z1inbmvh2o4=z1inbmnah2ox(xm4);
# z1inbmvh2o5=z1inbmnah2ox(xm5);
# z1inbmvh2o6=z1inbmnah2ox(xm6);
# z1inbmvh2o7=z1inbmnah2ox(xm7);
# z1inbmvh2o8=z1inbmnah2ox(xm8);
# z1inbmvh2o9=z1inbmnah2ox(xm9);
# iz1inbmh2ovv(the,bh2o)=0.5*(xmax0-xmin0)*(z1inbmvh2o0*gle0+z1inbmvh2o1*gle1+z1inbmvh2o2*gle2+z1inbmvh2o3*gle3+z1inbmvh2o4*gle4+z1inbmvh2o5*gle5+z1inbmvh2o6*gle6+z1inbmvh2o7*gle7+z1inbmvh2o8*gle8+z1inbmvh2o9*gle9);

# z1inbrnah2on(x)=z1inbre(psi1(x));
# z1inbrnah2ov(x)=z1inbre(-(x-xo)*tan(the)+bh2o);

# z1inbrnah2onx(x)=(log(2*(c1 + b1*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) + a1*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2)^(1/2) + (b1 + 2*a1*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)))/a1^(1/2))*(b1^3 - 4*a1*c1*b1))/(16*a1^(5/2)) + ((c1 + b1*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2)) + a1*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2)^(1/2)*(- 3*b1^2 + 2*a1*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))*b1 + 8*a1*(c1 + a1*(zmax - hb + hb*((- x^2 + 2*xmin0*x + xmin^2 - 2*xmin0*xmin)/(xmin - xmin0)^2)^(1/2))^2)))/(24*a1^2);
# z1inbrnah2ovx(x)=((c1 + b1*(bh2o - tan(the)*(x - xo)) + a1*(bh2o - tan(the)*(x - xo))^2)^(1/2)*(- 3*b1^2 + 2*a1*(bh2o - tan(the)*(x - xo))*b1 + 8*a1*(c1 + a1*(bh2o - tan(the)*(x - xo))^2)))/(24*a1^2) + (log((b1 + 2*a1*(bh2o - tan(the)*(x - xo)))/a1^(1/2) + 2*(c1 + b1*(bh2o - tan(the)*(x - xo)) + a1*(bh2o - tan(the)*(x - xo))^2)^(1/2))*(b1^3 - 4*a1*c1*b1))/(16*a1^(5/2));
# z1inbrnah2ox(x)=z1inbrnah2onx(x)-z1inbrnah2ovx(x);
# z1inbrvh2o0=z1inbrnah2ox(xrsnake0);
# z1inbrvh2o1=z1inbrnah2ox(xrsnake1);
# z1inbrvh2o2=z1inbrnah2ox(xrsnake2);
# z1inbrvh2o3=z1inbrnah2ox(xrsnake3);
# z1inbrvh2o4=z1inbrnah2ox(xrsnake4);
# z1inbrvh2o5=z1inbrnah2ox(xrsnake5);
# z1inbrvh2o6=z1inbrnah2ox(xrsnake6);
# z1inbrvh2o7=z1inbrnah2ox(xrsnake7);
# z1inbrvh2o8=z1inbrnah2ox(xrsnake8);
# z1inbrvh2o9=z1inbrnah2ox(xrsnake9);
# iz1inbrh2ovv(the,bh2o)=0.5*(xmin0-minsnake(the,bh2o))*(z1inbrvh2o0*gle0+z1inbrvh2o1*gle1+z1inbrvh2o2*gle2+z1inbrvh2o3*gle3+z1inbrvh2o4*gle4+z1inbrvh2o5*gle5+z1inbrvh2o6*gle6+z1inbrvh2o7*gle7+z1inbrvh2o8*gle8+z1inbrvh2o9*gle9);

# szsvbh2o(the,bh2o)=2*iz1inbfh2ovv(the,bh2o)+2*iz1inbmh2ovv(the,bh2o)+2*iz1inbrh2ovv(the,bh2o)-zo*svbh2o(the,bh2o);
# zsvbh2o(the,bh2o)=szsvbh2o(the,bh2o)/svbh2o(the,bh2o);

# z1xxm(x)=int(2*z*fi2m(x,z),z,-(x-xo)*tan(the)+bh2o,zmax);
# z1xxme(x)=(bb*(bh2o - tan(the)*(x - xo))^4)/(4*hb^2) - (bb*zmax^4)/(4*hb^2) + (bb*zmax^3*(2*hb - zmax))/(2*hb^2) - (bb*zmax^3*(2*hb - 2*zmax))/(3*hb^2) + (bb*(2*hb - 2*zmax)*(bh2o - tan(the)*(x - xo))^3)/(3*hb^2) - (bb*zmax*(2*hb - zmax)*(bh2o - tan(the)*(x - xo))^2)/(2*hb^2);
# iz1xxme(x)=int(z1xxme(x),x);
# iz1xxmee(x)=(x*(3*bb*bh2o^4 - 8*bb*bh2o^3*zmax + 8*bb*hb*bh2o^3 + 6*bb*bh2o^2*zmax^2 - 12*bb*hb*bh2o^2*zmax - bb*zmax^4 + 4*bb*hb*zmax^3))/(12*hb^2) - ((x - xo)^2*(12*bb*tan(the)*bh2o^3 - 24*bb*tan(the)*bh2o^2*zmax + 24*bb*hb*tan(the)*bh2o^2 + 12*bb*tan(the)*bh2o*zmax^2 - 24*bb*hb*tan(the)*bh2o*zmax))/(24*hb^2) + ((x - xo)^3*(18*bb*bh2o^2*tan(the)^2 + 6*bb*zmax^2*tan(the)^2 + 24*bb*bh2o*hb*tan(the)^2 - 24*bb*bh2o*zmax*tan(the)^2 - 12*bb*hb*zmax*tan(the)^2))/(36*hb^2) - ((x - xo)^4*(12*bb*bh2o*tan(the)^3 + 8*bb*hb*tan(the)^3 - 8*bb*zmax*tan(the)^3))/(48*hb^2) + (bb*tan(the)^4*(x - xo)^5)/(20*hb^2);
# iz1xxmev(the,bh2o)=iz1xxmee(xmax0)-iz1xxmee(xmin0);

# iz1xxmvv(the,bh2o)=((xmin0 - xo)^2*(12*bb*tan(the)*bh2o^3 - 24*bb*tan(the)*bh2o^2*zmax + 24*bb*hb*tan(the)*bh2o^2 + 12*bb*tan(the)*bh2o*zmax^2 - 24*bb*hb*tan(the)*bh2o*zmax))/(24*hb^2) - ((xmax0 - xo)^2*(12*bb*tan(the)*bh2o^3 - 24*bb*tan(the)*bh2o^2*zmax + 24*bb*hb*tan(the)*bh2o^2 + 12*bb*tan(the)*bh2o*zmax^2 - 24*bb*hb*tan(the)*bh2o*zmax))/(24*hb^2) + (xmax0*(3*bb*bh2o^4 - 8*bb*bh2o^3*zmax + 8*bb*hb*bh2o^3 + 6*bb*bh2o^2*zmax^2 - 12*bb*hb*bh2o^2*zmax - bb*zmax^4 + 4*bb*hb*zmax^3))/(12*hb^2) - (xmin0*(3*bb*bh2o^4 - 8*bb*bh2o^3*zmax + 8*bb*hb*bh2o^3 + 6*bb*bh2o^2*zmax^2 - 12*bb*hb*bh2o^2*zmax - bb*zmax^4 + 4*bb*hb*zmax^3))/(12*hb^2) + ((xmax0 - xo)^3*(18*bb*bh2o^2*tan(the)^2 + 6*bb*zmax^2*tan(the)^2 + 24*bb*bh2o*hb*tan(the)^2 - 24*bb*bh2o*zmax*tan(the)^2 - 12*bb*hb*zmax*tan(the)^2))/(36*hb^2) - ((xmin0 - xo)^3*(18*bb*bh2o^2*tan(the)^2 + 6*bb*zmax^2*tan(the)^2 + 24*bb*bh2o*hb*tan(the)^2 - 24*bb*bh2o*zmax*tan(the)^2 - 12*bb*hb*zmax*tan(the)^2))/(36*hb^2) - ((xmax0 - xo)^4*(12*bb*bh2o*tan(the)^3 + 8*bb*hb*tan(the)^3 - 8*bb*zmax*tan(the)^3))/(48*hb^2) + ((xmin0 - xo)^4*(12*bb*bh2o*tan(the)^3 + 8*bb*hb*tan(the)^3 - 8*bb*zmax*tan(the)^3))/(48*hb^2) + (bb*tan(the)^4*(xmax0 - xo)^5)/(20*hb^2) - (bb*tan(the)^4*(xmin0 - xo)^5)/(20*hb^2);
# z1vh2omt(the,bh2o)=int(z1xxme(x),x,xmin0,xmax0);
z1vh2om(the, bh2o) = xmin0 * ((bb * zmax^4) / (4 * hb^2) - (bb * (bh2o + xo * tan(the))^4) / (4 * hb^2) - (bb * zmax^3 * (2 * hb - zmax)) / (2 * hb^2) + (bb * zmax^3 * (2 * hb - 2 * zmax)) / (3 * hb^2) - (bb * (2 * hb - 2 * zmax) * (bh2o + xo * tan(the))^3) / (3 * hb^2) + (bb * zmax * (2 * hb - zmax) * (bh2o + xo * tan(the))^2) / (2 * hb^2)) - xmax0 * ((bb * zmax^4) / (4 * hb^2) - (bb * (bh2o + xo * tan(the))^4) / (4 * hb^2) - (bb * zmax^3 * (2 * hb - zmax)) / (2 * hb^2) + (bb * zmax^3 * (2 * hb - 2 * zmax)) / (3 * hb^2) - (bb * (2 * hb - 2 * zmax) * (bh2o + xo * tan(the))^3) / (3 * hb^2) + (bb * zmax * (2 * hb - zmax) * (bh2o + xo * tan(the))^2) / (2 * hb^2)) - xmax0^2 * ((bb * tan(the) * (bh2o + xo * tan(the))^3) / (2 * hb^2) + (bb * tan(the) * (2 * hb - 2 * zmax) * (bh2o + xo * tan(the))^2) / (2 * hb^2) - (bb * zmax * tan(the) * (2 * hb - zmax) * (bh2o + xo * tan(the))) / (2 * hb^2)) + xmin0^2 * ((bb * tan(the) * (bh2o + xo * tan(the))^3) / (2 * hb^2) + (bb * tan(the) * (2 * hb - 2 * zmax) * (bh2o + xo * tan(the))^2) / (2 * hb^2) - (bb * zmax * tan(the) * (2 * hb - zmax) * (bh2o + xo * tan(the))) / (2 * hb^2)) - xmax0^4 * ((bb * tan(the)^3 * (bh2o + xo * tan(the))) / (4 * hb^2) + (bb * tan(the)^3 * (2 * hb - 2 * zmax)) / (12 * hb^2)) + xmin0^4 * ((bb * tan(the)^3 * (bh2o + xo * tan(the))) / (4 * hb^2) + (bb * tan(the)^3 * (2 * hb - 2 * zmax)) / (12 * hb^2)) + xmax0^3 * ((bb * tan(the)^2 * (bh2o + xo * tan(the))^2) / (2 * hb^2) - (bb * zmax * tan(the)^2 * (2 * hb - zmax)) / (6 * hb^2) + (bb * tan(the)^2 * (2 * hb - 2 * zmax) * (bh2o + xo * tan(the))) / (3 * hb^2)) - xmin0^3 * ((bb * tan(the)^2 * (bh2o + xo * tan(the))^2) / (2 * hb^2) - (bb * zmax * tan(the)^2 * (2 * hb - zmax)) / (6 * hb^2) + (bb * tan(the)^2 * (2 * hb - 2 * zmax) * (bh2o + xo * tan(the))) / (3 * hb^2)) + (bb * xmax0^5 * tan(the)^4) / (20 * hb^2) - (bb * xmin0^5 * tan(the)^4) / (20 * hb^2)

# z1xxf(x)=int(2*z*fi2f(x,z),z,-(x-xo)*tan(the)+bh2o,psi2(x));
z1xxfe(x, the, bh2o) = (bb * (bh2o - tan(the) * (x - xo))^4) / (4 * hb^2) - (bb * (bh2o - tan(the) * (x - xo))^2 * ((-x^2 + 2 * xmax0 * x + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2 + (zmax * (2 * hb - zmax)) / hb^2 - 1)) / 2 - (bb * (zmax - hb + hb * ((-x^2 + 2 * xmax0 * x + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2))^4) / (4 * hb^2) + (bb * (zmax - hb + hb * ((-x^2 + 2 * xmax0 * x + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2))^2 * ((-x^2 + 2 * xmax0 * x + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2 + (zmax * (2 * hb - zmax)) / hb^2 - 1)) / 2 - (bb * (2 * hb - 2 * zmax) * (zmax - hb + hb * ((-x^2 + 2 * xmax0 * x + xmax^2 - 2 * xmax0 * xmax) / (xmax - xmax0)^2)^(1 / 2))^3) / (3 * hb^2) + (bb * (2 * hb - 2 * zmax) * (bh2o - tan(the) * (x - xo))^3) / (3 * hb^2)

z1xxfvx0(the, bh2o) = z1xxfe(xfsnake0(the, bh2o), the, bh2o)
z1xxfvx1(the, bh2o) = z1xxfe(xfsnake1(the, bh2o), the, bh2o)
z1xxfvx2(the, bh2o) = z1xxfe(xfsnake2(the, bh2o), the, bh2o)
z1xxfvx3(the, bh2o) = z1xxfe(xfsnake3(the, bh2o), the, bh2o)
z1xxfvx4(the, bh2o) = z1xxfe(xfsnake4(the, bh2o), the, bh2o)
z1xxfvx5(the, bh2o) = z1xxfe(xfsnake5(the, bh2o), the, bh2o)
z1xxfvx6(the, bh2o) = z1xxfe(xfsnake6(the, bh2o), the, bh2o)
z1xxfvx7(the, bh2o) = z1xxfe(xfsnake7(the, bh2o), the, bh2o)
z1xxfvx8(the, bh2o) = z1xxfe(xfsnake8(the, bh2o), the, bh2o)
z1xxfvx9(the, bh2o) = z1xxfe(xfsnake9(the, bh2o), the, bh2o)
iz1xxfvv(the, bh2o) = 0.5 * (maxsnake(the, bh2o) - xmax0) * (z1xxfvx0(the, bh2o) * gle0 + z1xxfvx1(the, bh2o) * gle1 + z1xxfvx2(the, bh2o) * gle2 +
                                                             z1xxfvx3(the, bh2o) * gle3 + z1xxfvx4(the, bh2o) * gle4 + z1xxfvx5(the, bh2o) * gle5 + z1xxfvx6(the, bh2o) * gle6 +
                                                             z1xxfvx7(the, bh2o) * gle7 + z1xxfvx8(the, bh2o) * gle8 + z1xxfvx9(the, bh2o) * gle9)
# iz1xxfe(x)=int(z1xxfe(x),x);

z1vh2of(the, bh2o) = iz1xxfvv(the, bh2o)
# z1xxr(x)=int(2*z*fi2r(x,z),z,-(x-xo)*tan(the)+bh2o,psi1(x));
z1xxre(x, the, bh2o) = (bb * (bh2o - tan(the) * (x - xo))^4) / (4 * hb^2) - (bb * (bh2o - tan(the) * (x - xo))^2 * ((-x^2 + 2 * xmin0 * x + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2 + (zmax * (2 * hb - zmax)) / hb^2 - 1)) / 2 - (bb * (zmax - hb + hb * ((-x^2 + 2 * xmin0 * x + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2))^4) / (4 * hb^2) + (bb * (zmax - hb + hb * ((-x^2 + 2 * xmin0 * x + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2))^2 * ((-x^2 + 2 * xmin0 * x + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2 + (zmax * (2 * hb - zmax)) / hb^2 - 1)) / 2 - (bb * (2 * hb - 2 * zmax) * (zmax - hb + hb * ((-x^2 + 2 * xmin0 * x + xmin^2 - 2 * xmin0 * xmin) / (xmin - xmin0)^2)^(1 / 2))^3) / (3 * hb^2) + (bb * (2 * hb - 2 * zmax) * (bh2o - tan(the) * (x - xo))^3) / (3 * hb^2);

z1xxrvx0(the, bh2o) = z1xxre(xrsnake0(the, bh2o), the, bh2o)
z1xxrvx1(the, bh2o) = z1xxre(xrsnake1(the, bh2o), the, bh2o)
z1xxrvx2(the, bh2o) = z1xxre(xrsnake2(the, bh2o), the, bh2o)
z1xxrvx3(the, bh2o) = z1xxre(xrsnake3(the, bh2o), the, bh2o)
z1xxrvx4(the, bh2o) = z1xxre(xrsnake4(the, bh2o), the, bh2o)
z1xxrvx5(the, bh2o) = z1xxre(xrsnake5(the, bh2o), the, bh2o)
z1xxrvx6(the, bh2o) = z1xxre(xrsnake6(the, bh2o), the, bh2o)
z1xxrvx7(the, bh2o) = z1xxre(xrsnake7(the, bh2o), the, bh2o)
z1xxrvx8(the, bh2o) = z1xxre(xrsnake8(the, bh2o), the, bh2o)
z1xxrvx9(the, bh2o) = z1xxre(xrsnake9(the, bh2o), the, bh2o)
iz1xxrvv(the, bh2o) = 0.5 * (xmin0 - minsnake(the, bh2o)) * (z1xxrvx0(the, bh2o) * gle0 + z1xxrvx1(the, bh2o) * gle1 + z1xxrvx2(the, bh2o) * gle2
                                                             + z1xxrvx3(the, bh2o) * gle3 + z1xxrvx4(the, bh2o) * gle4 + z1xxrvx5(the, bh2o) * gle5 + z1xxrvx6(the, bh2o) * gle6
                                                             + z1xxrvx7(the, bh2o) * gle7 + z1xxrvx8(the, bh2o) * gle8 + z1xxrvx9(the, bh2o) * gle9)

z1vh2or(the, bh2o) = iz1xxrvv(the, bh2o)
z1vh2o(the, bh2o) = z1vh2of(the, bh2o) + z1vh2om(the, bh2o) + z1vh2or(the, bh2o)
szvh2o(the, bh2o) = z1vh2o(the, bh2o) - zo * vh2o(the, bh2o)
sxvh2o(the, bh2o) = x1vh2o(the, bh2o) - xo * vh2o(the, bh2o)
# mh2o(the,bh2o)=sxvh2o(the,bh2o)*cos(the)+szvh2o(the,bh2o)*sin(the);
# fi2rz(x,xo,the,bh2o)=0.5*bb*((-((x^2-2*xo*x+xo^2)*tan(the)^2-2*(x-xo)*bh2o*tan(the)+bh2o^2)+2*(zmax-hb)*(-(x-xo)*tan(the)+bh2o)-zmax*(zmax-2*hb))*hb^(-2)+(-x^2+2*xmin0*x+xmin^2-2*xmin0*xmin)*(xmin0-xmin)^(-2)-1);

# ifi2rz(x,xo,the,bh2o)=0.5*bb*((-(((x^3)/3-2*xo*(x^2)/2+xo^2*x)*tan(the)^2-2*((x^2)/2-xo*x)*bh2o*tan(the)+bh2o^2*x)+2*(zmax-hb)*(-((x*2)/2-xo*x)*tan(the)+bh2o*x)-zmax*(zmax-2*hb)*x)*hb^(-2)+(-(x^3)/3+2*xmin0*(x^2)/2+(xmin^2-2*xmin0*xmin)*x)*(xmin0-xmin)^(-2)-x);
# ifi2rzv(x,xo,the,bh2o)=0.5*bb*((-(((xmin0^3-minsnake(the,bh2o)^3)/3-2*xo*(xmin0^2-minsnake(the,bh2o)^2)/2+xo^2*(xmin0-minsnake(the,bh2o)))*tan(the)^2-2*((xmin0^2-minsnake(the,bh2o)^2)/2-xo*(xmin0-minsnake(the,bh2o)))*bh2o*tan(the)+bh2o^2*(xmin0-minsnake(the,bh2o)))+2*(zmax-hb)*(-((xmin0*2-minsnake(the,bh2o)^2)/2-xo*(xmin0-minsnake(the,bh2o)))*tan(the)+bh2o*(xmin0-minsnake(the,bh2o)))-zmax*(zmax-2*hb)*(xmin0-minsnake(the,bh2o)))*hb^(-2)+(-(xmin0^3-minsnake(the,bh2o)^3)/3+2*xmin0*(xmin0^2-minsnake(the,bh2o)^2)/2+(xmin^2-2*xmin0*xmin)*(xmin0-minsnake(the,bh2o)))*(xmin0-xmin)^(-2)-(xmin0-minsnake(the,bh2o)));
# fi2mz(x,xo,the,bh2o)=0.5*bb*((-((x^2-2*xo*x+xo^2)*tan(the)^2-2*(x-xo)*bh2o*tan(the)+bh2o^2)+2*(zmax-hb)*(-(x-xo)*tan(the)+bh2o)-zmax*(zmax-2*hb))*hb^(-2));
# ifi2mz(x,xo,the,bh2o)=0.5*bb*((-(((x^3)/3-2*xo*(x^2)/2+xo^2*x)*tan(the)^2-2*((x^2)/2-xo*x)*bh2o*tan(the)+bh2o^2*x)+2*(zmax-hb)*(-((x^2)/2-xo*x)*tan(the)+bh2o*x)-zmax*(zmax-2*hb)*x)*hb^(-2));
# ifi2mzv(x,xo,the,bh2o)=0.5*bb*((-(((xmax0^3-xmin0^3)/3-2*xo*(xmax0^2-xmin0^2)/2+xo^2*(xmax0-xmin0))*tan(the)^2-2*((xmax0^2-xmin0^2)/2-xo*(xmax0-xmin0))*bh2o*tan(the)+bh2o^2*(xmax0-xmin0))+2*(zmax-hb)*(-((xmax0^2-xmin0^2)/2-xo*(xmax0-xmin0))*tan(the)+bh2o*(xmax0-xmin0))-zmax*(zmax-2*hb)*(xmax0-xmin0))*hb^(-2));
# fi2fz(x,xo,the,bh2o)=0.5*bb*((-((x^2-2*xo*x+xo^2)*tan(the)^2-2*(x-xo)*bh2o*tan(the)+bh2o^2)+2*(zmax-hb)*(-(x-xo)*tan(the)+bh2o)-zmax*(zmax-2*hb))*hb^(-2)+(-x^2+2*xmax0*x+xmax^2-2*xmax0*xmax)*(xmax-xmax0)^(-2)-1);

# ifi2fz(x,xo,the,bh2o)=0.5*bb*((-(((x^3)/3-2*xo*(x^2)/2+xo^2*x)*tan(the)^2-2*((x^2)/2-xo*x)*bh2o*tan(the)+bh2o^2*x)+2*(zmax-hb)*(-((x^2)/2-xo*x)*tan(the)+bh2o*x)-zmax*(zmax-2*hb)*x)*hb^(-2)+(-(x^3)/3+2*xmax0*(x^2)/2+(xmax^2-2*xmax0*xmax)*x)*(xmax-xmax0)^(-2)-x);
# ifi2fzv(x,xo,the,bh2o)=0.5*bb*((-(((maxsnake(the,bh2o)^3-xmax0^3)/3-2*xo*(maxsnake(the,bh2o)^2-xmax0^2)/2+xo^2*(maxsnake(the,bh2o)-xmax0))*tan(the)^2-2*((maxsnake(the,bh2o)^2-xmax0^2)/2-xo*(maxsnake(the,bh2o)-xmax0))*bh2o*tan(the)+bh2o^2*(maxsnake(the,bh2o)-xmax0))+2*(zmax-hb)*(-((maxsnake(the,bh2o)^2-xmax0^2)/2-xo*(maxsnake(the,bh2o)-xmax0))*tan(the)+bh2o*(maxsnake(the,bh2o)-xmax0))-zmax*(zmax-2*hb)*(maxsnake(the,bh2o)-xmax0))*hb^(-2)+(-(maxsnake(the,bh2o)^3-xmax0^3)/3+2*xmax0*(maxsnake(the,bh2o)^2-xmax0^2)/2+(xmax^2-2*xmax0*xmax)*(maxsnake(the,bh2o)-xmax0))*(xmax-xmax0)^(-2)-(maxsnake(the,bh2o)-xmax0));
# x1fi2rz(x,xo,the,bh2o)=0.5*bb*((-((x^3-2*xo*x^2+xo^2*x)*tan(the)^2-2*(x^2-xo*x)*bh2o*tan(the)+bh2o^2*x)+2*(zmax-hb)*(-(x^2-xo*x)*tan(the)+bh2o*x)-zmax*(zmax-2*hb)*x)*hb^(-2)+(-x^3+2*xmin0*x^2+(xmin^2-2*xmin0*xmin)*x)*(xmin0-xmin)^(-2)-x);

# ix1fi2rz(x,xo,the,bh2o)=0.5*bb*((-(((x^4)/4-2*xo*(x^3)/3+xo^2*(x^2)/2)*tan(the)^2-2*((x^3)/3-xo*(x^2)/2)*bh2o*tan(the)+bh2o^2*(x^2)/2)+2*(zmax-hb)*(-((x*3)/3-xo*(x^2)/2)*tan(the)+bh2o*(x^2)/2)-zmax*(zmax-2*hb)*(x^2)/2)*hb^(-2)+(-(x^4)/4+2*xmin0*(x^3)/3+(xmin^2-2*xmin0*xmin)*(x^2)/2)*(xmin0-xmin)^(-2)-(x^2)/2);
# ix1fi2rzv(x,xo,the,bh2o)=0.5*bb*((-(((xmin0^4-minsnake(the,bh2o)^4)/4-2*xo*(xmin0^3-minsnake(the,bh2o)^3)/3+xo^2*(xmin0^2-minsnake(the,bh2o)^2)/2)*tan(the)^2-2*((xmin0^3-minsnake(the,bh2o)^3)/3-xo*(xmin0^2-minsnake(the,bh2o)^2)/2)*bh2o*tan(the)+bh2o^2*(xmin0^2-minsnake(the,bh2o)^2)/2)+2*(zmax-hb)*(-((xmin0*3-minsnake(the,bh2o)^3)/3-xo*(xmin0^2-minsnake(the,bh2o)^2)/2)*tan(the)+bh2o*(xmin0^2-minsnake(the,bh2o)^2)/2)-zmax*(zmax-2*hb)*(xmin0^2-minsnake(the,bh2o)^2)/2)*hb^(-2)+(-(xmin0^4-minsnake(the,bh2o)^4)/4+2*xmin0*(xmin0^3-minsnake(the,bh2o)^3)/3+(xmin^2-2*xmin0*xmin)*(xmin0^2-minsnake(the,bh2o)^2)/2)*(xmin0-xmin)^(-2)-(xmin0^2-minsnake(the,bh2o)^2)/2);
# x1fi2mz(x,xo,the,bh2o)=0.5*bb*((-((x^3-2*xo*x^2+xo^2*x)*tan(the)^2-2*(x^2-xo*x)*bh2o*tan(the)+bh2o^2*x)^2+2*(zmax-hb)*(-(x^2-xo*x)*tan(the)+bh2o*x)-zmax*(zmax-2*hb)*x)*hb^(-2));
# ix1fi2mz(x,xo,the,bh2o)=0.5*bb*((-(((x^4)/4-2*xo*(x^3)/3+xo^2*(x^2)/2)*tan(the)^2-2*((x^3)/3-xo*(x^2)/2)*bh2o*tan(the)+bh2o^2*(x^2)/2)^2+2*(zmax-hb)*(-((x^3)/3-xo*(x^2)/2)*tan(the)+bh2o*(x^2)/2)-zmax*(zmax-2*hb)*(x^2)/2)*hb^(-2));
# ix1fi2mzv(x,xo,the,bh2o)=0.5*bb*((-(((xmax0^4-xmin0^4)/4-2*xo*(xmax0^3-xmin0^3)/3+xo^2*(xmax0^2-xmin0^2)/2)*tan(the)^2-2*((xmax0^3-xmin0^3)/3-xo*(xmax0^2-xmin0^2)/2)*bh2o*tan(the)+bh2o^2*(xmax0^2-xmin0^2)/2)^2+2*(zmax-hb)*(-((xmax0^3-xmin0^3)/3-xo*(xmax0^2-xmin0^2)/2)*tan(the)+bh2o*(xmax0^2-xmin0^2)/2)-zmax*(zmax-2*hb)*(xmax0^2-xmin0^2)/2)*hb^(-2));
# x1fi2fz(x,xo,the,bh2o)=0.5*bb*((-((x^3-2*xo*x^2+xo^2*x)*tan(the)^2-2*(x^2-xo*x)*bh2o*tan(the)+bh2o^2*x)+2*(zmax-hb)*(-(x^2-xo*x)*tan(the)+bh2o*x)-zmax*(zmax-2*hb)*x)*hb^(-2)+(-x^3+2*xmax0*x^2+(xmax^2-2*xmax0*xmax)*x)*(xmax-xmax0)^(-2)-x);

# ix1fi2fz(x,xo,the,bh2o)=0.5*bb*((-(((x^4)/4-2*xo*(x^3)/3+xo^2*(x^2)/2)*tan(the)^2-2*((x^3)/3-xo*(x^2)/2)*bh2o*tan(the)+bh2o^2*(x^2)/2)+2*(zmax-hb)*(-((x^3)/3-xo*(x^2)/2)*tan(the)+bh2o*(x^2)/2)-zmax*(zmax-2*hb)*(x^2)/2)*hb^(-2)+(-(x^4)/4+2*xmax0*(x^3)/3+(xmax^2-2*xmax0*xmax)*(x^2)/2)*(xmax-xmax0)^(-2)-(x^2)/2);
# ix1fi2fzv(x,xo,the,bh2o)=0.5*bb*((-(((maxsnake(the,bh2o)^4-xmax0^4)/4-2*xo*(maxsnake(the,bh2o)^3-xmax0^3)/3+xo^2*(maxsnake(the,bh2o)^2-xmax0^2)/2)*tan(the)^2-2*((maxsnake(the,bh2o)^3-xmax0^3)/3-xo*(maxsnake(the,bh2o)^2-xmax0^2)/2)*bh2o*tan(the)+bh2o^2*(maxsnake(the,bh2o)^2-xmax0^2)/2)+2*(zmax-hb)*(-((maxsnake(the,bh2o)^3-xmax0^3)/3-xo*(maxsnake(the,bh2o)^2-xmax0^2)/2)*tan(the)+bh2o*(maxsnake(the,bh2o)^2-xmax0^2)/2)-zmax*(zmax-2*hb)*(maxsnake(the,bh2o)^2-xmax0^2)/2)*hb^(-2)+(-(maxsnake(the,bh2o)^4-xmax0^4)/4+2*xmax0*(maxsnake(the,bh2o)^3-xmax0^3)/3+(xmax^2-2*xmax0*xmax)*(maxsnake(the,bh2o)^2-xmax0^2)/2)*(xmax-xmax0)^(-2)-(maxsnake(the,bh2o)^2-xmax0^2)/2);

# ytfh2ov(the,bh2o)=2*(0.5*bb*((-(((maxsnake(the,bh2o)^3-xmax0^3)/3-2*xo*(maxsnake(the,bh2o)^2-xmax0^2)/2+xo^2*(maxsnake(the,bh2o)-xmax0))*tan(the)^2-2*((maxsnake(the,bh2o)^2-xmax0^2)/2-xo*(maxsnake(the,bh2o)-xmax0))*bh2o*tan(the)+bh2o^2*(maxsnake(the,bh2o)-xmax0))+2*(zmax-hb)*(-((maxsnake(the,bh2o)^2-xmax0^2)/2-xo*(maxsnake(the,bh2o)-xmax0))*tan(the)+bh2o*(maxsnake(the,bh2o)-xmax0))-zmax*(zmax-2*hb)*(maxsnake(the,bh2o)-xmax0))*hb^(-2)+(-(maxsnake(the,bh2o)^3-xmax0^3)/3+2*xmax0*(maxsnake(the,bh2o)^2-xmax0^2)/2+(xmax^2-2*xmax0*xmax)*(maxsnake(the,bh2o)-xmax0))*(xmax-xmax0)^(-2)-(maxsnake(the,bh2o)-xmax0)))/cos(the);
# ytmh2ov(the,bh2o)=2*(0.5*bb*((-(((xmax0^3-xmin0^3)/3-2*xo*(xmax0^2-xmin0^2)/2+xo^2*(xmax0-xmin0))*tan(the)^2-2*((xmax0^2-xmin0^2)/2-xo*(xmax0-xmin0))*bh2o*tan(the)+bh2o^2*(xmax0-xmin0))+2*(zmax-hb)*(-((xmax0^2-xmin0^2)/2-xo*(xmax0-xmin0))*tan(the)+bh2o*(xmax0-xmin0))-zmax*(zmax-2*hb)*(xmax0-xmin0))*hb^(-2)))/cos(the);
# ytrh2ov(the,bh2o)=2*(0.5*bb*((-(((xmin0^3-minsnake(the,bh2o)^3)/3-2*xo*(xmin0^2-minsnake(the,bh2o)^2)/2+xo^2*(xmin0-minsnake(the,bh2o)))*tan(the)^2-2*((xmin0^2-minsnake(the,bh2o)^2)/2-xo*(xmin0-minsnake(the,bh2o)))*bh2o*tan(the)+bh2o^2*(xmin0-minsnake(the,bh2o)))+2*(zmax-hb)*(-((xmin0*2-minsnake(the,bh2o)^2)/2-xo*(xmin0-minsnake(the,bh2o)))*tan(the)+bh2o*(xmin0-minsnake(the,bh2o)))-zmax*(zmax-2*hb)*(xmin0-minsnake(the,bh2o)))*hb^(-2)+(-(xmin0^3-minsnake(the,bh2o)^3)/3+2*xmin0*(xmin0^2-minsnake(the,bh2o)^2)/2+(xmin^2-2*xmin0*xmin)*(xmin0-minsnake(the,bh2o)))*(xmin0-xmin)^(-2)-(xmin0-minsnake(the,bh2o))))/cos(the);
# yth2ov(the,bh2o)=ytfh2ov(the,bh2o)+ytmh2ov(the,bh2o)+ytrh2ov(the,bh2o);

# x1ytfh2ov(the,bh2o)=2*(0.5*bb*((-(((maxsnake(the,bh2o)^4-xmax0^4)/4-2*xo*(maxsnake(the,bh2o)^3-xmax0^3)/3+xo^2*(maxsnake(the,bh2o)^2-xmax0^2)/2)*tan(the)^2-2*((maxsnake(the,bh2o)^3-xmax0^3)/3-xo*(maxsnake(the,bh2o)^2-xmax0^2)/2)*bh2o*tan(the)+bh2o^2*(maxsnake(the,bh2o)^2-xmax0^2)/2)+2*(zmax-hb)*(-((maxsnake(the,bh2o)^3-xmax0^3)/3-xo*(maxsnake(the,bh2o)^2-xmax0^2)/2)*tan(the)+bh2o*(maxsnake(the,bh2o)^2-xmax0^2)/2)-zmax*(zmax-2*hb)*(maxsnake(the,bh2o)^2-xmax0^2)/2)*hb^(-2)+(-(maxsnake(the,bh2o)^4-xmax0^4)/4+2*xmax0*(maxsnake(the,bh2o)^3-xmax0^3)/3+(xmax^2-2*xmax0*xmax)*(maxsnake(the,bh2o)^2-xmax0^2)/2)*(xmax-xmax0)^(-2)-(maxsnake(the,bh2o)^2-xmax0^2)/2))/cos(the);
# x1ytmh2ov(the,bh2o)=2*(0.5*bb*((-(((xmax0^4-xmin0^4)/4-2*xo*(xmax0^3-xmin0^3)/3+xo^2*(xmax0^2-xmin0^2)/2)*tan(the)^2-2*((xmax0^3-xmin0^3)/3-xo*(xmax0^2-xmin0^2)/2)*bh2o*tan(the)+bh2o^2*(xmax0^2-xmin0^2)/2)^2+2*(zmax-hb)*(-((xmax0^3-xmin0^3)/3-xo*(xmax0^2-xmin0^2)/2)*tan(the)+bh2o*(xmax0^2-xmin0^2)/2)-zmax*(zmax-2*hb)*(xmax0^2-xmin0^2)/2)*hb^(-2)))/cos(the);
# x1ytrh2ov(the,bh2o)=2*(0.5*bb*((-(((xmin0^4-minsnake(the,bh2o)^4)/4-2*xo*(xmin0^3-minsnake(the,bh2o)^3)/3+xo^2*(xmin0^2-minsnake(the,bh2o)^2)/2)*tan(the)^2-2*((xmin0^3-minsnake(the,bh2o)^3)/3-xo*(xmin0^2-minsnake(the,bh2o)^2)/2)*bh2o*tan(the)+bh2o^2*(xmin0^2-minsnake(the,bh2o)^2)/2)+2*(zmax-hb)*(-((xmin0*3-minsnake(the,bh2o)^3)/3-xo*(xmin0^2-minsnake(the,bh2o)^2)/2)*tan(the)+bh2o*(xmin0^2-minsnake(the,bh2o)^2)/2)-zmax*(zmax-2*hb)*(xmin0^2-minsnake(the,bh2o)^2)/2)*hb^(-2)+(-(xmin0^4-minsnake(the,bh2o)^4)/4+2*xmin0*(xmin0^3-minsnake(the,bh2o)^3)/3+(xmin^2-2*xmin0*xmin)*(xmin0^2-minsnake(the,bh2o)^2)/2)*(xmin0-xmin)^(-2)-(xmin0^2-minsnake(the,bh2o)^2)/2))/cos(the);

# x1yth2ov(the,bh2o)=x1ytfh2ov(the,bh2o)+x1ytmh2ov(the,bh2o)+x1ytrh2ov(the,bh2o);
# sxyth2ov(the,bh2o)=x1yth2ov(the,bh2o)-xo*yth2ov(the,bh2o);
# z1yth2ov(the,bh2o)=-x1yth2ov(the,bh2o)*tan(the)+bh2o*yth2ov(the,bh2o);
# szyth2ov(the,bh2o)=z1yth2ov(the,bh2o)-zo*yth2ov(the,bh2o);
# tvmh2o(the,bh2o)=(bb*xo*cos(the)*(2*hb - 2*zmax))/(2*hb^2) - (bb*zmax*sin(the)*(2*hb - zmax))/(2*hb^2);

# z1tvmh2o(the,bh2o)=(bb*(zmax - bh2o + xo*tan(the))^2*(8*bh2o*hb - 2*bh2o*zmax + 4*hb*zmax + 3*xo^2*tan(the)^2 + 3*bh2o^2 - zmax^2 - 6*bh2o*xo*tan(the) - 8*hb*xo*tan(the) + 2*xo*zmax*tan(the)))/(12*hb^2);
# sztvmh2o(the,bh2o)=z1tvmh2o(the,bh2o)-zo*tvmh2o(the,bh2o);


# lbh2o(the,bh2o)=((((bh2o+hb-zmax)*tan(the)+hb^2*xmax0*(xmax-xmax0)^(-2)+2*((hb^4+2*hb^2*xmax0*(bh2o+hb-zmax)*tan(the)-(bh2o+hb-zmax)^2*hb^2+(bh2o+hb-zmax)*hb^2*(tan(the))^2)*(xmax-xmax0)^(-2))^0.5)*(2*((tan(the))^2+hb^2*(xmax-xmax0)^(-2))^(-1))-((bh2o+hb-zmax)*tan(the)+hb^2*xmin0*(xmin0-xmin)^(-2)-2*((hb^4+2*hb^2*xmin0*(bh2o+hb-zmax)*tan(the)-(bh2o+hb-zmax)^2*hb^2+(bh2o+hb-zmax)*hb^2*(tan(the))^2)*(xmin0-xmin)^(-2))^0.5)*(2*((tan(the))^2+hb^2*(xmin0-xmin)^(-2))^(-1)))^2+(psi2(((bh2o+hb-zmax)*tan(the)+hb^2*xmax0*(xmax-xmax0)^(-2)+2*((hb^4+2*hb^2*xmax0*(bh2o+hb-zmax)*tan(the)-(bh2o+hb-zmax)^2*hb^2+(bh2o+hb-zmax)*hb^2*(tan(the))^2)*(xmax-xmax0)^(-2))^0.5)*(2*((tan(the))^2+hb^2*(xmax-xmax0)^(-2))^(-1)))-psi1(((bh2o+hb-zmax)*tan(the)+hb^2*xmin0*(xmin0-xmin)^(-2)-2*((hb^4+2*hb^2*xmin0*(bh2o+hb-zmax)*tan(the)-(bh2o+hb-zmax)^2*hb^2+(bh2o+hb-zmax)*hb^2*(tan(the))^2)*(xmin0-xmin)^(-2))^0.5)*(2*((tan(the))^2+hb^2*(xmin0-xmin)^(-2))^(-1))))^2)^0.5;
# sbair(the,bh2o)=sbof-svbh2o(the,bh2o);
# sxsbair(the,bh2o)=sxmb-m_B*xo-sxsvbh2o(the,bh2o);
# szsbair(the,bh2o)=szmb-m_B*zo-szsvbh2o(the,bh2o);
# sro=bro*hro;
# szsro=bro*((zmax-hb)^2-(zmax-hb-hro)^2)/2-zo*sro;