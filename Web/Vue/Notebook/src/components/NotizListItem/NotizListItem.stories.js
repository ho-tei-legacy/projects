import NotizListItem from './NotizListItem.vue'

export default {
    title: 'NotizListItem',
    component: NotizListItem
}

export const Idle = () => ({
    components: { NotizListItem },
    template: '<NotizListItem title="Test" content="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, " isSelected=false />'
})

export const isSelected = () => ({
    components: { NotizListItem },
    template: '<NotizListItem title="Test" content="Lorem ipsum dolor sit amet, consetetur sadipscing elitr, " isSelected=true />'
})