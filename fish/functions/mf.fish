function mf
    set -l i 1
    for file in *.$argv[3]
        mv $file "$argv[1]_S$argv[2]E$i.$argv[3]"
        set i (math $i + 1)
    end
end
