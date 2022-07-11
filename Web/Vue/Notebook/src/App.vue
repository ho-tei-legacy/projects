<script setup>
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons';
import NoteTypeButton from './components/NoteTypeButton/NoteTypeButton.vue';
import BurgerMenuButton from './components/BurgerMenuButton/BurgerMenuButton.vue';
import NotizListItem from './components/NotizListItem/NotizListItem.vue';
import SearchField from './components/SearchField/SearchField.vue';
import AddNoteButton from './components/AddNoteButton/AddNoteButton.vue';
library.add(faMagnifyingGlass)

const NoteTypes = {
  [0]: {
    id: 0,
    displayName: "Personal",
    selected: true
  },
  [1]: {
    id: 1,
    displayName: "Work",
    selected: false,
  },
  [2]: {
    id: 2,
    displayName: "Misc.",
    selected: false,
  }
}

const selectedNoteType = 0
const selectedList = "Test"

function selectNoteType(id) {
  console.log(id)
}

</script>


<template>
  <header>
   
  </header>
  <div class="sidebar">
    <div class="burgermenu">
      <BurgerMenuButton isSelected=true />
    </div>

    <NoteTypeButton v-for="notes in NoteTypes" @click="selectNoteType(notes.id)" id="{{notes.id}}" displayName="{{`${notes.displayName}`}}" isSelected={{notes.selected}} />
    <!--<NoteTypeButton @click="selectNoteType(1)" id="1" displayName="Work" isSelected="false" />-->
    <!--<NoteTypeButton @click="selectNoteType(2)" id="2" displayName="Misc." isSelected="false" />-->
  </div>

  <div class="searchbar">
    <SearchField />

    <div class="NoteEntries">
      <NotizListItem title="Test" content="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, " isSelected=false />
      <NotizListItem title="testo" content="lorem ipsum another testo" isSelected="false" />  
    </div>


  </div>

  <div class="richTextDiv">
    <div class="richtext">
      <p class="placeholderRichText">RichText Coming soonTM</p>
    </div>
  </div>

  <div class="editorDiv">
    <textarea class="editor" >aa</textarea>
  </div>
</template>


<style>

* {
  font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
  margin: 0;
  padding: 0;
}

.sidebar {
  display: flex;
  float: left;
  flex-direction: column;
  background-color: #1f1f1f;
  width: 15vw;
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
  width: 100vw;
  height: 8vh;
}

.placeholderRichText {
 font-size: 30px;
}

.richTextDiv {
  display: flex;
}

.editor {
  color: #1f1f1f;
  height: 86.23vh;
  width: 64.3vw;
  padding-top: 50px;
  padding-left: 50px;
  font-size: 16px;
  resize: none;
}

</style>
