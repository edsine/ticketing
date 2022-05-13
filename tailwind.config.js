const {colors} = require('tailwindcss/defaultTheme')

module.exports = {
    purge: [
        './resources/js/**/*.vue',
        './resources/scss/**/*.scss',
        './resources/views/**/*.blade.php',
    ],
    theme: {
        colors,
        extend: {
            colors: {
                'pgl-blue': '#1e5268',
                'pgl-green': '#8dd34c',
            },
        }
    },
    variants: {},
    plugins: [
        require('@tailwindcss/ui'),
        require('@tailwindcss/custom-forms'),
    ],
    future: {
        purgeLayersByDefault: true,
        removeDeprecatedGapUtilities: true,
    },
}
