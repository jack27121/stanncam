// Feather disable all

/// @constructor stanncam_3d
/// @description creates a new 3d stanncam
/// @param {Real} [_width=global.game_w]
/// @param {Real} [_height=global.game_h]
/// @param {Bool} [_surface_extra_on=false] - use surface_extra in regular draw events
function stanncam_3d(_width=global.game_w, _height=global.game_h, _surface_extra_on=false, _smooth_draw=true) : __stanncam_base(_width, _height, _surface_extra_on) constructor{
	
	fov = 45;
	
	position = matrix_build(0,0,0,0,0,0,1,1,1);
	rotation = matrix_build(0,0,0,0,0,0,1,1,1);
	scale = matrix_build(0,0,0,0,0,0,1,1,1);
	
	/// @function __step
	/// @description gets called every step
	/// @ignore
	static __step = function(){
		
		var test = matrix_build_lookat(0,0,0,0,1,0,0,0,-1);
		var viewmat = matrix_multiply(matrix_multiply(position,rotation),scale);
		
		var projmat = matrix_build_projection_perspective_fov(fov,width/height,1,32000);
		
		camera_set_view_mat(__camera, viewmat);
		camera_set_proj_mat(__camera, projmat);
		camera_apply(__camera);
	}
	
	#region dynamic functions
		/// @function set_position
		/// @description sets camera position
		/// @ignore
		static set_position = function(_x,_y,_z){
			position = matrix_build(_x,_y,_z,0,0,0,1,1,1);
		}
		
		/// @function set_rotation
		/// @description sets camera rotation
		/// @ignore
		static set_rotation = function(_x,_y,_z){
			rotation = matrix_build(0,0,0,_x,_y,_z,1,1,1);
		}
		
		/// @function translate
		/// @description translate camera
		/// @ignore
		static translate = function(_x,_y,_z){
			var translation = matrix_build(_x,_y,_z,0,0,0,1,1,1);
			position = matrix_multiply(position,translation)
		}
		
		/// @function rotate
		/// @description rotate camera
		/// @ignore
		static rotate = function(_pitch,_yaw,_roll){
			var rotate_amount = matrix_build(0,0,0,_pitch,_yaw,_roll,1,1,1);
			rotation = matrix_multiply(rotation,rotate_amount)
		}
		
		/// @function translate_relative
        /// @description translate camera relative to its rotation
        /// @ignore
        static translate_relative = function(_x, _y, _z) {
			var forward = _matrix_transform_point(rotation,0,0,1);
			var right = _matrix_transform_point(rotation,1,0,0);
			var up = _matrix_transform_point(rotation,0,1,0);
			
			// Calculate relative translation vector
            var dx = _x * right[0] + _y * up[0] + _z * forward[0];
            var dy = _x * right[1] + _y * up[1] + _z * forward[1];
            var dz = _x * right[2] + _y * up[2] + _z * forward[2];
            
            // Apply translation
            var translation = matrix_build(dx, dy, dz, 0, 0, 0, 1, 1, 1);
            position = matrix_multiply(position, translation);
        }
		
		static _matrix_transform_point = function(mat, _x, _y, _z) {
		   return [
		       mat[0] * _x + mat[1] * _y + mat[2]  * _z,
		       mat[4] * _x + mat[5] * _y + mat[6]  * _z,
		       mat[8] * _x + mat[9] * _y + mat[10] * _z,
		   ];
		}
	#endregion
	
}

///// @constructor stanncam_vec3
///// @description vector3 constructor for ease of use
//function stanncam_vec3(_x,_y,_z) constructor {
//	x = _x;
//	y = _y;
//	z = _z;	
	
//	static pitch_rotate = function(_angle){
//		matrix_build()
//	}
//}