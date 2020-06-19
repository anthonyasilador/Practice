        program diff1dT2
        real rho(500,1000)
        print*,"Enter the number of time steps"
        read(5,*) nts
        open(7,file="rho")
  111   format(2(2x,e12.4))
c Initial distribution
c
c time steps
c
        D=0.3
        do i=1,500
        x=i
        enddo
        do jt=1,1000
        do i=2,499
       rho(i,1000)=rho(i,jt)+D*(rho(i+1,jt)-2*rho(i,jt)+rho(i-1,jt))
        enddo
        enddo
        do i=1,500
          x=i
          write(7,111) x,rho(i,nts)
        enddo
        end
