#version 150

// Checking for the exact alpha value breaks things, so I use this function to cut down on space while also making it work better.

bool compare_floats(float a, float b) {
	
	float targetLess = a - 0.01;
	float targetMore = a + 0.01;
	return (b > targetLess && b < targetMore);
	
}

// For cases in which you want something to have a lower light level, but still be bright when in light.

vec4 apply_partial_emissivity(vec4 inputColor, vec4 originalLightColor, vec3 minimumLightColor) {
    
    vec4 newLightColor = originalLightColor;
    newLightColor.r = max(originalLightColor.r, minimumLightColor.r);
    newLightColor.g = max(originalLightColor.g, minimumLightColor.g);
    newLightColor.b = max(originalLightColor.b, minimumLightColor.b);
    return inputColor * newLightColor;
    
}


// Gets the dimension that an object is in, -1 for The Nether, 0 for The Overworld, 1 for The End.

float get_dimension(vec4 minLightColor) {
    
    if (minLightColor.r == minLightColor.g && minLightColor.g == minLightColor.b) return 0.0; // Shadows are grayscale in The Overworld
    if (minLightColor.r > minLightColor.g) return -1.0; // Shadows are more red in The Nether
    
    return 1.0; // Shadows are slightly green in The End
}

// Gets the face lighting of a block. Credits to Venaxsys for the original function.

vec4 get_block_face_lighting(vec3 normal, float dimension) { 
    
    vec4 faceLighting = vec4(1.0, 1.0, 1.0, 1.0);
    vec3 absNormal = abs(normal);
    float top = 229.0 / 255.0;
    float bottom = 127.0 / 255.0;
    float east = 153.0 / 255.0;
    float north = 204.0 / 255.0;
    
    // Top (only required in the Nether)
    if (normal.y > normal.z && normal.y > normal.x && compare_floats(dimension, -1.0)) faceLighting = vec4(top, top, top, 1.0); // It's not really checking the alpha but I'm too stubborn to change the function name
    
    // Bottom
    if (normal.y < normal.z && normal.y < normal.x && !compare_floats(dimension, -1.0)) faceLighting = vec4(bottom, bottom, bottom, 1.0);
    else if (normal.y < normal.z && normal.y < normal.x && compare_floats(dimension, -1.0)) faceLighting = vec4(top, top, top, 1.0);

    // East-West
    if (absNormal.x > absNormal.z && absNormal.x > absNormal.y) faceLighting = vec4(east, east, east, 1.0);

    // North-South
    if (absNormal.z > absNormal.x && absNormal.z > absNormal.y) faceLighting = vec4(north, north, north, 1.0);

    return faceLighting;
}


// Checks if the face should have lighting.

bool face_lighting_check(int inputAlpha) {

    if (inputAlpha == 254) return false; // Checks for alpha 254, and returns that this face should not be lit. Used for emissiveness
    if (inputAlpha == 253) return false; // Checks for alpha 253, and returns that this face should not be lit. Used for Shade false, non-emissive

    
    // if (inputAlpha == 1) return false; // Checks for low alpha levels, and returns that this face should not be lit. Used for transparent Shade false, non-emissive
    // if (inputAlpha == 2) return false;
    // if (inputAlpha == 3) return false;
    // if (inputAlpha == 4) return false;
    // if (inputAlpha == 5) return false;
    // if (inputAlpha == 6) return false;
    // if (inputAlpha == 7) return false;
    // if (inputAlpha == 8) return false;

    // if (inputAlpha == 9) return false; // Checks for low alpha levels, and returns that this face should not be lit. Used for transparent emissiveness
    // if (inputAlpha == 10) return false;
    // if (inputAlpha == 11) return false;
    // if (inputAlpha == 12) return false;
    // if (inputAlpha == 13) return false;
    // if (inputAlpha == 14) return false;
    // if (inputAlpha == 15) return false;
    // if (inputAlpha == 16) return false;

    return true; // A face should be lit by default
}


// Makes sure transparent things don't become solid and vice versa.

float remap_alpha(float inputAlpha) {
    
    if (inputAlpha == 254) return 255.0; // Checks for alpha 252 and converts all pixels of that to alpha 255. Used for emissiveness
    if (inputAlpha == 253) return 255.0; // Checks for alpha 252 and converts all pixels of that to alpha 255. Used for Shade false, non-emissive
    
    
    // if (inputAlpha == 1) return 16.0; // Checks for low alpha levels and converts all pixels of that to the respective transparency value. Used for transparent Shade false, non-emissive
    // if (inputAlpha == 2) return 48.0;
    // if (inputAlpha == 3) return 80.0;
    // if (inputAlpha == 4) return 112.0;
    // if (inputAlpha == 5) return 144.0;
    // if (inputAlpha == 6) return 176.0;
    // if (inputAlpha == 7) return 208.0;
    // if (inputAlpha == 8) return 240.0;    

    // if (inputAlpha == 9) return 16.0; // Checks for low alpha levels and converts all pixels of that to the respective transparency value. Used for transparent emissiveness
    // if (inputAlpha == 10) return 48.0;
    // if (inputAlpha == 11) return 80.0;
    // if (inputAlpha == 12) return 112.0;
    // if (inputAlpha == 13) return 144.0;
    // if (inputAlpha == 14) return 176.0;
    // if (inputAlpha == 15) return 208.0;
    // if (inputAlpha == 16) return 240.0;
    
    return inputAlpha; // If a pixel doesn't need to have its alpha changed then it simply does not change.
}


// The meat and bones of the pack, does all the work for making things emissive.

vec4 make_emissive(vec4 inputColor, vec4 lightColor, vec4 faceLightColor, int inputAlpha) {

    if(face_lighting_check(inputAlpha)) inputColor *= faceLightColor; // Applies the face lighting if the face should be lit
    inputColor.a = remap_alpha(inputAlpha) / 255.0; // Remap the alpha value

    if (inputAlpha == 254) return inputColor; // Checks for alpha 254 and just returns the input color if it is. Used for emissiveness

    // if (inputAlpha == 9) return inputColor; // Checks for low alpha and just returns the input color if it is. Used for transparent emissiveness
    // if (inputAlpha == 10) return inputColor;
    // if (inputAlpha == 11) return inputColor;
    // if (inputAlpha == 12) return inputColor;
    // if (inputAlpha == 13) return inputColor;
    // if (inputAlpha == 14) return inputColor;
    // if (inputAlpha == 15) return inputColor;
    // if (inputAlpha == 16) return inputColor;

    // if (inputAlpha == 251) return apply_partial_emissivity(inputColor, lightColor, vec3(0.411, 0.345, 0.388)); // Possibility for partial emissiveness
    
    return inputColor * lightColor; // If none of the pixels are supposed to be emissive, then it adds the light.
}