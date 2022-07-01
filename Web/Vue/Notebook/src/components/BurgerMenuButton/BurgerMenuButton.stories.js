import BurgerMenuButton from './BurgerMenuButton.vue'

export default {
    title: 'BurgerMenuButton',
    component: BurgerMenuButton
}

export const Idle = () => ({
    components: { BurgerMenuButton },
    template: '<BurgerMenuButton isSelected=false />'
})

export const isSelected = () => ({
    components: { BurgerMenuButton },
    template: '<BurgerMenuButton isSelected=true />'
})