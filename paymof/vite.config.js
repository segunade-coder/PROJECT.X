import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
// import { VitePWA } from "vite-plugin-pwa";
// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    react(),
    //   VitePWA({
    //     manifest: {
    //       name: "Paymof",
    //       short_name: "Paymof",
    //       description: "Finance Record Keeping Software",
    //       theme_color: "#ffffff",
    //       background_color: "#000000",
    //       display: "standalone",
    //       start_url: "/",
    //       orientation: "portrait",
    //       icons: [
    //         {
    //           src: "./icons/new_logo.png",
    //           sizes: "300x300",
    //           type: "image/png",
    //           purpose: "any maskable",
    //         },
    //       ],
    //     },
    //     workbox: {
    //       cleanupOutdatedCaches: true,
    //       skipWaiting: true,
    //       clientsClaim: true,
    //     },
    //   }),
  ],
  // build: {
  //   target: "modules",
  // },
  ssr: {
    noExternal: true,
  },
});
