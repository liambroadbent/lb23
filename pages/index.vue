<script setup lang="ts">

</script>

<template>
    <div class="page">
        <Cover />
        <Intro />
        <ClientOnly>
            <TheExperience />
        </ClientOnly>
    </div>
</template>
  

  
<style>
body {
    height: 100vh;
    width: 100vw;
    display: flex;
    align-items: flex-start;
    justify-content: center;
    color: white;
    overflow-x: hidden;
}

.page{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
</style>
  
  
  