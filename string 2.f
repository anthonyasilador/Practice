        program string
        real y(1000,3)
        x0=0.3
        print*,"Enter the number of time steps"
        read(5,*) nts
        open(7,file="wave")
  110   format(2(2x,e12.5))
        open(8,file="matrix")
  111   format(10002(2x,e12.5))
        do i=1,1000
          x=0.001*i
          y(i,1)=exp(-1000.0*(x-x0)**2)
          y(i,2)=y(i,1)
        enddo
        do ii=1,nts ! time steps
          do jt=2,3
            y(1,jt)=0.0
            y(1000,jt)=0.0
           enddo
          do i=2,999
            y(i,3)=y(i+1,2)+y(i-1,2)-y(i,1)
          enddo
          do i=2,999
           do jt=2,3
             y(i,jt-1)=y(i,jt)
           enddo
          enddo
          ni=ii/20
          si=0.05*ii
          if(abs(ni-si)<1.0e-5) then
            print*,ii
            write(8,111) (y(i,3),i=1,1000)
          endif
        enddo ! time steps
        do i=1,1000
          x=0.001*i
          write(7,110) x,y(i,3)
        enddo
        end
