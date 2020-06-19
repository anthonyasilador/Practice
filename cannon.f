        program cannon
        real x0(200),y0(200),x(200),y(200),vx(200),vy(200),
     *  xr(200),yr(200),vxr(200),vyr(200)
        b2m=4.0e-5 
        v0=700.0
        g=9.8
        pi=3.141593
        print*,"Enter the initial angle"
        read(5,*) teta
        open(7,file="x0y0")
        open(8,file="xy")
        open(9,file="rhoxy")
  111   format(2(e12.5))
        teta=teta*pi/180.0
        tmax=2.0*v0*sin(teta)/g
        h=tmax/200.0
        vix=v0*cos(teta)
        viy=v0*sin(teta)
        vx(1)=vix
        vy(1)=viy
        x0(1)=0.0
        y0(1)=0.0
        x(1)=0.0
        y(1)=0.0
        vxr(1)=vix
        vyr(1)=viy
        xr(1)=0.0
        yr(1)=0.0
        vr=v0
        v=v0
        do i=1,199
          t=(i+1)*h
          x0(i+1)=vix*t
          y0(i+1)=viy*t-0.5*g*t*t
          vx(i+1)=vx(i)-b2m*v*vx(i)*h
          vy(i+1)=vy(i)-(g+b2m*v*vy(i))*h
          b2mr=b2m*(1.0-2.166667e-5*yr(i))**2.5
          v=sqrt(vx(i+1)**2+vy(i+1)**2)
          vxr(i+1)=vxr(i)-b2mr*vr*vxr(i)*h
          vyr(i+1)=vyr(i)-(g+b2mr*vr*vyr(i))*h
          vr=sqrt(vxr(i+1)**2+vyr(i+1)**2)
          x(i+1)=x(i)+vx(i)*h
          y(i+1)=y(i)+vy(i)*h
          xr(i+1)=xr(i)+vxr(i)*h
          yr(i+1)=yr(i)+vyr(i)*h
        enddo
        sc=1000.0
        do i=1,199
          write(7,111) x0(i)/sc,y0(i)/sc
          if(y(i)>0.0) then
            write(8,111) x(i)/sc,y(i)/sc
          endif
          if(yr(i)>0.0) then
            write(9,111) xr(i)/sc,yr(i)/sc
          endif
        enddo
        close(7)
        close(8)
        close(9)
        end
