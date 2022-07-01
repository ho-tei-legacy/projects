
<script setup>
import NavBarEntry from './components/NavBarEntry/NavBarEntry.vue';
/* ANIMATION FOR NAVBAR:
change width of navbar (transition ~0.4s)
text transparancy 1 -> 0 (transition ~0.7s)
text color: teal blue
*/
</script>

<template>
  <div class="navbar">
    <NavBarEntry id=0 isSelected=false displayName="Todo List 1"/>
    <NavBarEntry id=1 isSelected=false displayName="Todo List 2"/>
  </div>
</template>

<style>

body {
  background-color: #262626
}

.navbar {
  display: flex;
  flex-direction: column;
  height: 98vh;
  min-width: 28.7vh;
  max-width: 28.7vh;
  background-color: #1a1a1a;
}
</style>
