import NavBarEntry from './NavBarEntry.vue'

export default {
    title: 'NavBarEntry',
    component: NavBarEntry
}

export const Idle = () => ({
    components: { NavBarEntry },
    template: '<NavBarEntry isSelected=false displayName="Todo List 1" />'
})

export const isSelected = () => ({
    components: { NavBarEntry },
    template: '<NavBarEntry isSelected=true displayName="Todo List 1" />'
})