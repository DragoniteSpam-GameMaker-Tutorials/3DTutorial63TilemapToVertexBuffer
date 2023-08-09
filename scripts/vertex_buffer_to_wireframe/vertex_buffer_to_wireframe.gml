function vertex_buffer_to_wireframe(vbuff) {
    var wire_buff = vertex_create_buffer();
    vertex_begin(wire_buff, Camera.vertex_format);
    
    var data = buffer_create_from_vertex_buffer(vbuff, buffer_fixed, 1);
    
    while (buffer_tell(data) < buffer_get_size(data)) {
        var ax = buffer_read(data, buffer_f32);
        var ay = buffer_read(data, buffer_f32);
        var az = buffer_read(data, buffer_f32);
        var anx = buffer_read(data, buffer_f32);
        var any = buffer_read(data, buffer_f32);
        var anz = buffer_read(data, buffer_f32);
        var atx = buffer_read(data, buffer_f32);
        var aty = buffer_read(data, buffer_f32);
        var ar = buffer_read(data, buffer_u8);
        var ag = buffer_read(data, buffer_u8);
        var ab = buffer_read(data, buffer_u8);
        var aa = buffer_read(data, buffer_u8);
        
        var bx = buffer_read(data, buffer_f32);
        var by = buffer_read(data, buffer_f32);
        var bz = buffer_read(data, buffer_f32);
        var bnx = buffer_read(data, buffer_f32);
        var bny = buffer_read(data, buffer_f32);
        var bnz = buffer_read(data, buffer_f32);
        var btx = buffer_read(data, buffer_f32);
        var bty = buffer_read(data, buffer_f32);
        var br = buffer_read(data, buffer_u8);
        var bg = buffer_read(data, buffer_u8);
        var bb = buffer_read(data, buffer_u8);
        var ba = buffer_read(data, buffer_u8);
        
        var cx = buffer_read(data, buffer_f32);
        var cy = buffer_read(data, buffer_f32);
        var cz = buffer_read(data, buffer_f32);
        var cnx = buffer_read(data, buffer_f32);
        var cny = buffer_read(data, buffer_f32);
        var cnz = buffer_read(data, buffer_f32);
        var ctx = buffer_read(data, buffer_f32);
        var cty = buffer_read(data, buffer_f32);
        var cr = buffer_read(data, buffer_u8);
        var cg = buffer_read(data, buffer_u8);
        var cb = buffer_read(data, buffer_u8);
        var ca = buffer_read(data, buffer_u8);
        
        vertex_add_point(wire_buff, ax, ay, az, anx, any, anz, atx, aty, make_colour_rgb(ar, ag, ab), aa);
        vertex_add_point(wire_buff, bx, by, bz, bnx, bny, bnz, btx, cty, make_colour_rgb(br, bg, bb), ba);
        
        vertex_add_point(wire_buff, bx, by, bz, bnx, bny, bnz, btx, cty, make_colour_rgb(br, bg, bb), ba);
        vertex_add_point(wire_buff, cx, cy, cz, cnx, cny, cnz, ctx, cty, make_colour_rgb(cr, cg, cb), ca);
        
        vertex_add_point(wire_buff, cx, cy, cz, cnx, cny, cnz, ctx, cty, make_colour_rgb(cr, cg, cb), ca);
        vertex_add_point(wire_buff, ax, ay, az, anx, any, anz, atx, aty, make_colour_rgb(ar, ag, ab), aa);
    }
    
    vertex_end(wire_buff);
    
    buffer_delete(data);
    
    return wire_buff;
}