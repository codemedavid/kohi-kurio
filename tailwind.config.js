/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        kohi: {
          // Enhanced sophisticated palette with better contrast
          white: '#FFFFFF',
          light: '#F8F9FA',
          // Primary palette - enhanced for better visual appeal
          wall: '#f5f7fa',        // Lighter, more vibrant background
          sofa: '#8b7355',        // Warmer, richer greige
          wood: '#a67c52',        // Richer brown wood
          cream: '#e8d5b7',       // Warmer, more vibrant cream
          taupe: '#6d5a47',       // Deeper, more sophisticated taupe
          // Enhanced text colors
          dark: '#2d2d2d',        // Stronger dark for better contrast
          medium: '#5a5a5a',      // Better contrast medium gray
          // Vibrant accent colors
          coffee: '#8B4513',
          latte: '#D4AF37',       // Golden latte
          accent: '#d4af37',      // Golden accent
          warm: '#f4e4bc',        // Warm cream
          deep: '#4a3c2a'         // Deep brown for strong accents
        }
      },
      fontFamily: {
        'inter': ['Inter', 'system-ui', 'sans-serif'],
        'roboto': ['Roboto', 'sans-serif']
      },
      animation: {
        'fade-in': 'fadeIn 0.5s ease-in-out',
        'slide-up': 'slideUp 0.4s ease-out',
        'bounce-gentle': 'bounceGentle 0.6s ease-out',
        'scale-in': 'scaleIn 0.3s ease-out'
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' }
        },
        slideUp: {
          '0%': { transform: 'translateY(20px)', opacity: '0' },
          '100%': { transform: 'translateY(0)', opacity: '1' }
        },
        bounceGentle: {
          '0%, 20%, 50%, 80%, 100%': { transform: 'translateY(0)' },
          '40%': { transform: 'translateY(-4px)' },
          '60%': { transform: 'translateY(-2px)' }
        },
        scaleIn: {
          '0%': { transform: 'scale(0.95)', opacity: '0' },
          '100%': { transform: 'scale(1)', opacity: '1' }
        }
      }
    },
  },
  plugins: [],
};