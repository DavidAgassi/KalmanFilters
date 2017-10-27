function Xio_fixAzi = fixAzi(Xio_fixAzi)
    if(abs(Xio_fixAzi) >= pi )
        Xio_fixAzi = Xio_fixAzi -2*pi*sign(Xio_fixAzi);
    end
end