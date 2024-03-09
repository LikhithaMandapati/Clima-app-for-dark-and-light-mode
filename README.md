# Clima

## Overview

This Xcode project is designed to fetch and display weather data using the OpenWeatherMap API. To ensure the app functions correctly, you must use a valid API key from OpenWeatherMap.

## Setting Up Your API Key

To get your API key, follow these steps:

1. Visit [OpenWeatherMap](https://openweathermap.org/) and create a free account if you don't already have one.
2. Once you're logged in, navigate to the 'API keys' section of your account dashboard.
3. Click on the 'Create Key' button and give your key a name.
4. After creating your key, it will be listed on the API keys page.

## Configuring the Project

Before running the app, you need to insert your API key into the project:

1. Open the project in Xcode.
2. Locate the URL string in the project: Model/WeatherManager -> weatherURL =  "https://api.openweathermap.org/data/2.5/weather?appid=af83b9a23a5f9544ffcb0ba98a7d846c&units=metric"

3. Replace `af83b9a23a5f9544ffcb0ba98a7d846c` with your own API key obtained in the previous steps.
4. Save the changes and build the project.
