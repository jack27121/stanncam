/// @description

var cam = global.stanncams[0].cam_id;
//var projmat = matrix_build_projection_perspective_fov(45,global.game_w/global.game_h,1,32000);
//var viewmat = matrix_build_lookat(100, 100, 0, 0, 0, 0, 0, 0, -1);	
//camera_set_proj_mat(cam, projmat);
//camera_set_view_mat(cam, viewmat);
//camera_apply(cam)

matrix_set(matrix_world,matrix_build(0,0,50,0,0,0,100,100,100));
shader_set(sh_3d)
vertex_submit(mesh,pr_trianglelist,-1);
shader_reset()

matrix_set(matrix_world,matrix_build_identity());