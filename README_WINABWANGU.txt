WINA BWANGU - Web Application
==============================

REQUIREMENTS
- Node.js (https://nodejs.org)
- MySQL Server + MySQL Workbench

SETUP INSTRUCTIONS
1. Import the database:
   - Open MySQL Workbench
   - Go to Server → Data Import
   - Select the included .sql file
   - Click Start Import

2. Install dependencies:
   - Open the project folder in a terminal
   - Run: npm install

3. Configure the database password:
   - Open server.js
   - Find the password field and enter your MySQL root password

4. Start the server:
   - Run: node server.js
   - You should see "Connected to MySQL database" and "Server running at http://localhost:3000"

5. Open the app:
   - Open your browser and go to: http://localhost:3000/Wina_App.html