import React, { Component } from 'react';
import './App.css';
import { LineChart, Line, YAxis } from 'recharts';

const btc = [
  {date: "10/24/2017", value: 5509.50},
  {date: "10/25/2017", value: 5720.00},
  {date: "10/26/2017", value: 5890.00},
  {date: "10/27/2017", value: 5759.60},
  {date: "10/28/2017", value: 5720.60},
  {date: "10/29/2017", value: 6156.00},
  {date: "10/30/2017", value: 6115.00}
]

const eth = [
  {date: "10/24/2017", value: 296.50},
  {date: "10/25/2017", value: 294.91},
  {date: "10/26/2017", value: 295.10},
  {date: "10/27/2017", value: 296.00},
  {date: "10/28/2017", value: 293.60},
  {date: "10/29/2017", value: 304.00},
  {date: "10/30/2017", value: 306.66}
]

class App extends Component {
  render() {
    return (
      <div className="App">
        <h2>BTC/USD</h2>
        <LineChart width={400} height={200} data={btc}>
          <Line type="monotone" dataKey="value" stroke="#f00" />
          <YAxis type="number" hide={true} domain={['dataMin - 200', 'dataMax + 200']} />
        </LineChart>
        <h2>ETH/USD</h2>
        <LineChart width={400} height={200} data={eth}>
          <Line type="monotone" dataKey="value" stroke="#00f" />
          <YAxis type="number" hide={true} domain={['dataMin - 10', 'dataMax + 10']} />
        </LineChart>

      </div>
    );
  }
}

export default App;
