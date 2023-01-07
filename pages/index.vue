<script setup lang="ts">

</script>

<template>
    <div class="page">
        <h1>Liam Broadbent?</h1>
        <a href="https://www.linkedin.com/in/liambroadbent/">Get in touch</a>
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
    align-items: center;
    justify-content: center;
    color: white;
}

.page{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
h1 {
    font-family: Monsterrat, 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-weight: 900;
    font-size: clamp(1.5rem, 3.5vw, 7rem);
    text-transform: uppercase;
}

a {
    font-family: Poppins, 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-weight: 500;
    font-size: clamp(1.5rem, 2.5vw, 5rem);
    margin-top: clamp(1.5rem, 1vh, 7rem);
    color:white;

}
</style>
  
  
  