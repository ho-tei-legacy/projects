<script setup>
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons';
import NoteTypeButton from './components/NoteTypeButton/NoteTypeButton.vue';
import BurgerMenuButton from './components/BurgerMenuButton/BurgerMenuButton.vue';
import NotizListItem from './components/NotizListItem/NotizListItem.vue';
import SearchField from './components/SearchField/SearchField.vue';
library.add(faMagnifyingGlass)

</script>


<template>
  <header>
   
  </header>
  <div class="all">
  <div class="noteTypesTab">
    
    <div class="burgerButtonDiv">
      <BurgerMenuButton></BurgerMenuButton>
    </div>

    <div class="noteTypes">
      <NoteTypeButton id=0 displayName="Test NoteTypeButton" isSelected=false></NoteTypeButton>
      <NoteTypeButton id=1 displayName="Another test button" isSelected=false></NoteTypeButton>
    </div>

  </div>
  </div>
  <div class="noteLists">
    <div class="searchBar">
      <SearchField></SearchField>
    </div>
    <NotizListItem title="Test" content="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna" isSelected=false></NotizListItem>
    <NotizListItem title="Lorem Ipsum" content="insert lorem ipsum text here but without the actual lorem ipsum" isSelected=false></NotizListItem>
  </div>
</template>


<style>

* {
  margin: 0px;
  padding: 0px;
}

.all {
  display: flex;
  position: absolute;
}

.burgerButtonDiv {
  margin-bottom: 40px ;
}

.noteTypesTab {
  background-color: #1f1e1e;
  
  width: 250px;
  height: 100vh;
  overflow:hidden;
}

.noteLists {
  position: relative;
  margin-left: 250px;
  width: 340px;
  height: 100vh;

  border-right-style: solid;
}

.searchBar {
  padding-top: 10px;
  padding-bottom: 20px;
  padding-left: 20px;
}

</style>
