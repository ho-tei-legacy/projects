<script setup>
</script>


<template>
<!--TODO Implement magnifying glass/search icon into placeholder-->
    <div class="SearchFieldDiv">
        <input type="text" class="SearchField" placeholder="Search Notes"/>
        <!--<font-awesome-icon icon="fa-solid fa-magnifying-glass" />-->
    </div>
</template>

<style>

.SearchField {
    font-size: 17px;
    padding-left: 20px;
    color: #272626;
    height: 40px;
    width: 280px;
    border-style: none;
    border-bottom-style: solid;
    border-bottom-color: #1f1f1f;
}

.SearchField:focus {
    outline: none;
}

.SearchField::placeholder {
    content: '&#xf002';
    text-align: left;
    font-size: 17px;
}

</style>