import TodoEntry from './TodoEntry.vue'

export default {
    title: 'TodoEntry',
    component: TodoEntry
}

export const Idle = () => ({
    components: { TodoEntry },
    template: '<TodoEntry id=0 isFinished=false content="Feed the cat" />'
})

export const isFinished = () => ({
    components: { TodoEntry },
    template: '<TodoEntry id=0 isFinished=true content="Feed the cat" />'
})