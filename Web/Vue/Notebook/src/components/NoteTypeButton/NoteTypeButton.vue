<script setup>
const props = defineProps({
    id: {
        type: Number,
        required: true
    },
    displayName: {
        type: String,
        required: true
    },
    isSelected: {
        type: Boolean,
        required: true
    }
})
</script>


<template>
    <button class="NoteTypeButton">
        <span v-if="props.isSelected === true" class="selectedSpan">{{displayName}}</span>
        <span v-else class="NoteTypeSpan">{{ displayName }}</span>
    </button>
</template>


<style>

.selectedSpan {
    border-left-style: solid;
    border-color: #ffffff;
    border-width: 1px;
    padding-left: 10px;
}

.NoteTypeSpan {
    border-left-style: none;
    border-color: #ffffff;
    border-width: 0px;
    padding-left: 0px;
    transition: 0.3s;
}

.NoteTypeButton {
    display: flex;
    flex-direction: column;
    height: 40px;
    width:auto;
    margin-top: 5px;
    padding-left: 20px;
    margin-bottom: 10px;
    background-color: transparent;
    background: #1f1f1f;

    color: #ffffff;
    font-size: 18px;
    text-align: left   ;
    justify-content: center;

    border-style: none;

    transition: all 0.3s ease-in-out;
}

.NoteTypeButton:hover {
    background: #454343;
    cursor: pointer;
}

.NoteTypeButton:hover > .NoteTypeSpan {
    transition: 0.3s;
    border-left-style: solid;
    border-color: #ffffff;
    border-width: 1px;
    padding-left: 10px;

    
}

.NoteTypeButton:active {
    cursor: default;
    transition: 0.1s;
    font-size: 17.5px;
}

</style>