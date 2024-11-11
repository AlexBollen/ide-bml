MAIN{
    DEC x,y,z;
    INPUT x;
    INPUT y;
    z=1+x+2-3;

    WHILE ( x < 10){
        y = 1 + y;
        x++;
    }
    FOR (z = 2; z < 10; z++) {
        y = y + 1;
        x++;
    }
    IF (p > 20) {
        IF (x > 5) {
            a = a - 10;
        } ELSE {
            o = o + 5;
        }
    } ELSE {
        IF (y < 15) {
            x = x * 2;
        } ELSE {
            q = q - 5;
        }
    }
    OUTPUT z;
}