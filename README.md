# AWS Amplify Notes App

A full-stack Notes Application built using **React** and **AWS Amplify**. This project demonstrates cloud-native application development with authentication, backend deployment, data storage, and continuous deployment using AWS services.

## Features

* User Authentication
* Create Notes
* View Notes
* Delete Notes
* Cloud Backend with AWS Amplify
* GraphQL API with AWS AppSync
* Automatic Deployment with AWS Amplify Hosting
* GitHub Integration for CI/CD

## Tech Stack

### Frontend

* React
* Vite
* JavaScript

### AWS Services

* AWS Amplify
* AWS AppSync
* AWS IAM
* AWS CloudFormation

### Version Control

* Git
* GitHub

## Project Structure

```bash
notesapp/
├── amplify/
├── src/
├── public/
├── amplify_outputs.json
├── package.json
└── vite.config.js
```

## Installation

Clone the repository:

```bash
git clone https://github.com/dhushyandh/notesapp.git
cd notesapp
```

Install dependencies:

```bash
npm install
```

Run the application:

```bash
npm run dev
```

## Amplify Setup

Configure Amplify credentials:

```bash
npx ampx configure profile
```

Deploy the backend sandbox:

```bash
npx ampx sandbox
```

This command creates the required AWS backend resources and generates:

```bash
amplify_outputs.json
```

## Build for Production

```bash
npm run build
```

## Deployment

The application is deployed using AWS Amplify Hosting.

Every push to the GitHub repository automatically triggers:

* Build
* Test
* Deployment

through Amplify CI/CD.

## Learning Outcomes

Through this project, I learned:

* AWS Amplify Fundamentals
* IAM Users and Access Keys
* Cloud Backend Deployment
* GraphQL APIs with AppSync
* CI/CD using Amplify Hosting
* GitHub Integration with AWS
* Cloud Resource Management

## Author

Dhushyandh

Computer Science Engineering Student | Full Stack Developer | Cloud Enthusiast
