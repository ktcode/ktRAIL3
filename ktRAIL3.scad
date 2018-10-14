//
// ktRAIL3
//

gap1 = 0.001;
gap2 = 0.002;
m = 8;
w = 38.2+0.3;
t = 2;
h = 8.3;
h2 = 5;
h3 = h-h2;


l = 55;

joint_m();
straight(l-11);
difference()
{
    translate( [0, l-11, 0] ) straight(11, 1);
    translate( [0, l, 0] ) joint_f();
}



module curve_l(r=w, start=0, end=90, step=1, f=0)
{
    a0b = -(r-w);
    a0a = -(r);
    c0b = -(r-w);
    c0a = -(r-w+t);
    c1b = -(r-w+t+m);
    c1a = -(r-w+t+t+m);
    c2b = -(r-t-m-t);
    c2a = -(r-t-m);
    c3b = -(r-t);
    c3a = -(r);
    c4b = -(r-w+t+t+m);
    c4a = -(r-t-m-t);
    
    for( i=[-start: -step: -end+step] )
    {
        a0 = [[a0a*cos(i),a0a*sin(i)],[a0b*cos(i),a0b*sin(i)],[a0b*cos(i-step),a0b*sin(i-step)],[a0a*cos(i-step),a0a*sin(i-step)]];
        b0 = [0,1,2,3];
        a = concat( a0 );
        b = [b0];
        translate( [r, 0, 0] ) linear_extrude( height=h2 ) polygon( a, b );
        
        c0 = [[c0a*cos(i),c0a*sin(i)],[c0b*cos(i),c0b*sin(i)],[c0b*cos(i-step),c0b*sin(i-step)],[c0a*cos(i-step),c0a*sin(i-step)]];
        d0 = [0,1,2,3];
        c1 = [[c1a*cos(i),c1a*sin(i)],[c1b*cos(i),c1b*sin(i)],[c1b*cos(i-step),c1b*sin(i-step)],[c1a*cos(i-step),c1a*sin(i-step)]];
        d1 = [4,5,6,7];
        c2 = [[c2a*cos(i),c2a*sin(i)],[c2b*cos(i),c2b*sin(i)],[c2b*cos(i-step),c2b*sin(i-step)],[c2a*cos(i-step),c2a*sin(i-step)]];
        d2 = [8,9,10,11];
        c3 = [[c3a*cos(i),c3a*sin(i)],[c3b*cos(i),c3b*sin(i)],[c3b*cos(i-step),c3b*sin(i-step)],[c3a*cos(i-step),c3a*sin(i-step)]];
        d3 = [12,13,14,15];
        c4 = [[c4a*cos(i),c4a*sin(i)],[c4b*cos(i),c4b*sin(i)],[c4b*cos(i-step),c4b*sin(i-step)],[c4a*cos(i-step),c4a*sin(i-step)]];
        d4 = [16,17,18,19];

        if (f==1)
        {
            c = concat( c0, c1, c2, c3, c4 );
            d = [d0,d1,d2,d3,d4];
            translate( [r, 0, h2] ) linear_extrude( height=h3 ) polygon( c, d );
        }
        else
        {
            c = concat( c0, c1, c2, c3 );
            d = [d0,d1,d2,d3];
            translate( [r, 0, h2] ) linear_extrude( height=h3 ) polygon( c, d );
        }
    }
}


module curve_r(r=w, start=0, end=90, step=1, f=0)
{
    a0a = r-w;
    a0b = r;
    c0a = r-w;
    c0b = r-w+t;
    c1a = r-w+t+m;
    c1b = r-w+t+t+m;
    c2a = r-t-m-t;
    c2b = r-t-m;
    c3a = r-t;
    c3b = r;
    c4a = r-w+t+t+m;
    c4b = r-t-m-t;
    
    for( i=[start: step: end-step] )
    {
        a0 = [[a0a*cos(i),a0a*sin(i)],[a0b*cos(i),a0b*sin(i)],[a0b*cos(i+step),a0b*sin(i+step)],[a0a*cos(i+step),a0a*sin(i+step)]];
        b0 = [0,1,2,3];
        a = concat( a0 );
        b = [b0];
        translate( [-r+w, 0, 0] ) linear_extrude( height=h2 ) polygon( a, b );
        
        c0 = [[c0a*cos(i),c0a*sin(i)],[c0b*cos(i),c0b*sin(i)],[c0b*cos(i+step),c0b*sin(i+step)],[c0a*cos(i+step),c0a*sin(i+step)]];
        d0 = [0,1,2,3];
        c1 = [[c1a*cos(i),c1a*sin(i)],[c1b*cos(i),c1b*sin(i)],[c1b*cos(i+step),c1b*sin(i+step)],[c1a*cos(i+step),c1a*sin(i+step)]];
        d1 = [4,5,6,7];
        c2 = [[c2a*cos(i),c2a*sin(i)],[c2b*cos(i),c2b*sin(i)],[c2b*cos(i+step),c2b*sin(i+step)],[c2a*cos(i+step),c2a*sin(i+step)]];
        d2 = [8,9,10,11];
        c3 = [[c3a*cos(i),c3a*sin(i)],[c3b*cos(i),c3b*sin(i)],[c3b*cos(i+step),c3b*sin(i+step)],[c3a*cos(i+step),c3a*sin(i+step)]];
        d3 = [12,13,14,15];
        c4 = [[c4a*cos(i),c4a*sin(i)],[c4b*cos(i),c4b*sin(i)],[c4b*cos(i+step),c4b*sin(i+step)],[c4a*cos(i+step),c4a*sin(i+step)]];
        d4 = [16,17,18,19];

        if (f==1)
        {
            c = concat( c0, c1, c2, c3, c4 );
            d = [d0,d1,d2,d3,d4];
            translate( [-r+w, 0, h2] ) linear_extrude( height=h3 ) polygon( c, d );
        }
        else
        {
            c = concat( c0, c1, c2, c3 );
            d = [d0,d1,d2,d3];
            translate( [-r+w, 0, h2] ) linear_extrude( height=h3 ) polygon( c, d );
        }
    }
}



module straight(l, f=0)
{
    a0 = [[0,0],[w,0],[w,l],[0,l]];
    b0 = [0,1,2,3];
    a = concat( a0 );
    b = [b0];
    translate( [0, 0, 0] ) linear_extrude( height=h2 ) polygon( a, b );
    
    c0 = [[0,0],[t,0],[t,l],[0,l]];
    d0 = [0,1,2,3];
    c1 = [[t+m,0],[t+m+t,0],[t+m+t,l],[t+m,l]];
    d1 = [4,5,6,7];
    c2 = [[w-t-m-t,0],[w-t-m,0],[w-t-m,l],[w-t-m-t,l]];
    d2 = [8,9,10,11];
    c3 = [[w-t,0],[w,0],[w,l],[w-t,l]];
    d3 = [12,13,14,15];
    c4 = [[t+m+t,0],[w-t-m-t,0],[w-t-m-t,l],[t+m+t,l]];
    d4 = [16,17,18,19];

    if (f==1)
    {
        c = concat( c0, c1, c2, c3, c4 );
        d = [d0,d1,d2,d3,d4];
        translate( [0, 0, h2] ) linear_extrude( height=h3 ) polygon( c, d );
    }
    else
    {
        c = concat( c0, c1, c2, c3 );
        d = [d0,d1,d2,d3];
        translate( [0, 0, h2] ) linear_extrude( height=h3 ) polygon( c, d );
    }
}

module joint_m()
{
    a0 = [[9.25,t],[9.25,0],[4.7,0],[6.35,-9],[0.7,-9],[0.7,-2.5],[-0.7,-2.5],[-0.7,-9],[-6.35,-9],[-4.7,0],[-9.25,0],[-9.25,t]];
    b0 = [0,1,2,3,4,5,6,7,8,9,10,11];
    a1 = [[4.7-t*0.5,0],[6.35-t*0.5,-9+t*0.5],[0.7,-9+t*0.5],[0.7,-2.5],[-0.7,-2.5],[-0.7,-9+t*0.5],[-6.35+t*0.5,-9+t*0.5],[-4.7+t*0.5,0]];
    b1 = [12,13,14,15,16,17,18,19,20];
    a = concat( a0 );
    b = [b0];
    c = concat( a0, a1 );
    d = [b0, b1];
    translate( [w/2, 0, 0] ) linear_extrude( height=h2 ) polygon( a, b );
    translate( [w/2, 0, h2] ) linear_extrude( height=h3 ) polygon( c, d );
}

module joint_f()
{
    a0 = [[4.78,0],[6.55,-9.25],[-6.55,-9.25],[-4.78,0]];
    b0 = [0,1,2,3];
    a = concat( a0 );
    b = [b0];
    translate( [w/2, gap1, -gap1] ) linear_extrude( height=h+gap2 ) polygon( a, b );
}
