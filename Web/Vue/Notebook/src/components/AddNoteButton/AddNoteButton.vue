<script setup>
</script>


<template>
    <button class="AddNoteButton">+</button>
</template>

<style>

.AddNoteButton {
    transition: 0.3s;
    height: 50px;
    width: 50px;
    color: white;
    background-color: #272626;
    font-size: 39px;
    border-width: 0px;
    border-radius: 25px;
}

.AddNoteButton:hover {
    cursor: pointer;
    background-color: #454343;
}

.AddNoteButton:active {
    cursor:default;
    transform: scale(0.98);
}

</style>