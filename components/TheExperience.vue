<script setup lang="ts">
import { Scene, PerspectiveCamera, Mesh, SphereGeometry, MeshBasicMaterial, WebGLRenderer, Color, Fog, Clock, DirectionalLight} from 'three';
import { Ref } from 'vue';
import { useWindowSize } from '@vueuse/core';

let renderer: WebGLRenderer;
const experiance: Ref<HTMLCanvasElement | null> = ref(null)

const bgColor = new Color('#e1f0c2');

/* 
  Scene 
*/
const scene = new Scene();

scene.fog = new Fog(bgColor, 0.1, 75)
scene.background = bgColor

const { width, height } = useWindowSize();
const aspectRatio = computed(() => width.value / height.value);

const camera = new PerspectiveCamera(75, aspectRatio.value, 0.1, 1000);
// const camera = new PerspectiveCamera(75, 800 / 600, 0.1, 1000);
camera.position.set(0, 0, 2.5)

scene.add(camera)

const sphere = new Mesh(
    new SphereGeometry(1, 32, 32),
    new MeshBasicMaterial({ color: 0xff0000 })
);

scene.add(sphere)

// light
const directionalLight = new DirectionalLight("#000000", 10);
directionalLight.castShadow = true;
directionalLight.shadow.camera.far = 1000;
directionalLight.shadow.mapSize.set(1024, 1024);
directionalLight.shadow.normalBias = 0.15;
directionalLight.position.set(0.25, 1, 1.25);

scene.add(directionalLight);

// updating / rendering

function updateCamera() {
    camera.aspect = aspectRatio.value
    camera.updateProjectionMatrix()
}

function updateRenderer() {
    renderer.setSize(width.value, height.value);
    renderer.render(scene, camera);
}

function setRenderer() {

    if (experiance.value) {
        renderer = new WebGLRenderer({
            canvas: experiance.value,
            alpha: true,
        });
        updateRenderer()
    }
}

watch(aspectRatio, () => {
    updateCamera()
    updateRenderer()
})

onMounted(() => {
    setRenderer();
    loop()
    const clock = new Clock();
    clock.start();
})

const clock = new Clock();
clock.start();

const loop = () => {
    const radius = 5
    ; // The radius of the circle
    const frequency = .5; // The 

    // Set the starting position of the sphere
    const startPos = { x: sphere.position.x, y: sphere.position.y };
    const elapsedTime = clock.getElapsedTime();
    const angle = frequency * elapsedTime; // The current angle of the object
    const newPos = {
        x: startPos.x + radius * Math.cos(angle),
        y: startPos.y + radius * Math.sin(angle)
    };
    sphere.position.x = newPos.x * 0.1;
    sphere.position.y = newPos.y * 0.1;

    renderer.render(scene, camera);
    requestAnimationFrame(loop);
}

</script>

<template>
    <div>
        <canvas ref="experiance" />
    </div>
</template>

<style>
canvas {
    position: fixed;
    top: 0;
    right: 0;
    z-index: -1;
}
</style>