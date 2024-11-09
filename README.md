## Table of Contents

1. [Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Installation](#installation)
2. [Solution and Analysis](#solution-and-analysis)
   1. [Frontend + Backend + Self-hosted LLM](#1-frontend--backend--self-hosted-llm)
   2. [Frontend + Backend + LLM API](#2-frontend--backend--llm-api)
   3. [Frontend + LLM API](#3-frontend--llm-api)
3. [Tech Stack Decisions](#tech-stack-decisions)

---
## Getting Started

### Prerequisites

- Requires the docker-compose tool from Docker to run the services.
- Get a Gemini API key in [Google AI Studio](https://aistudio.google.com/apikey).

### Installation

Simply runs the following script under the projects directory.

```bash
GEMINI_API_KEY=${{YOUR_OWN_KEY}} \
docker-compose up --build --detach
```

---

## Solution and Analysis

> Based on the assessment, I identified the following stack options. 
> Given the time restrictions, difficulty, familiarity, and ease of deployment, 
> it's challenging to balance these factors to select the most practical solution and tools.

### 1. **Frontend + Backend + Self-hosted LLM**

**Pros:**
- **Scalability:** Full control over infrastructure allows for high scalability.
- **Future Flexibility:** Potential for customized training and fine-tuning as needs evolve.

**Cons:**
- **Complex Deployment:** Managing a backend server and self-hosted LLM requires significant resources.
- **High Setup Effort:** Extensive configuration is needed to set up and optimize the LLM.
- **Wide Range of Options:** Choosing the right LLM may require trial and error.

### 2. **Frontend + Backend + LLM API**

**Pros:**
- **Ease of Use:** LLM APIs simplify model access without complex setup.
- **Simpler Deployment:** Using an API removes the need to manage LLM hosting.

**Cons:**
- **Deployment Challenges:** Deploying both a web app and backend server may require extra coordination.

### 3. **Frontend + LLM API**

**Pros:**
- **Quick Development:** Streamlined setup focusing on frontend-only development.
- **Easy Deployment:** Requires deploying only the frontend, which simplifies the process.

**Cons:**
- **Limited Scalability:** Harder to expand to support additional platforms without a backend.
- **API Key Exposure Risk:** Using an API key in frontend code could be a security risk.

---

## Tech Stack Decisions

> #### Flutter + NestJS + Gemini API

Given that this assessment is for a Full Stack Engineer role, 
I believe showcasing backend development skills is essential for success. 
I chose frameworks and tools that I am highly familiar with, allowing me to 
complete the assessment to a high standard that I can confidently present.
After evaluating various LLM APIs, I selected the Gemini API for its robust 
content generation capabilities and free usage tier, which supports efficient 
testing and deployment.

---

