        program montecarlo
        real sm(10,10), esm(10,10)
        ej=1.0  
        dt=0.03 
        open(7,file="mag-en")
110   format(3(2x,e12.5))
        smtot=0.0 
        do i=1,10
          do j=1,10
            r1=rand(0)
            sm(i,j)=1.0 
            if(r1<0.5) then 
              sm=-1.0 
            endif 
            smtot=smtot+sm(i,j) 
          enddo 
        enddo       
        print*,smtot 
        temp=5.0*dt 
        do its=1,1000 !time steps 
          etot=0.0
          smtot=0.0 
          do i=2,9
            do j=2,9
              sm4=sm(i,j-1)+sm(i,j+1)+sm(i-1,j)+sm(i+1,j)
              es(i,j)=-ej*sm(i,j)*sm4
              call flip(sm(i,j), esm(i,j),temp)
              etot=etot+esm(i,j)
              smtot=smtot+sm(i,j) 
            enddo  
          enddo 
        enddo !time steps 
        end 

        subroutine flip(smf,esmf,temp)
        esm1=-esmf
        if(esm1<esmf)then 
          smf=-smf 
          esmf=esm1
        else 
          bf=exp(-2.0*esm1/temp) 
          r1=rand(0)
          if(r1<bf) then 
            smf=-smf
            esmf=esm1
        endif 
        return 
        end 
