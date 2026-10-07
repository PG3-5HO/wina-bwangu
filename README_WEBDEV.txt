WHAT TO DO ON YOUR END

1)Install Node.js
2)place all the files in one folder
3)Open your Vscode terminal, Run npm install
4)Open MySQL Workbench and setup the database.

CREATE DATABASE wina_bwangu;
USE wina_bwangu;
CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id VARCHAR(20) NOT NULL,
    booth VARCHAR(20) NOT NULL,
    location VARCHAR(50) NOT NULL,
    service VARCHAR(50) NOT NULL,
    revenue_per_kwacha DECIMAL(5,3) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    vat DECIMAL(10,2) NOT NULL,
    amount_after_tax DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

5)Run the code node server.js
6)Then Open this link on your browser: http://localhost:3000/Wina_App.html