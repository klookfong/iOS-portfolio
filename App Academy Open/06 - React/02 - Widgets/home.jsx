import React from 'react';
import Clock from './components/clock'
import Tabs from './components/tabs'
import AutoComplete from './components/autocomplete'

class Home extends React.Component{
  constructor(props){
    super(props);
    //your code here
    this.names = ["Kyle", "Josh", "Avery", "Israel", "Brandon", "Gabriel", "Jose", "Lady", "Gaga"]    
    
  }

  //your code here

  render(){
    return (
      <div>
        <h1>My Components</h1>
        <Clock />
        <div>
          <Tabs />
          <AutoComplete names={this.names}/>
        </div>
      </div>
    );
  }
}

export default Home;
