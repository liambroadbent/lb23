// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    app: {
        head: {      
            charset: 'utf-16',
            viewport: 'width=500, initial-scale=1',
            title: 'Creator, Visionary, Dreamweaver',
 // <meta name="description" content="My amazing site"> 
            meta: [{
                name: 'description', 
                content: ' Liam has a proven track record of delivering high-quality work that exceeds client expectations.'
            }],
            link: [{ rel: 'icon', type: 'image/png', href: 'favicon.ico' }]
        },
    },
    modules: [
        ['@nuxtjs/google-fonts', { 
            googleFonts: {
                families: { 
                  Montserrat: [500, 900],
                  Poppins: [500, 900],
                },
                subsets: ['latin'],
                display: 'swap',
                prefetch: true,
                preconnect: true,
                preload: true,
                download: true,
                base64: true,
              },
         }]
    ],
    
      

})