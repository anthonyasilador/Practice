        program eden
        integer iclx(1000),icly(1000),ipx(10000),ipy(1000)
        open(7,file="cluster")
        open(8,file="perimeter")
  110   format(2(2x,i4))
        iclx(1)=100
        icly(1)=100
        print*, "Enter the final number of atoms in the cluster" 
        read(5,*) nacf 
        nac=1
  1     continue 
        nap=1
        do i=1,200
          do j=1,200
            is=0
            do ic=1,nac
              if((i==iclx(ic)).and. (j==icly(ic))) then 
                is=is+1 
              endif 
            enddo 
            if(is==0) then 
              do ic=1,nac
                ix=abs(iclx(ic)-i)
                iy=abs(icly(ic)-j)
                if(((ix==1).and.(iy==0)).or.((ix==0).and.(iy==1)))then
                  ipx(nap)=i 
                  ipy(nap)=j
                  nap=nap+1 
                endif  
              enddo 
            endif 
          enddo 
        enddo    
        r1=rand(0)
        ic=nint(r1*(nap-1))
        if(ic==0) then 
          ic=1 
        endif 
        nac=nac+1
        iclx(nac)=ipx(ic)
        icly(nac)=ipy(ic)
        if(nac<nacf) then 
          goto 1 
        endif
        do i=1,nacf
          write(7,110) iclx(1),icly(1)
        enddo 
        do i=1,nap-1
           write(8,110)ipx(i),ipy(i)
        enddo  
        end 

