import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      num1: "",
      num2: "",
      operator: "",
      result: null
    }
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.setOperator = this.setOperator.bind(this);
    this.calculate = this.calculate.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(event){
    event.preventDefault();
    this.setState({num1: event.currentTarget.value});
  }

  setNum2(event){
    event.preventDefault();
    this.setState({num2: event.currentTarget.value});
  }

  setOperator(event){
    event.preventDefault();
    this.setState({operator: event.currentTarget.value});
  }

  clear(event){
    event.preventDefault();
    this.setState({
      num1: "",
      num2: "",
      operator: "",
      result: null
    });
  }

  calculate(event){
    event.preventDefault();
    const n1 = Number(this.state.num1);
    const n2 = Number(this.state.num2); 
    const op = this.state.operator;
    let res = this.state.result;
    switch (op){
      case "+":
        res = n1 + n2;
        break;
      case "-":
        res = n1-n2;
        break;
      case "*":
        res = n1*n2;
        break;
      default:
        res = n1/n2;
        break;
    }
    this.setState({result: res}); 
  }

  //your code here

  render(){
    return (
      <div className={"safeArea"}>
        <h1>Calculator App© 2021</h1>
        <h5>Input Number 1</h5>
        <input type={"number"} value={this.state.num1} onChange={this.setNum1}></input>
        <h5>Input Number 2</h5>
        <input type={"number"} value={this.state.num2} onChange={this.setNum2}></input>
        <br />
        <div>
          {
            ["*", "+", "/", "-"].map((ele, i) => {
              return <button className={"btn btn-outline"} value={ele} key={i} onClick={this.setOperator}>{ele}</button>
            })
          }
        </div>
        <div>
        <button className={"btn btn-outline"} onClick={this.calculate}> Submit </button>
        <button className={"btn btn-outline"} onClick={this.clear}> Clear </button>
        </div>
        
        <h2>{this.state.num1} {this.state.operator} {this.state.num2} = {this.state.result}</h2>
      </div>
    );
  }
}

export default Calculator;
