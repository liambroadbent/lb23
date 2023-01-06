<script setup lang="ts">
import { Scene, PerspectiveCamera, Mesh, SphereGeometry, MeshBasicMaterial, WebGLRenderer, Color, Fog, Clock } from 'three';
import { Ref } from 'vue';
import { useWindowSize } from '@vueuse/core';

let renderer: WebGLRenderer;
const experiance: Ref<HTMLCanvasElement | null> = ref(null)

const bgColor = new Color('#e1f0c2');
const scene = new Scene();

scene.fog = new Fog(bgColor, 0.1, 75)
scene.background = bgColor

const { width, height } = useWindowSize();
const aspectRatio = computed(() => width.value / height.value);

const camera = new PerspectiveCamera(75, aspectRatio.value, 0.1, 1000);
// const camera = new PerspectiveCamera(75, 800 / 600, 0.1, 1000);
camera.position.set(0, 0, 1.5)

scene.add(camera)

const sphere = new Mesh(
    new SphereGeometry(1, 32, 32),
    new MeshBasicMaterial({ color: 0xff0000 })
);

scene.add(sphere)

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
    const radius = 2; // The radius of the circle
    const frequency = 2; // The 

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
    position: absolute;
    top: 0;
    right: 0;
    z-index: -1;
}
</style>