        program diff1d
        real rho(500,1000)
        print*,"Enter the number of time steps"
        read(5,*) nts
        open(7,file="rho")
  111   format(2(2x,e12.4))
c Initial distribution
        rho=0.0
        do i=230,270
          rho(i,1)=1.0
        enddo
c time steps
        do nt=1,nts-1
        do i=2,499
        rho(i,nt+1)=rho(i,nt)+0.3*(rho(i+1,nt)-2*rho(i,nt)+rho(i-1,nt))
        enddo
        enddo
        do i=1,500
          x=i
          write(7,111) x,rho(i,nts)
        enddo
        end
