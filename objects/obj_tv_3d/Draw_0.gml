draw_self();

gpu_set_depth(depth-1)
draw_surface_stretched(obj_3d.cam_3d.surface, x + 4, y + 4,56,56);
gpu_set_depth(depth+1)