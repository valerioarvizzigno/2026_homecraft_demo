# New 2026 Homecraft demo

*** UPDATED TO USE GEMINI 2.5, run on serverless and deployable via Docker ***

### Deploy locally

    Install requirements:
    ```
    pip install --no-cache-dir -r requirements.txt
    ```

    Run it:
    ```
    streamlit run home.py
    ```
### Deploy via docker in your machine

    ```
    docker build -t 2026-homecraft-demo .

    docker run -p 8080:8080 2026-homecraft-demo
    ```
### Deploy via docker on Cloud Run

    ```
    gcloud auth login
    gcloud config set project YOUR_GOOGLE_CLOUD_PROJECT_ID

    gcloud run deploy 2026-homecraft-demo \
    --source . \
    --region europe-west1 \
    --allow-unauthenticated \
    --port 8080
    ```

    Set env variables:
     ```
    gcloud run services update 2026-homecraft-demo \
    --region europe-west1 \
    --update-env-vars gcp_project_id="your_gcp_project", elastic_project_id="your_project_id", elastic_apikey="your_apikey"
   ```


    
