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
    <button class="navBarEntry">
      <span v-if="$props.isSelected === 'true'" class="selectedSpan">{{displayName}}</span>
      <span v-else class="navBarEntrySpan">{{ displayName }}</span>
    </button>
</template>

<style>

.selectedSpan {
    transition: 0.3s;
    border-left-style: solid;
    border-left-width: 1px;
    border-color: #f9f9f9;
    padding-left: 8px;
}

.navBarEntrySpan {
    border-left-style: none;
    border-color: #ffffff;
    border-width: 0px;
    padding-left: 0px;
    transition: 0.3s;
}

.navBarEntry {
    height: 30px;
    width: 28.7vh;
    padding-left: 8px;
    background-color: transparent;
    border: none;

    color: #f9f9f9;
    text-align: left;
    font-size: 14px;

    transition: all 0.3s ease-in-out;
}


.navBarEntry:hover {
    background-color: #363636;
}

.navBarEntry:hover > .navBarEntrySpan {
    transition: 0.3s;
    border-left-style: solid;
    border-left-width: 1px;
    border-color: #f9f9f9;
    padding-left: 8px;
}

.navBarEntry:active {
    cursor: default;
    transition: 0.1s;
    font-size: 13px;
}

</style>