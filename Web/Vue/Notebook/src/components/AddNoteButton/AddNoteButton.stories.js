import AddNoteButton from './AddNoteButton.vue'

export default {
    title: 'AddNoteButton',
    component: AddNoteButton
}

export const Idle = () => ({
    components: { AddNoteButton },
    template: '<AddNoteButton />'
})