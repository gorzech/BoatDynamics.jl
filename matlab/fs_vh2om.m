syms bb zmax hb x z real
fi2m(x,z)=0.5.*bb.*((-z.^2+2.*(zmax-hb).*z-zmax.*(zmax-2.*hb)).*hb.^(-2));
syms xo the bh2o real
zminv = -(x-xo).*tan(the)+bh2o;
xx(x,z)=int(2.*fi2m(x,z),z,zminv,zmax);

xxv(x) = (bb*(bh2o - zmax - x*tan(the) + xo*tan(the))^2*(bh2o + 3*hb - zmax - x*tan(the) + xo*tan(the)))/(3*hb^2);
ixxv(x)=int(xxv(x),x);

syms xmax0 xmin0 real
vh2omx(the,bh2o)=simplify(ixxv(xmax0)-ixxv(xmin0));
% After printing the above
vh2om(the, bh2o) = -(bb*(xmax0 - xmin0)*(xmax0^3*tan(the)^3 + xmin0^3*tan(the)^3 - 4*xo^3*tan(the)^3 - 12*bh2o^2*hb - 12*bh2o*zmax^2 + 12*bh2o^2*zmax - 12*hb*zmax^2 - 4*bh2o^3 + 4*zmax^3 + 6*bh2o^2*xmax0*tan(the) + 6*bh2o^2*xmin0*tan(the) - 12*bh2o^2*xo*tan(the) + 6*xmax0*zmax^2*tan(the) + 6*xmin0*zmax^2*tan(the) - 12*xo*zmax^2*tan(the) + 24*bh2o*hb*zmax - 4*bh2o*xmax0^2*tan(the)^2 - 4*bh2o*xmin0^2*tan(the)^2 - 12*bh2o*xo^2*tan(the)^2 - 4*hb*xmax0^2*tan(the)^2 - 4*hb*xmin0^2*tan(the)^2 - 12*hb*xo^2*tan(the)^2 + xmax0*xmin0^2*tan(the)^3 + xmax0^2*xmin0*tan(the)^3 + 6*xmax0*xo^2*tan(the)^3 - 4*xmax0^2*xo*tan(the)^3 + 6*xmin0*xo^2*tan(the)^3 - 4*xmin0^2*xo*tan(the)^3 + 4*xmax0^2*zmax*tan(the)^2 + 4*xmin0^2*zmax*tan(the)^2 + 12*xo^2*zmax*tan(the)^2 - 4*hb*xmax0*xmin0*tan(the)^2 + 12*hb*xmax0*xo*tan(the)^2 + 12*hb*xmin0*xo*tan(the)^2 - 4*xmax0*xmin0*xo*tan(the)^3 + 4*xmax0*xmin0*zmax*tan(the)^2 - 12*xmax0*xo*zmax*tan(the)^2 - 12*xmin0*xo*zmax*tan(the)^2 + 12*bh2o*hb*xmax0*tan(the) + 12*bh2o*hb*xmin0*tan(the) - 24*bh2o*hb*xo*tan(the) - 12*bh2o*xmax0*zmax*tan(the) - 12*bh2o*xmin0*zmax*tan(the) + 24*bh2o*xo*zmax*tan(the) - 12*hb*xmax0*zmax*tan(the) - 12*hb*xmin0*zmax*tan(the) + 24*hb*xo*zmax*tan(the) - 4*bh2o*xmax0*xmin0*tan(the)^2 + 12*bh2o*xmax0*xo*tan(the)^2 + 12*bh2o*xmin0*xo*tan(the)^2))/(12*hb^2);
