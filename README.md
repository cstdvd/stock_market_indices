# Stock Market Indices
Stock market indices prediction made in Matlab

## First part
The first part of the project concerns the forecasting of stock market indices.

In particular, we want to forecast the daily values of the Istanbul Stock Exchange (ISE100) index in order to predict the 
direction of daily movement of this index. The prediction is based on previous values of this index and/or previous values 
of other market indices.

We refer to the Istanbul Stock Exchange Data Set wich includes returns of Istanbul Stock Exchange and seven other 
international indices: SP (Standard & Poor’s), DAX (Stock market return index of Germany), FTSE (Stock market return index 
of UK), NIKKEI (Stock market return index of Japan), BOVESPA (Stock market return index of Brazil), EU (MSCI European index),
and EM (MSCI emerging markets index). The data are time series, each consisting of 536 observations.

The main steps of the project are the following:

- Feature selection: select a subset of market indices to be used as predictors. To this aim, analyze the seven indices 
separately from each other as follows. For each index, develop a neural network (MLP or RBF) which predicts the following 
observations of the ISE100 index based on the last seven observations of the index under analysis. Select, based on MSE 
value, the best n indices as predictors for the following step;

- Forecasting model development: divide the available data into two periods, called, respectively, estimation period and 
forecasting period from now on, and:
  * use the data of the estimation period to develop, using the NN Time Series Tool, the forecast model able to predict the 
direction of movement of the ISE100 index. Build the model using the previously selected n indices as inputs, and determining
the number of input delays and the number of output delays based on a GA. Evaluate the forecast acuracy in terms of Mean 
Squared Error (MSE), Mean Absolute Percentage Error (MAPE) and percentage of correctly forecasted days;
  * use the data of the forecasting period to evaluate the so-called out-of-sample forecasting performance. In particular, 
compute for how many steps ahead the forecasting performance of the devoled model remains acceptable (in terms of MSE, MAPE 
and percentage of correctly forecasted days).

##Second part
The second part of the preject consists in developing a fuzzy system, wich forecasts the daily values of the ISE100 index 
based on previous values (i.e., the values of the day before) of (a subset of) the market indices selected as predictors in 
the first part of the project.
You can develop either a fuzzy systems with Mamdani fuzzy rules, or an ANFIS system, or both.

A report shows all the procedures.
