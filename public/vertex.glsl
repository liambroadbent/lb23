uniform vec2 uFrequency;
uniform float uTime;

varying vec2 vUv; 
varying float vElevation;



// float lorem(float g, float f)
// {   
//     return g + f;
// }

void main()
{

// // vec2 foo = vec2(1.0,2.0);
// float fooBar = 0.12;
// float jeff = 1.0;
// float c = fooBar + jeff; 

// // int foo = 123; 
// int bar = 321; 
// // int foober = foo + bar; 

// float cTester = fooBar * float(bar);

// vec2 jim = vec2(1.0, 2.0);
// jim.x = 3.0;
// jim.y = jim.x + 2.0;

// jim *= 2.0;

// vec3 Terry = vec3(0.0);
// vec3 lkadj = vec3(0.0, 0.0, 0.0);
// vec3 red = vec3(0.0);
// red.r = 0.5;
// red.g = 0.5;
// red.b = 0.5;
// vec3 colorz = vec3(jim, 1.0);
// vec2 cal = jim.rg;

// vec4 lasd = vec4(0.0);
// float jaskjd = lasd.a;

// float result = lorem(1.0, 2.0);

    vec4 modelPostition = modelMatrix * vec4(position, 1.0);

    float elevation = sin(modelPostition.x * uFrequency.x - uTime) * 0.05;
    elevation += sin(modelPostition.y * uFrequency.y - uTime) * 0.05;

    modelPostition.z += elevation;
    // modelPostition.y += sin(modelPostition.y * uFrequency.y) * 0.15 * sin(modelPostition.y - uTime);
    // modelPostition.z += aRandom * 0.1;

    vec4 viewPosition = viewMatrix * modelPostition;
    // viewPosition.x += sin(uv.y * 1.0);
    vec4 projectedPosition = projectionMatrix * viewPosition;  

    gl_Position = projectedPosition;
    
    vUv = uv;
    vElevation = elevation;
    // vRandom = aRandom;
}