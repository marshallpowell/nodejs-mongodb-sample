# NodeJS-MongoDB-Sample
A simple NodeJS web application which communicates with MongoDB. Useful for testing Red Hat OpenShift Dev Spaces workspace.

This example was adapted from https://github.com/GoogleCloudPlatform/cloud-code-samples/tree/master/nodejs/nodejs-guestbook

# MongoDB
The application connects to the Mongo data base, so it should be configured with next parameters:
- MongoDB user - <b>user</b>
- MongoDB password - <b>password</b>
- The name of data base - <b>guestbook</b>

#  Run the application
- Launch a workspace from the devfile.yaml file in this repo.
- Open the Tasks menu in VS Code.
- Click 'devfile:run' to run the application. The same command is documented in the devfile.yaml in this repo.
