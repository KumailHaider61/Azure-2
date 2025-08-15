Quick Azure notes:
- package.json contains `build` and `start` scripts already:
    "build": "next build"
    "start": "next start"
- If Azure assigns a port via environment variable, Next.js `next start` will use it automatically.
- If you have any server-side APIs or a database, configure them in Azure App Service Configuration.
