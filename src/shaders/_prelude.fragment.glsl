#ifdef GL_ES
precision mediump float;
#else

#if !defined(lowp)
#define lowp
#endif

#if !defined(mediump)
#define mediump
#endif

#if !defined(highp)
#define highp
#endif

#endif

out highp vec4 fragColor;

// Globe lighting
#ifdef GLOBE
uniform highp vec3 u_globe_light_direction;
uniform highp float u_globe_light_intensity;
in highp vec3 v_globe_normal;

// Apply globe lighting to a color
vec4 applyGlobeLighting(vec4 color) {
    // Normalize the interpolated normal
    vec3 normal = normalize(v_globe_normal);

    // Calculate diffuse lighting (Lambert)
    float diffuse = max(dot(normal, u_globe_light_direction), 0.0);

    // Ambient + diffuse lighting
    float ambient = 1.0 - u_globe_light_intensity;
    float lighting = ambient + diffuse * u_globe_light_intensity;

    return vec4(color.rgb * lighting, color.a);
}
#else
// No-op when not in globe mode
vec4 applyGlobeLighting(vec4 color) {
    return color;
}
#endif
