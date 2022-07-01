import SearchField from './SearchField.vue'
export default {
    title: 'SearchField',
    component: SearchField
}

export const Idle = () => ({
    components: { SearchField },
    template: '<SearchField />'
})