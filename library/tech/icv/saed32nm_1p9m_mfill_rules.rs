/*
#########################################################################################
# SAED 32/28NM 1p9m icv metal fill drc deck						#
#											#
# Revision History:									#
# Rev.		date			what						#
# -------------------------------------------------------------------------------------	#	
# 1.0		02/Feb/2011		(First draft)					#
#########################################################################################
*/


#include "icv.rh"		
#include "math.rh"
/*#define MilkyWay_Y*/
#define Merge_Input_Original

library(
	library_name  = "*",  
	format = GDSII,
	cell = "*"

);

	
  
NWELL 		= 	assign({{1}});
DNW		=	assign({{2}});
DIFF		=	assign({{3}});
DDMY		=	assign({{3,1}});
PIMP		=	assign({{4}});
NIMP		=	assign({{5}});
DIFF_18		=	assign({{6}});
PAD		=	assign({{7}});
ESD_25		=	assign({{8}});
SBLK		=	assign({{9}});
PO		=	assign({{10}});
PODMY		=	assign({{10,1}});
M1		=	assign({{11}});
M1_TEXT		=	assign_text({{11}});
M1DMY		=	assign({{11,1}});
VIA1		=	assign({{12}});
M2		=	assign({{13}});
M2_TEXT		=	assign_text({{13}});
M2DMY		=	assign({{13,1}});
VIA2		=	assign({{14}});
M3		=	assign({{15}});
M3_TEXT		=	assign_text({{15}});
M3DMY		=	assign({{15,1}});
VIA3		=	assign({{16}});
M4		=	assign({{17}});
M4_TEXT		=	assign_text({{17}});
M4DMY		=	assign({{17,1}});
VIA4 		=	assign({{18}});
M5		=	assign({{19}});
M5_TEXT		=	assign_text({{19}});
M5DMY		=	assign({{19,1}});
VIA5		=	assign({{20}});
M6		=	assign({{21}});
M6_TEXT		=	assign_text({{21}});
M6DMY		=	assign({{21,1}});
VIA6		=	assign({{22}});
M7		=	assign({{23}});
M7_TEXT		=	assign_text({{23}});
M7DMY		=	assign({{23,1}});
VIA7		=	assign({{24}});
M8		=	assign({{25}});
M8_TEXT		=	assign_text({{25}});
M8DMY		=	assign({{25,1}});
VIA8		=	assign({{26}});
M9		=	assign({{27}});
M9_TEXT		=	assign_text({{27}});
M9DMY		=	assign({{27,1}});
CO		=	assign({{28}}); 
HVTIMP		=	assign({{29}});
LVTIMP		=	assign({{30}});
M1PIN		=	assign({{31}});
M1PIN_TEXT	=	assign_text({{31}});
M2PIN		=	assign({{32}});
M2PIN_TEXT	=	assign_text({{32}});
M3PIN		=	assign({{33}});
M3PIN_TEXT	=	assign_text({{33}});
M4PIN		=	assign({{34}});
M4PIN_TEXT	=	assign_text({{34}});
M5PIN		=	assign({{35}});
M5PIN_TEXT	=	assign_text({{35}});
M6PIN		=	assign({{36}});
M6PIN_TEXT	=	assign_text({{36}});
M7PIN		=	assign({{37}});
M7PIN_TEXT	=	assign_text({{37}});
M8PIN		=	assign({{38}});
M8PIN_TEXT	=	assign_text({{38}});
M9PIN		=	assign({{39}});
M9PIN_TEXT	=	assign_text({{39}});
MRDL		=	assign({{41}});
VIARDL		=	assign({{42}});
MRPIN		=	assign({{43}});
HOTNWL		=	assign({{44}});
DIODMARK	=	assign({{46}});
BJTMARK		=	assign({{47}});
RNW		=	assign({{48}});
RMARKER		=	assign({{49}});
LOGO		=	assign({{51}});
IP		=	assign({{52}});
RM1		=	assign({{53}});
RM2		=	assign({{54}});
RM3		=	assign({{55}});
RM4		=	assign({{56}});
RM5		=	assign({{57}});
RM6		=	assign({{58}});
RM7		=	assign({{59}});
RM8		=	assign({{60}});
RM9		=	assign({{61}});
DM1EXCL 	= 	assign({{64}});
DM2EXCL 	=	assign({{65}});
DM3EXCL 	=	assign({{66}});
DM4EXCL 	=	assign({{67}});
DM5EXCL 	=	assign({{68}});
DM6EXCL 	=	assign({{69}});
DM7EXCL 	=	assign({{70}});
DM8EXCL 	=	assign({{71}});
DM9EXCL 	=	assign({{72}});
DIFFEXCL	=	assign({{73}});
POEXCL		=	assign({{74}});
DIFF_25	        =	assign({{75}});


double_constraint_contains : published function (
    con : constraint of double,
    val : double
)
    returning result : boolean
{
    cat = con.category();

    result = false;

    if (cat == CONSTRAINT_EQ) {
        result = dbleq(val, con.lo());
    }
    elif (cat == CONSTRAINT_NE) {
        result = dblne(val, con.lo());
    }
    elif (cat == CONSTRAINT_GE) {
        result = dblge(val, con.lo());
    }
    elif (cat == CONSTRAINT_GT) {
        result = dblgt(val, con.lo());
    }
    elif (cat == CONSTRAINT_LE) {
        result = dblle(val, con.hi());
    }
    elif (cat == CONSTRAINT_LT) {
        result = dbllt(val, con.hi());
    }
    elif (cat == CONSTRAINT_GELE) {
        result = (dblge(val, con.lo()) && dblle(val, con.hi()));
    }
    elif (cat == CONSTRAINT_GELT) {
        result = (dblge(val, con.lo()) && dbllt(val, con.hi()));
    }
    elif (cat == CONSTRAINT_GTLE) {
        result = (dblgt(val, con.lo()) && dblle(val, con.hi()));
    }
    elif (cat == CONSTRAINT_GTLT) {
        result = (dblgt(val, con.lo()) && dbllt(val, con.hi()));
    }
}

void_func_s : newtype struct of {
    func : function (void) returning void;
};
void_func_h : newtype hash of string to void_func_s;

net_area_ratio : published function (
    cdb_in          : connect_database,
    con             : constraint,
    n_layers        : list of polygon_layer,
    d_layers        : list of polygon_layer = { },
    expression      : string                = "",
    expr_is_default : boolean               = false 
)
    returning net_area_ratio_result : polygon_layer
{
    nar_funcs    : void_func_h = { };
    nar_func     : function (void) returning void;
    layer_groups : layer_groups_h = { };
    con2all      : list of polygon_layer;
    con2any      : list of polygon_layer;
    not_con2any  : list of polygon_layer;

    num : integer = n_layers.size();
    den : integer = d_layers.size();

    /* Declare and register equation code function. */
    nar_save_net_1 : function (void) returning void
    {
        areaL1 = ns_net_area("layer1");
        areaL2 = ns_net_area("layer2");

        svrf_special_case : boolean = ((con.category() == CONSTRAINT_EQ) && dbleq(con.lo(), 0));
        if (( areaL2 > 0) || svrf_special_case) {
            ratio = ( areaL2 > 0) ? (areaL1 / areaL2) : 0;

            if (double_constraint_contains(con, ratio)) {
                ns_save_net({"ratio"}, {ratio});
            }
        }
    }
    nar_funcs["ns_net_area('layer1') / ns_net_area('layer2')"] = { nar_save_net_1 };

    /* Lookup the net_function to use in this num/den instance. */
    nar_func = nar_funcs[expression].func;

    /* Populate layer_groups dynamically, based off of input lists. */
    for (i = 0 to num-1) {
        layer_groups["layer" + (i+1)] = n_layers[i];
    }
    for (i = 0 to den-1) {
        layer_groups["layer" + (i+1+num)] = d_layers[i];
    }


    if ((con.category() == CONSTRAINT_EQ) && !(con.lo() > 0.0)) {
        con2all     = { n_layers[0] };
        con2any     = { };
        not_con2any = d_layers;
    }
    elif ((con.category() == CONSTRAINT_LT) ||
          (con.category() == CONSTRAINT_LE) ||
          (con.category() == CONSTRAINT_NE)) {
        con2all     = { n_layers[0] };
        con2any     = { };
        not_con2any = { };
    }
    else {
        con2all     = { n_layers[0] };
        con2any     = (expr_is_default) ? d_layers : { };
        not_con2any = { };
    }

    net_area_ratio_result = net_select(
        connect_sequence     = cdb_in,
        net_function         = nar_func,
        layer_groups         = layer_groups,
        connected_to_all     = con2all,
        connected_to_any     = con2any,
        not_connected_to_any = not_con2any,
        output_from_layers   = { n_layers[0] }
    );
}
ornet : published function (
    input1 : polygon_layer,
    input2 : polygon_layer,
    connect_sequence : connect_database
)
    returning ornet_result : polygon_layer
{

    diffTemp = external2(input1, input2, < 0,
                         extension        = RADIAL,
                         relational       = { OVERLAP },
                         relational_type  = POLYGON,
                         orientation      = { },
                         intersecting     = { },
                         connectivity     = DIFFERENT_NET,
                         connect_sequence = connect_sequence);
    iactDiff1 = interacting(input1,diffTemp);
    iactDiff2 = interacting(input2, diffTemp);
    not_ornet_polygons = or(iactDiff1,iactDiff2);


    sameTemp = external2(input1, input2, < 0,
                         extension        = RADIAL,
                         relational       = { OVERLAP },
                         relational_type  = POLYGON,
                         orientation      = { },
                         intersecting     = { },
                         connectivity     = SAME_NET,
                         connect_sequence = connect_sequence);
    iactSame1 = interacting(input1,sameTemp);
    iactSame2 = interacting(input2,sameTemp);
    ornet_polygons = or(iactSame1,iactSame2);


    or_inputs = or(input1, input2);
    not_or_inputs = not(or_inputs, not_ornet_polygons);
    ornet_result = or(not_or_inputs,ornet_polygons);
}

density_wrapper : published function (
    con                      : constraint of double,
    window_layer             : polygon_layer,
    layer_hash               : layer_list_h,
    expression               : string,
    den_polygon_area_clip    : boolean                                = true,
    centered_square_size     : double                                 = 0.0,
    boundary                 : density_boundary_action_e              = CLIP,
    output_type              : density_output_shape_e                 = DELTA_WINDOW,
    output_center_dimensions : delta_window_s                         = { 0.0, 0.0 },
    process_delta_windows    : density_delta_window_mode_e            = OVERLAPPING,
    delta_window             : delta_window_s                         = { -1.0, -1.0 },
    delta_x                  : double                                 = -1.0,
    delta_y                  : double                                 = -1.0,
    resize_delta_xy          : boolean                                = false,
    x_edge_process_amount    : double                                 = -1.0,
    y_edge_process_amount    : double                                 = -1.0,
    area_clip_delta_percent  : double                                 = -1.0,
    statistics_files         : list of density_statistics_file_handle = {},
    statistics_file_modes    : list of density_statistics_file_mode_e = { OVERWRITE },
    print                    : boolean                                = false,
    print_only               : boolean                                = false
)
    returning void
{
    den_funcs : void_func_h = { };
    den_func  : function (void) returning void;


    den_save_window_2 : function (void) returning void
    {
        areaL1 = den_polygon_area("layer1", clip = den_polygon_area_clip);
        areaL2 = den_polygon_area("layer2", clip = den_polygon_area_clip);
        
        ratio = areaL1 / areaL2;

        if (double_constraint_contains(con, ratio)) {
            if (!print_only) {
                den_save_window(error_names = { "ratio", "areaL1", "areaL2" },
                                values      = { ratio, areaL1, areaL2 }
                );
            }
        
            if (print || print_only) {
                den_window_statistics(
                    which_file  = 0,
                    error_names = { "ratio", "areaL1", "areaL2" },
                    values      = { ratio, areaL1, areaL2 }
                );
            }
        }
    }
    den_funcs["den_polygon_area('layer1') / den_polygon_area('layer2')"] = { den_save_window_2 };

    den_save_window_3 : function (void) returning void
    {
        areaL1 = den_polygon_area("layer1", clip = den_polygon_area_clip);
        areaW = den_window_area();
        
        ratio = areaL1 / areaW;

        if (double_constraint_contains(con, ratio)) {
            if (!print_only) {
                den_save_window(error_names = { "ratio", "areaL1", "areaW" },
                                values      = { ratio, areaL1, areaW }
                );
            }
        
            if (print || print_only) {
                den_window_statistics(
                    which_file  = 0,
                    error_names = { "ratio", "areaL1", "areaW" },
                    values      = { ratio, areaL1, areaW }
                );
            }
        }
    }
    den_funcs["den_polygon_area('layer1') / den_window_area()"] = { den_save_window_3 };

    den_func = den_funcs[expression].func;

    density(
        window_layer             = window_layer,
        layer_hash               = layer_hash,
        window_function          = den_func,
        centered_square_size     = centered_square_size,
        boundary                 = boundary,
        output_type              = output_type,
        output_center_dimensions = output_center_dimensions,
        process_delta_windows    = process_delta_windows,
        delta_window             = delta_window,
        delta_x                  = delta_x,
        delta_y                  = delta_y,
        resize_delta_xy          = resize_delta_xy,
        x_edge_process_amount    = x_edge_process_amount,
        y_edge_process_amount    = y_edge_process_amount,
        area_clip_delta_percent  = area_clip_delta_percent,
        statistics_files         = statistics_files,
        statistics_file_modes    = statistics_file_modes
    );
}


size_inside_wrapper : published function (
    layer1        : polygon_layer,
    bounding      : polygon_layer,
    distance      : double,
    increment     : double = 0.0,
    radial_points : radial_points_e = ONE
)
    returning size_inside_wrapper_result : polygon_layer
{
    size_pl : polygon_layer;

    if (dblge(increment, distance) || dbleq(increment, 0.0)) {
        size_pl  = size(layer1, distance, clip_acute = BISECTOR);
        size_inside_wrapper_result = and(size_pl, bounding);
    }
    else {
        size_inside_wrapper_result =
            size_inside(layer1,
                        bounding,
                        distance      = distance,
                        increment     = increment,
                        output_type   = OVERSIZE,
                        radial_points = radial_points);
    }
}

density_wrapper : published function (
    con                      : constraint of double,
    window_layer             : polygon_layer,
    layer_hash               : layer_list_h,
    expression               : string,
    den_polygon_area_clip    : boolean                                = true,
    centered_square_size     : double                                 = 0.0,
    boundary                 : density_boundary_action_e              = CLIP,
    output_type              : density_output_shape_e                 = DELTA_WINDOW,
    output_center_dimensions : delta_window_s                         = { 0.0, 0.0 },
    process_delta_windows    : density_delta_window_mode_e            = OVERLAPPING,
    delta_window             : delta_window_s                         = { -1.0, -1.0 },
    delta_x                  : double                                 = -1.0,
    delta_y                  : double                                 = -1.0,
    resize_delta_xy          : boolean                                = false,
    x_edge_process_amount    : double                                 = -1.0,
    y_edge_process_amount    : double                                 = -1.0,
    area_clip_delta_percent  : double                                 = -1.0,
    statistics_files         : list of density_statistics_file_handle = {},
    statistics_file_modes    : list of density_statistics_file_mode_e = { OVERWRITE },
    print                    : boolean                                = false,
    print_only               : boolean                                = false
)
    returning density_wrapper_result : polygon_layer
{
    den_funcs : void_func_h = { };
    den_func  : function (void) returning void;

    den_save_window_2 : function (void) returning void
    {
        areaL1 = den_polygon_area("layer1", clip = den_polygon_area_clip);
        areaL2 = den_polygon_area("layer2", clip = den_polygon_area_clip);
        
        ratio = areaL1 / areaL2;

        if (double_constraint_contains(con, ratio)) {
            if (!print_only) {
                den_save_window(error_names = { "ratio", "areaL1", "areaL2" },
                                values      = { ratio, areaL1, areaL2 }
                );
            }
        
            if (print || print_only) {
                den_window_statistics(
                    which_file  = 0,
                    error_names = { "ratio", "areaL1", "areaL2" },
                    values      = { ratio, areaL1, areaL2 }
                );
            }
        }
    }
    den_funcs["den_polygon_area('layer1') / den_polygon_area('layer2')"] = { den_save_window_2 };
 

    den_save_window_3 : function (void) returning void
    {
        areaL1 = den_polygon_area("layer1", clip = den_polygon_area_clip);
        areaW = den_window_area();
        
        ratio = areaL1 / areaW;

        if (double_constraint_contains(con, ratio)) {
            if (!print_only) {
                den_save_window(error_names = { "ratio", "areaL1", "areaW" },
                                values      = { ratio, areaL1, areaW }
                );
            }
        
            if (print || print_only) {
                den_window_statistics(
                    which_file  = 0,
                    error_names = { "ratio", "areaL1", "areaW" },
                    values      = { ratio, areaL1, areaW }
                );
            }
        }
    }
    den_funcs["den_polygon_area('layer1') / den_window_area()"] = { den_save_window_3 };


    den_func = den_funcs[expression].func;

    density_wrapper_result = density(
        window_layer             = window_layer,
        layer_hash               = layer_hash,
        window_function          = den_func,
        centered_square_size     = centered_square_size,
        boundary                 = boundary,
        output_type              = output_type,
        output_center_dimensions = output_center_dimensions,
        process_delta_windows    = process_delta_windows,
        delta_window             = delta_window,
        delta_x                  = delta_x,
        delta_y                  = delta_y,
        resize_delta_xy          = resize_delta_xy,
        x_edge_process_amount    = x_edge_process_amount,
        y_edge_process_amount    = y_edge_process_amount,
        area_clip_delta_percent  = area_clip_delta_percent,
        statistics_files         = statistics_files,
        statistics_file_modes    = statistics_file_modes
    );
}



//##### Fill funciton ####
FILL_WIDTH : double = 0;
FILL_HEIGHT : double = 0;
FILL_SPACEX : double = 0; 
FILL_SPACEY : double = 0;
FILL_STAGGERX : double = 0; 
FILL_STAGGERY : double = 0;

fill_func : function (void) returning void{
	fp_generate_fill(
	    polygon = fp_get_current_polygon(),
	    width = FILL_WIDTH, 
	    height = FILL_HEIGHT, 
	    space_x = FILL_SPACEX, 
	    space_y = FILL_SPACEY,
	    stagger_x = FILL_STAGGERX,
	    stagger_y = FILL_STAGGERY
	);
};
FORM_AREF : boolean = true;
SAED_fill_func : function (
	input_layer : polygon_layer,
	width : double,
	height : double,
	space_x : double,
	space_y : double,
	stagger_x : double = 0,
	stagger_y : double = 0,
	MINSPACE : double = 0,
	AREF : boolean = false,
	user_prefix : string = ""
) returning fills : polygon_layer {
    FILL_WIDTH = width;
    FILL_HEIGHT = height;
    FILL_SPACEX = space_x;
    FILL_SPACEY = space_y;
    FILL_STAGGERX = stagger_x;
    FILL_STAGGERY = stagger_y;

    if ( MINSPACE > 0 ){
	if ( AREF ) {
	    fills = fill_pattern(layer1 = input_layer, fill_function = fill_func, min_space = MINSPACE, grid_mode = LOCAL, grid = 0.001, output_aref = {AREF, cell_prefix = user_prefix}); 
	}else{
	    fills = fill_pattern(layer1 = input_layer, fill_function = fill_func, min_space = MINSPACE, grid_mode = LOCAL, grid =0.001); 
	}
    }else{
	if ( AREF ) {
	    fills = fill_pattern(layer1 = input_layer, fill_function = fill_func, grid_mode = LOCAL, grid = 0.001, output_aref = {AREF, cell_prefix = user_prefix}); 
	}else{
	    fills = fill_pattern(layer1 = input_layer, fill_function = fill_func, grid_mode = LOCAL, grid = 0.001); 
	}
    }
}

//chip = chip_extent();
aBoundary = assign( { {NDM_SYSTEM_LAYER_BOUNDARY} }, ndm = { views = { DESIGN_VIEW } } );
chip = copy(aBoundary);

/////////////////////////////////////////////////////////////METAL1_FILL///////////////////////////////////////////////////////////////

chip_M1 = chip interacting M1;
M1_fill_candidate = density_wrapper( con < 0.1,
                 window_layer = chip_M1,
                 layer_hash = { "layer1" => M1 },
                 expression = "den_polygon_area('layer1') / den_window_area()",
                 delta_window = { 130, 130 },
                 delta_x = 75,
                 delta_y = 75);
M1_sized = size (M1, 0.18);
M1_fill_candidate = M1_fill_candidate not DM1EXCL;
M1_fill_candidate = M1_fill_candidate not M1_sized;
M1_fill_candidate = M1_fill_candidate and chip_M1;

M1_FILL1 = SAED_fill_func(M1_fill_candidate, width = 0.2, height = 0.7, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M1_FILL_");
M1_FILL1_sized = size(M1_FILL1, 0.3);
M1_fill_candidate = M1_fill_candidate not M1_FILL1_sized;

M1_FILL2 = SAED_fill_func(M1_fill_candidate, width = 0.7, height = 0.2, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M1_FILL_");
M1_FILL2_sized = size(M1_FILL2, 0.3);
M1_fill_candidate = M1_fill_candidate not M1_FILL2_sized;

M1_FILL3 = SAED_fill_func(M1_fill_candidate, width = 0.5, height = 0.5, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M1_FILL_");

M1_FILL = M1_FILL1 or M1_FILL2 or M1_FILL3;

/////////////////////////////////////////////////////////////METAL2_FILL///////////////////////////////////////////////////////////////

chip_M2 = chip interacting M2;
M2_fill_candidate = density_wrapper( con < 0.1,
                 window_layer = chip_M2,
                 layer_hash = { "layer1" => M2 },
                 expression = "den_polygon_area('layer1') / den_window_area()",
                 delta_window = { 130, 130 },
                 delta_x = 75,
                 delta_y = 75);
M2_sized = size (M2, 0.18);
M2_fill_candidate = M2_fill_candidate not DM2EXCL;
M2_fill_candidate = M2_fill_candidate not M2_sized;
M2_fill_candidate = M2_fill_candidate and chip_M2;

M2_FILL1 = SAED_fill_func(M2_fill_candidate, width = 0.2, height = 0.7, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M2_FILL_");
M2_FILL1_sized = size(M2_FILL1, 0.3);
M2_fill_candidate = M2_fill_candidate not M2_FILL1_sized;

M2_FILL2 = SAED_fill_func(M2_fill_candidate, width = 0.7, height = 0.2, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M2_FILL_");
M2_FILL2_sized = size(M2_FILL2, 0.3);
M2_fill_candidate = M2_fill_candidate not M2_FILL2_sized;

M2_FILL3 = SAED_fill_func(M2_fill_candidate, width = 0.5, height = 0.5, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M2_FILL_");

M2_FILL = M2_FILL1 or M2_FILL2 or M2_FILL3;

/////////////////////////////////////////////////////////////METAL3_FILL///////////////////////////////////////////////////////////////

chip_M3 = chip interacting M3;
M3_fill_candidate = density_wrapper( con < 0.1,
                 window_layer = chip_M3,
                 layer_hash = { "layer1" => M3 },
                 expression = "den_polygon_area('layer1') / den_window_area()",
                 delta_window = { 130, 130 },
                 delta_x = 75,
                 delta_y = 75);
M3_sized = size (M3, 0.18);
M3_fill_candidate = M3_fill_candidate not DM3EXCL;
M3_fill_candidate = M3_fill_candidate not M3_sized;
M3_fill_candidate = M3_fill_candidate and chip_M3;

M3_FILL1 = SAED_fill_func(M3_fill_candidate, width = 0.2, height = 0.7, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M3_FILL_");
M3_FILL1_sized = size(M3_FILL1, 0.3);
M3_fill_candidate = M3_fill_candidate not M3_FILL1_sized;

M3_FILL2 = SAED_fill_func(M3_fill_candidate, width = 0.7, height = 0.2, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M3_FILL_");
M3_FILL2_sized = size(M3_FILL2, 0.3);
M3_fill_candidate = M3_fill_candidate not M3_FILL2_sized;

M3_FILL3 = SAED_fill_func(M3_fill_candidate, width = 0.5, height = 0.5, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M3_FILL_");

M3_FILL = M3_FILL1 or M3_FILL2 or M3_FILL3;

/////////////////////////////////////////////////////////////METAL4_FILL///////////////////////////////////////////////////////////////

chip_M4 = chip interacting M4;
M4_fill_candidate = density_wrapper( con < 0.1,
                 window_layer = chip_M4,
                 layer_hash = { "layer1" => M4 },
                 expression = "den_polygon_area('layer1') / den_window_area()",
                 delta_window = { 130, 130 },
                 delta_x = 75,
                 delta_y = 75);
M4_sized = size (M4, 0.18);
M4_fill_candidate = M4_fill_candidate not DM4EXCL;
M4_fill_candidate = M4_fill_candidate not M4_sized;
M4_fill_candidate = M4_fill_candidate and chip_M4;

M4_FILL1 = SAED_fill_func(M4_fill_candidate, width = 0.2, height = 0.7, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M4_FILL_");
M4_FILL1_sized = size(M4_FILL1, 0.3);
M4_fill_candidate = M4_fill_candidate not M4_FILL1_sized;

M4_FILL2 = SAED_fill_func(M4_fill_candidate, width = 0.7, height = 0.2, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M4_FILL_");
M4_FILL2_sized = size(M4_FILL2, 0.3);
M4_fill_candidate = M4_fill_candidate not M4_FILL2_sized;

M4_FILL3 = SAED_fill_func(M4_fill_candidate, width = 0.5, height = 0.5, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M4_FILL_");

M4_FILL = M4_FILL1 or M4_FILL2 or M4_FILL3;

/////////////////////////////////////////////////////////////METAL5_FILL///////////////////////////////////////////////////////////////

chip_M5 = chip interacting M5;
M5_fill_candidate = density_wrapper( con < 0.1,
                 window_layer = chip_M5,
                 layer_hash = { "layer1" => M5 },
                 expression = "den_polygon_area('layer1') / den_window_area()",
                 delta_window = { 130, 130 },
                 delta_x = 75,
                 delta_y = 75);
M5_sized = size (M5, 0.18);
M5_fill_candidate = M5_fill_candidate not DM5EXCL;
M5_fill_candidate = M5_fill_candidate not M5_sized;
M5_fill_candidate = M5_fill_candidate and chip_M5;

M5_FILL1 = SAED_fill_func(M5_fill_candidate, width = 0.2, height = 0.7, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M5_FILL_");
M5_FILL1_sized = size(M5_FILL1, 0.3);
M5_fill_candidate = M5_fill_candidate not M5_FILL1_sized;

M5_FILL2 = SAED_fill_func(M5_fill_candidate, width = 0.7, height = 0.2, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M5_FILL_");
M5_FILL2_sized = size(M5_FILL2, 0.3);
M5_fill_candidate = M5_fill_candidate not M5_FILL2_sized;

M5_FILL3 = SAED_fill_func(M5_fill_candidate, width = 0.5, height = 0.5, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M5_FILL_");

M5_FILL = M5_FILL1 or M5_FILL2 or M5_FILL3;

/////////////////////////////////////////////////////////////METAL6_FILL///////////////////////////////////////////////////////////////

chip_M6 = chip interacting M6;
M6_fill_candidate = density_wrapper( con < 0.1,
                 window_layer = chip_M6,
                 layer_hash = { "layer1" => M6 },
                 expression = "den_polygon_area('layer1') / den_window_area()",
                 delta_window = { 130, 130 },
                 delta_x = 75,
                 delta_y = 75);
M6_sized = size (M6, 0.18);
M6_fill_candidate = M6_fill_candidate not DM6EXCL;
M6_fill_candidate = M6_fill_candidate not M6_sized;
M6_fill_candidate = M6_fill_candidate and chip_M6;

M6_FILL1 = SAED_fill_func(M6_fill_candidate, width = 0.2, height = 0.7, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M6_FILL_");
M6_FILL1_sized = size(M6_FILL1, 0.3);
M6_fill_candidate = M6_fill_candidate not M6_FILL1_sized;

M6_FILL2 = SAED_fill_func(M6_fill_candidate, width = 0.7, height = 0.2, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M6_FILL_");
M6_FILL2_sized = size(M6_FILL2, 0.3);
M6_fill_candidate = M6_fill_candidate not M6_FILL2_sized;

M6_FILL3 = SAED_fill_func(M6_fill_candidate, width = 0.5, height = 0.5, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M6_FILL_");

M6_FILL = M6_FILL1 or M6_FILL2 or M6_FILL3;

/////////////////////////////////////////////////////////////METAL7_FILL///////////////////////////////////////////////////////////////

chip_M7 = chip interacting M7;
M7_fill_candidate = density_wrapper( con < 0.1,
                 window_layer = chip_M7,
                 layer_hash = { "layer1" => M7 },
                 expression = "den_polygon_area('layer1') / den_window_area()",
                 delta_window = { 130, 130 },
                 delta_x = 75,
                 delta_y = 75);
M7_sized = size (M7, 0.18);
M7_fill_candidate = M7_fill_candidate not DM7EXCL;
M7_fill_candidate = M7_fill_candidate not M7_sized;
M7_fill_candidate = M7_fill_candidate and chip_M7;

M7_FILL1 = SAED_fill_func(M7_fill_candidate, width = 0.2, height = 0.7, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M7_FILL_");
M7_FILL1_sized = size(M7_FILL1, 0.3);
M7_fill_candidate = M7_fill_candidate not M7_FILL1_sized;

M7_FILL2 = SAED_fill_func(M7_fill_candidate, width = 0.7, height = 0.2, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M7_FILL_");
M7_FILL2_sized = size(M7_FILL2, 0.3);
M7_fill_candidate = M7_fill_candidate not M7_FILL2_sized;

M7_FILL3 = SAED_fill_func(M7_fill_candidate, width = 0.5, height = 0.5, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M7_FILL_");

M7_FILL = M7_FILL1 or M7_FILL2 or M7_FILL3;

/////////////////////////////////////////////////////////////METAL8_FILL///////////////////////////////////////////////////////////////

chip_M8 = chip interacting M8;
M8_fill_candidate = density_wrapper( con < 0.1,
                 window_layer = chip_M8,
                 layer_hash = { "layer1" => M8 },
                 expression = "den_polygon_area('layer1') / den_window_area()",
                 delta_window = { 130, 130 },
                 delta_x = 75,
                 delta_y = 75);
M8_sized = size (M8, 0.18);
M8_fill_candidate = M8_fill_candidate not DM8EXCL;
M8_fill_candidate = M8_fill_candidate not M8_sized;
M8_fill_candidate = M8_fill_candidate and chip_M8;

M8_FILL1 = SAED_fill_func(M8_fill_candidate, width = 0.2, height = 0.7, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M8_FILL_");
M8_FILL1_sized = size(M8_FILL1, 0.3);
M8_fill_candidate = M8_fill_candidate not M8_FILL1_sized;

M8_FILL2 = SAED_fill_func(M8_fill_candidate, width = 0.7, height = 0.2, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M8_FILL_");
M8_FILL2_sized = size(M8_FILL2, 0.3);
M8_fill_candidate = M8_fill_candidate not M8_FILL2_sized;

M8_FILL3 = SAED_fill_func(M8_fill_candidate, width = 0.5, height = 0.5, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M8_FILL_");

M8_FILL = M8_FILL1 or M8_FILL2 or M8_FILL3;

/////////////////////////////////////////////////////////////METAL9_FILL///////////////////////////////////////////////////////////////

chip_M9 = chip interacting M9;
M9_fill_candidate = density_wrapper( con < 0.15,
                 window_layer = chip_M9,
                 layer_hash = { "layer1" => M9 },
                 expression = "den_polygon_area('layer1') / den_window_area()",
                 delta_window = { 130, 130 },
                 delta_x = 75,
                 delta_y = 75);
M9_sized = size (M9, 0.18);
M9_fill_candidate = M9_fill_candidate not DM9EXCL;
M9_fill_candidate = M9_fill_candidate not M9_sized;
M9_fill_candidate = M9_fill_candidate and chip_M9;

M9_FILL1 = SAED_fill_func(M9_fill_candidate, width = 0.2, height = 0.7, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M9_FILL_");
M9_FILL1_sized = size(M9_FILL1, 0.3);
M9_fill_candidate = M9_fill_candidate not M9_FILL1_sized;

M9_FILL2 = SAED_fill_func(M9_fill_candidate, width = 0.7, height = 0.2, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M9_FILL_");
M9_FILL2_sized = size(M9_FILL2, 0.3);
M9_fill_candidate = M9_fill_candidate not M9_FILL2_sized;

M9_FILL3 = SAED_fill_func(M9_fill_candidate, width = 0.5, height = 0.5, space_x = 0.3, space_y = 0.3, stagger_x = 0.2, stagger_y = 0.2, AREF = FORM_AREF, user_prefix = "M9_FILL_");

M9_FILL = M9_FILL1 or M9_FILL2 or M9_FILL3;






#ifndef  MilkyWay_Y
gds_fh1 = gds_library ("special_testgdsout.gds");
write_gds(gds_fh1, holding_cell = "TEST" , 
#ifdef Merge_Input_Original
merge_input_layout = true,
#endif
 cell_prefix = "FD_",  

layers = { {M1_FILL,{11 , 1 } },	
	   {M2_FILL,{13 , 1 } },
	   {M3_FILL,{15 , 1 } },
	   {M4_FILL,{17 , 1 } },
	   {M5_FILL,{19 , 1 } },
	   {M6_FILL,{21 , 1 } },
	   {M7_FILL,{23 , 1 } },
	   {M8_FILL,{25 , 1 } },
           {M9_FILL,{27 , 1 } }
	
}); 
#endif

#ifdef MilkyWay_Y
m_library = milkyway_library ("design_results" , ".");
write_milkyway ( 
	output_library = m_library,
	output_cell = "out",
	view ="filled_",
	mode = OVERWRITE,
	output_hierarchy = true
	
layers = { {M1_FILL,{11 , 1 } },	
	   {M2_FILL,{13 , 1 } },
	   {M3_FILL,{15 , 1 } },
	   {M4_FILL,{17 , 1 } },
	   {M5_FILL,{19 , 1 } },
	   {M6_FILL,{21 , 1 } },
	   {M7_FILL,{23 , 1 } },
	   {M8_FILL,{25 , 1 } },
           {M9_FILL,{27 , 1 } }
});
#endif
