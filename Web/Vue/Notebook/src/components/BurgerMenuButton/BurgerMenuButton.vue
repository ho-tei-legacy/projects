<script setup>
const props = defineProps({
    isSelected: {
        type: String,
        required: true
    }
})
</script>


<template>
    <!--TODO Rework BurgerMenuButton to have a working idle & isSelected, and not for both to be the same-->
    <button class="BurgerMenuButton barsIcon">
        <font-awesome-icon icon="fa-solid fa-bars" />
    </button>
</template>


<style>

.BurgerMenuButton {
    width: 75px;
    height: 75px;
    background-color: #272626;
    border: none;
    border-bottom-right-radius: 20px;

    transition: 0.3s;
}

.BurgerMenuButton:hover {
    background-color: #454343;
}

.fa-bars {
    color: white;
    height: 25px;
}

</style>