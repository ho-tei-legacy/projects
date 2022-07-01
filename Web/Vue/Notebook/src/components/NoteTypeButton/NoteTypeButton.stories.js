import NoteTypeButton from './NoteTypeButton.vue'

export default {
    title: 'NoteTypeButton',
    component: NoteTypeButton
}

export const Idle = () => ({
    components: { NoteTypeButton },
    template: '<NoteTypeButton id=0 displayName="Vue" isSelected=false />'
})

export const isSelected = () => ({
    components: { NoteTypeButton },
    template: '<NoteTypeButton id=0 displayName="Vue" isSelected=true />'
})