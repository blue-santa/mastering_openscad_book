/*
OpenSCAD test project
//*/
//
//// Comment
//
//adjustment = 0.7;
//adjustment_factor = 2;
//
//function adjust(x) = (x + adjustment) * adjustment_factor;
//
//cube(size = 10, center = true);
//
//translate( [ 5, 0, 0] )
//rotate ( [0, 0, 45] ) 
//translate( [20, 0, 0] ) 
//cube(10, true);

// dimensions in millimeter [ width, depth, height ]

module hole_plate( size, hole_dm, hole_margin, hole_count = [ 2, 2] ) {

    abs_margin = hole_margin + hole_dm / 2;
    
    x_hole_dist = 
        (size.x - 2 * abs_margin) 
        / (hole_count.x - 1) ;
    
    y_hole_dist = 
        (size.y - 2 * abs_margin)
        / (hole_count.y - 1) ;
    x_values = [abs_margin : x_hole_dist : size.x - abs_margin];
    y_values = [abs_margin : y_hole_dist : size.y - abs_margin];
    
    // holes
    
    difference() {
        
    cube( size);
    
    for (x = x_values, y = y_values)
        translate( [x, y, -1] )
    color( "red" )
    cylinder( d = hole_dm, h = size.z + 2);
    
    }

}


plate = [100, 50, 5];

hole_plate( plate, 6, 4);

translate( [ 0, 60, 0] )
rotate( [ 45, 45, 0 ] )
hole_plate( [50, 25, 5], 2, 1);

translate( [ 0, 0, 45] )
rotate( [ 0, 0, 90 ] )
hole_plate( [25, 120, 5], 2, 2, [2, 1] );
