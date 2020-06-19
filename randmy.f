        program randmy
        a=16807
        b=85369686
        x=mod(a*29,b)
        seed=x
        do i=1,100
          x=mod(a*seed,b)
          random=x/b
          print*,random
          seed=x
        enddo
        end
