#pragma mapbox: define highp vec4 color
#pragma mapbox: define lowp float opacity

void main() {
    #pragma mapbox: initialize highp vec4 color
    #pragma mapbox: initialize lowp float opacity

    vec4 baseColor = color * opacity;

    // Apply globe lighting
    fragColor = applyGlobeLighting(baseColor);

#ifdef OVERDRAW_INSPECTOR
    fragColor = vec4(1.0);
#endif
}
