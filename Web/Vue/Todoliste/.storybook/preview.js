export const parameters = {
  actions: { argTypesRegex: "^on[A-Z].*" },
  controls: {
    matchers: {
      color: /(background|color)$/i,
      date: /Date$/,
    },
  },
  backgrounds: {
    default: 'facebook',
    values: [
      {
        name: 'facebook',
        value: '#3b5998',
      },
      {
        name: 'navbar',
        value: '#1a1a1a'
      },
      {
        name: 'background',
        value: '#303030'
      }
    ],
  },
}