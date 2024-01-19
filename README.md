# Currency Converter App

This is a simple Swift app that allows users to convert currency values between Euros (€), US Dollars ($), and British 
Pounds (£). The app uses the European Central Bank's online exchange rates to provide up-to-date conversion rates.

## Getting Started

### Prerequisites

Make sure you have Xcode installed on your macOS device.

### Installation

Clone the repository to your local machine.
Build and run the app using the Xcode simulator or a connected iOS device.

## Overview
The app consists of the following components:

### Main
CurrencyConverterApp: The main entry point of the app, setting up the initial scene with the ContentView.

### Model
CurrencyConverterModel: The data model containing currency conversion rates and values.

### View
ContentView: The main user interface of the app, displaying input fields for Euro amounts and showing converted values in USD and GBP.

### ViewModel
CurrencyConverterViewModel: The view model that manages the interaction between the view and the model. It also handles formatting and downloading exchange rates from the European Central Bank.

## Usage
Launch the app.
Enter an amount in Euros in the designated text field.
The equivalent amounts in US Dollars and British Pounds will be automatically calculated and displayed.

### Additional Features
Press the "Load current Exchange Rates" button to fetch the latest exchange rates from the European Central Bank.

### Notes
The source of online exchange rates is the European Central Bank.
Exchange rates are downloaded from https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml.




