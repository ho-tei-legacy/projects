<script setup>
    defineProps({
        id: {
            type: Number,
            required: true
        },
        isSelected: {
            type: String,
            required: true
        },
        displayName: {
            type: String,
            required: true
        }
    })
</script>

<template>
    <button id="navBarEntry">
      <span>{{ displayName }}</span>
    </button>
</template>

<style>

#navBarEntry {
    height: 30px;
    width: 28.7vh;
    padding-left: 8px;
    background-color: transparent;
    border: none;

    color: #f9f9f9;
    text-align: left;
    font-size: 14px;

    transition: 0.3s;
}


#navBarEntry:hover {
    background-color: #363636;
}

#navBarEntry:hover > span {
    transition: 0.3s;
    border-left-style: solid;
    border-left-width: 1px;
    border-color: #f9f9f9;
    padding-left: 8px;
}

#navBarEntry:active {
    transition: 1.5s;
    font-size: 13px;
}

#navBarEntrySelected span {
    padding-left: 8px;
    border-left-style: solid;
    border-left-width: 1px;
    border-color: #f9f9f9;
}

</style>