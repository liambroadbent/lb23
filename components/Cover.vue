<script setup lang="ts">

</script>

<template>
    <div id="cover">
        <h1>Liam Broadbent</h1>
        <a href="https://www.linkedin.com/in/liambroadbent/" id="style-2" data-replace="Get in touch"><span>Get in touch</span></a>
    </div>
</template>

<style>
#cover{
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    height:100vh;
}
h1 {
    font-family: Monsterrat, 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-weight: 900;
    font-size: clamp(2.5rem, 4.5vw, 7rem);
    text-transform: uppercase;
}

a {
  overflow: hidden;
  position: relative;
  display: inline-block;
}

a::before,
a::after {
 content: '';
  position: absolute;
  width: 100%;
  left: 0;
}
a::before {
  background-color: #e1f0c2;
  height: 2px;
  bottom: 0;
  transform-origin: 100% 50%;
  transform: scaleX(0);
  transition: transform .5s cubic-bezier(0.76, 0, 0.24, 1);
}
a::after {
  content: attr(data-replace);
  height: 100%;
  top: 0;
  transform-origin: 100% 50%;
  transform: translate3d(200%, 0, 0);
  transition: transform .5s cubic-bezier(0.76, 0, 0.24, 1);
  color: #e1f0c2;
}

a:hover::before {
  transform-origin: 0% 50%;
  transform: scaleX(1);
}
a:hover::after {
  transform: translate3d(0, 0, 0);
}

a span {
  display: inline-block;
  transition: transform .5s cubic-bezier(0.76, 0, 0.24, 1);
}

a:hover span {
  transform: translate3d(-200%, 0, 0);
}

a {
    font-family: Poppins, 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-weight: 500;
    font-size: clamp(1.5rem, 2.5vw, 5rem);
    margin-top: clamp(1.5rem, 1vh, 7rem);
    color:white;

}
</style>