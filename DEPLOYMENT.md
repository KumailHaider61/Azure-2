# Deployment steps (Azure App Service) - Simple guide

1) **Test locally**
   - Install dependencies: `npm install`
   - Build: `npm run build`
   - Start (production): `npm start`
   - If everything works locally, proceed.

2) **Push to GitHub**
   - Create a new repository on GitHub and push the project to the `main` branch.
   - Example commands:
     ```bash
     git init
     git add .
     git commit -m "Prepare Azure deployment"
     git branch -M main
     git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
     git push -u origin main
     ```

3) **Create App Service in Azure**
   - In Azure Portal: Create **App Service** (Linux) -> Runtime: **Node 18 LTS**.
   - In the App Service -> Overview -> Get Publish Profile -> Download the publish profile file.

4) **Add GitHub secrets**
   - In your GitHub repo settings -> Secrets -> Actions add a secret named `AZURE_WEBAPP_PUBLISH_PROFILE` and paste the contents of the publish profile file you downloaded.
   - Optionally set `AZURE_APP_NAME` as an environment variable in the workflow or as a repo secret if you prefer.

5) **Push to main**
   - After pushing, GitHub Actions will run the workflow `azure-webapps.yml` and deploy the app automatically.

6) **Application settings (if any)**
   - If your app needs environment variables (from `.env.example`), set them in Azure Portal -> Configuration -> Application settings.

Notes:
- This workflow uses the publish profile method for deployment. It's simple and quick.
- If your app uses serverless functions or special APIs, the setup may need extra steps.
