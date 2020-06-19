        program coffee
        integer iprtx(100),iprty(100)
        open(7,file="distr")
  111   format(2(2x,i3))
        ix=45
        nj=0
        do i=1,10
        iy=45
        do j=1,10
        nj=nj+1
        iprtx(nj)=ix
        iprty(nj)=iy
        iy=iy+1
        enddo
        ix=ix+1
        enddo
        do i=1,100
       write(7,111) iprtx(i),iprty(i)
        enddo
        close(7)
        end
