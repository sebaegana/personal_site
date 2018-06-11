if (!require("rmarkdown")) {
  install.packages("rmarkdown")
}  
if (!require("plotly")) {
    install.packages("plotly")
}
  
if (!require("tseries")) {
  install.packages("tseries")
}
if (!require("zoo")) {
  install.packages("zoo")
}

AAPL = get.hist.quote(instrument="AAPL", start="2012-01-01", end="2017-12-31", quote="AdjClose", provider="yahoo", origin="1970-01-01", compression="m", retclass="zoo")
IBM = get.hist.quote(instrument="IBM", start="2012-01-01", end="2017-12-31", quote="AdjClose", provider="yahoo", origin="1970-01-01", compression="m", retclass="zoo")

library(plotly)

Date2 <- seq(from = as.Date("2012-01-01"), to = as.Date("2017-12-31"), by = "month")

mat <- data.frame(Date = Date2, AAPL = round(AAPL, 2), BVSP = round(IBM,2))
colnames(mat) <- c("Date", "AAPL", "IBM")

p <- mat %>%
  plot_ly(x = mat$Date, y = mat$AAPL, type = "scatter", mode = "lines", fill = "tozeroy", name = "Microsoft") %>%
  add_trace(y = mat$IBM, fill = "tonexty", name = "IBM") %>%
  layout(title = "Stock Prices",
        xaxis = list(title = "Time"),
        yaxis = list(title = "Stock Prices"))

p


