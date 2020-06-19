        program dla
        integer iclx(1000),icly(1000)
        open(7,file="dla-cluster")
        print*,"Enter the number of atoms in the cluster"
        read(5,*) nacf
        nt=10000
  111   format(2(2x,i3))
        iclx(1)=0
        icly(1)=0
        nac=1
   1    continue
        rad=0.0
        do i=1,nac
          if(iclx(i)>rad) then
            rad=iclx(i)
          endif
          if(icly(i)>rad) then
            rad=icly(i)
          endif
        enddo
        rad=rad+5.0
        do iw=1,50000 !walkers
          r1=rand(0)
          atx=r1*rad
          iatx=int(atx)
          r2=rand(0)
          if(r2<0.5) then 
            iatx=-iatx
          endif
          iaty=int(sqrt(rad**2-atx**2))
          r3=rand(0)
          if(r3<0.5) then
            iaty=-iaty
          endif
          do it=1,nt ! time steps
            r2=rand(0)
            if(r2<0.5) then
              iatx=iatx+1
              if(r2<0.5) then
                iatx=iatx-2
              endif
            else
              iaty=iaty+1
              if(r2<0.75) then
                iaty=iaty-2
              endif
            endif
            do i=1,nac
              difx=iatx-iclx(i)
              dify=iaty-icly(i)
              dif=sqrt(difx**2+dify**2)
              if(dif<1.0001) then
                goto 2
              endif
            enddo
          enddo ! time steps
        enddo !walkers
   2    continue 
        nac=nac+1
        iclx(nac)=iatx
        icly(nac)=iaty
        if(nac<nacf) then
          goto 1
        endif
        do i=1,nacf
          write(7,111) iclx(i),icly(i)
        enddo
        end
