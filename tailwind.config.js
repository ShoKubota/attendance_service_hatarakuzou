module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.slim',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        'main-green': '#8AEAE2',
        'light-green': '#43D6DB',
        'accent-red': '#FF6B92',
        'light-red': '#FF86A6'
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
