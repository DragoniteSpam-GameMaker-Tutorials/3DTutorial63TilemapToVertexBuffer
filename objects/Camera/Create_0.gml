/// @description Set up 3D things

depth = 0;

application_surface_draw_enable(false);
surface_resize(application_surface, 1280, 720);

display_set_gui_maximise();

// Bad things happen if you turn off the depth buffer in 3D
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

gpu_set_cullmode(cull_counterclockwise);

view_mat = undefined;
proj_mat = undefined;

#region vertex format setup
// Vertex format: data must go into vertex buffers in the order defined by this
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();
#endregion

instance_create_depth(0, 0, 0, Player);

znear = 1;
zfar = 32000;

vb_merry = load_model("merry.d3d");
vb_sphere = load_model("sphere.d3d");
vb_trees = [
    load_model("tree1.d3d"),
    load_model("tree2.d3d"),
    load_model("tree3.d3d"),
    load_model("tree4.d3d"),
];

var n = 50;
tree_positions = array_create(n);
for (var i = 0; i < n; i++) {
    var index = irandom(array_length(vb_trees) - 1);
    tree_positions[i] = {
        vbuff: vb_trees[index],
        x: random_range(0, 1600),
        y: random_range(0, 900),
    };
}

tilemap_vb = tilemap_to_vertex_buffer("GroundTiles", vertex_format);