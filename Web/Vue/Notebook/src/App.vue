<script setup>
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons';
import NoteTypeButton from './components/NoteTypeButton/NoteTypeButton.vue';
import BurgerMenuButton from './components/BurgerMenuButton/BurgerMenuButton.vue';
import NotizListItem from './components/NotizListItem/NotizListItem.vue';
import SearchField from './components/SearchField/SearchField.vue';
import SearchField1 from './components/SearchField/SearchField.vue';
import NotizListItem1 from './components/NotizListItem/NotizListItem.vue';
library.add(faMagnifyingGlass)

</script>


<template>
  <header>
   
  </header>
  <div class="sidebar">
    <div class="burgermenu">
      <BurgerMenuButton isSelected=true />
    </div>

    <NoteTypeButton id="0" displayName="Personal" isSelected="false" />
    <NoteTypeButton id="1" displayName="Work" isSelected="false" />
    <NoteTypeButton id="2" displayName="Misc." isSelected="false" />
  </div>

  <div class="searchbar">
    <SearchField />

    <div class="NoteEntries">
      <NotizListItem title="Test" content="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, " isSelected=false />
      <NotizListItem title="testo" content="lorem ipsum another testo" isSelected="false" />  
    </div>
  </div>

  <div class="editorDiv">
    <div class="richtext">
      <p class="placeholderRichText">RichText Coming soonTM</p>
    </div>

    <div class="editor">
      <input class="inputEditor" type="text" />
    </div>
  </div>
</template>


<style>

* {
  margin: 0;
  padding: 0;
}

.sidebar {
  display: flex;
  float: left;
  flex-direction: column;
  background-color: #1f1f1f;
  width: 35vh;
  height: 100vh;
}

.burgermenu {
  margin-bottom: 20px;
}

.notetypes {
  display: flex;
}

.searchbar {
  display: flex;
  float: left;
  flex-direction: column;
  padding-top: 20px;
  margin-left: 20px;

  border-right: solid;
  border-right-color: #1f1f1f;
  height: 98vh;
}

.NoteEntries {
  margin-top: 20px;
  margin-left: -20px
}

.richtext {
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  float:left;
  border-bottom-style: solid;
  border-bottom-color: #1f1f1f;
  width: 107vh;
  height: 8vh;
}

.placeholderRichText {
 font-size: 30px;
}

.editorDiv {
  display: flex;
}
</style>
