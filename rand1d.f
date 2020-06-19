        program randomwalk1d
        real x2a(1000)
        print*,"Enter the number of steps"
        read(5,*) ns
        print*,"Enter the number of walkers"
        read(5,*) nw
        open(7,file="walk")
  110   format(2(2x,i3))
        open(8,file="x2av")
  111   format(2x,i3,2x,e12.5)
        iy=0
        x2a=0.0
        do j=1,nw
          iy=0
          do i=1,ns
            r1=rand(0)
            if(r1<0.5) then
             ist=1
            else
             ist=-1
            endif
            iy=iy+ist
            x2a(i)=x2a(i)+iy*iy
            write(7,110) i,iy
          enddo
        enddo
        do i=1,ns
          x2a(i)=x2a(i)/nw
          write(8,111) i,x2a(i)
        enddo
        end
