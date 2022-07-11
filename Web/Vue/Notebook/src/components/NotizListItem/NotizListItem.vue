<script setup>
const props = defineProps({
    title: {
        type: String,
        required: true
    },
    content: {
        type: String,
        required: true
    },
    isSelected: {
        type: String,
        required: true
    }
})
</script>


<template>
    <div v-if="isSelected=='false'" class="NotizListItemDiv">
        <p id="ListItem">{{ title }}</p>
        <p id="ListContent">{{ content }}</p>
    </div>
    
    <div v-else class="NotizListItemDivSelected">
        <p id="ListItem">{{ title }}</p>
        <p id="ListContent">{{ content }}</p>
    </div>
</template>

<style>

.NotizListItemDiv {
    font-family: 'Times New Roman', Times, serif;
    height: 100px;
    color: #1f1f1f;
    background-color: white;
    transition: 0.3s;
    width: 340px;
}

.NotizListItemDiv #ListItem {
    font-weight: bold;
    padding-left: 20px;
    padding-top: 10px;
    font-size: 25px;
}

.NotizListItemDiv #ListContent {
    background-image: linear-gradient(90deg, #b5b5b5 0%, rgb(255,255,255));
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    position: relative;
    display:inline-block;
    margin-top: -5px;
    padding-left: 20px;

}

.NotizListItemDiv:hover {
    cursor: pointer;
    background-color: #1f1f1f;
}

.NotizListItemDiv:hover > #ListItem {
    transition: 0.2s;
    color: white;
}

.NotizListItemDiv:hover > #ListContent {
    background-image: linear-gradient(90deg, #b5b5b5 70%, rgb(69,67,67));
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    position: relative;
    display:inline-block;
}



.NotizListItemDivSelected {
    height: 100px;
    color: white;
    background-color: #1f1f1f;
    transition: 0.3s;
}

.NotizListItemDivSelected #ListItem {
    font-weight: bold;
    padding-left: 20px;
    padding-top: 10px;
    font-size: 25px;
}

.NotizListItemDivSelected #ListContent {
    background-image: linear-gradient(90deg, #b5b5b5 70%, rgb(69,67,67));
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    position: relative;
    display:inline-block;
    margin-top: -5px;
    padding-left: 20px;
    color: #b5b5b5;
}

.NotizListItemDivSelected:hover {
    cursor: pointer;
    background-color: #454343;
}

.NotizListItemDivSelected:hover > #ListContent {
    transition: 0s;
    background-image: linear-gradient(90deg, #b5b5b5 70%, rgb(69,67,67));
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    position: relative;
    display:inline-block;
}

</style>