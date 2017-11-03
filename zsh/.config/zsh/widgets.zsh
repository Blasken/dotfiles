# Increment/decrement number under cursor
function _inc_dec_int() {
    integer pos NUMBER new first last length
    pos=$CURSOR
    while [[ $BUFFER[$pos] != [[:digit:]] ]]; do
        (( pos++))
        (( $pos > $#BUFFER )) && return
    done

    NUMBER=${NUMERIC:-1}
    if [[ $WIDGET = dec_int ]]; then
        (( NUMBER = 0 - $NUMBER ))
    fi

    first=$pos
    while [[ $BUFFER[$first-1] = [[:digit:]] ]]; do
        (( first-- ))
    done

    if [[ $BUFFER[$first-1] = - ]]; then
        (( first-- ))
    fi

    last=$pos
    while [[ $BUFFER[$last+1] = [[:digit:]] ]]; do
        (( last++ ))
    done

    length=$#BUFFER[$first,$last]
    new=$BUFFER[$first,$last]
    (( new += NUMBER ))
    if [[ $BUFFER[$first] = 0 ]]; then
        BUFFER[$first,$last]=${(l:$length::0:)new}
    else
        BUFFER[$first,$last]=$new
    fi

    while [[ $BUFFER[$CURSOR] != [[:digit:]] ]]; do
        (( $CURSOR <= $first )) && return
        (( CURSOR-- ))
    done
}
