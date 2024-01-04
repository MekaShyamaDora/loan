<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
        }

        button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        #result {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <h2>Loan Calculator</h2>

    <label for="loanAmount">Loan Amount:</label>
    <input type="number" id="loanAmount" placeholder="Enter loan amount" required>

    <label for="interestRate">Annual Interest Rate (%):</label>
    <input type="number" id="interestRate" placeholder="Enter annual interest rate" required>

    <label for="loanTerm">Loan Term (years):</label>
    <input type="number" id="loanTerm" placeholder="Enter loan term in years" required>

    <button onclick="calculateLoan()">Calculate</button>

    <div id="result"></div>

    <script>
        function calculateLoan() {
            var loanAmount = parseFloat(document.getElementById('loanAmount').value);
            var interestRate = parseFloat(document.getElementById('interestRate').value);
            var loanTerm = parseFloat(document.getElementById('loanTerm').value);

            var monthlyInterest = (interestRate / 100) / 12;
            var numberOfPayments = loanTerm * 12;

            var monthlyPayment = (loanAmount * monthlyInterest) / (1 - Math.pow(1 + monthlyInterest, -numberOfPayments));
            var totalPayment = monthlyPayment * numberOfPayments;
            
            var result = `
                Monthly Payment: $${monthlyPayment.toFixed(2)}<br>
                Total Payment: $${totalPayment.toFixed(2)}
            `;

            document.getElementById('result').innerHTML = result;
        }
    </script>

</body>
</html>
