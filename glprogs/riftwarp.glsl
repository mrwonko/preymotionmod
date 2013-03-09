// I think the shader should look something like this.
// I'll likely need two though, one for each half

#ifdef GL_ES
precision highp float;
#endif

uniform float time;
uniform vec2 resolution;
uniform vec4 mouse;
uniform sampler2D tex0;

void main(void)
{
	const float FACTOR = 2.;
	
	vec2 center = vec2(0.5, 0.5);
	// coordinate in [0, 1]
	vec2 coord_in = gl_FragCoord.xy / resolution;
	vec2 delta_center_in = coord_in - center;
	float dist_center_in = sqrt( dot( delta_center_in, delta_center_in ) );
	float dist_center_out = dist_center_in * 
		(1. + dist_center_in * dist_center_in * FACTOR );
	dist_center_out *= 1./(1.+0.5*0.5*FACTOR);
	vec2 delta_center_out = delta_center_in;
	if( dist_center_in != 0. )
	{
		delta_center_out *= dist_center_out / dist_center_in;
	}
	vec2 coord_out = delta_center_out + center;
	gl_FragColor = texture2D( tex0, coord_out );
}