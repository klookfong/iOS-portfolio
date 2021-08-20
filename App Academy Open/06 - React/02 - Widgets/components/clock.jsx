import React, { Component } from 'react'

export default class Clock extends Component {
    constructor(props){
        super(props);
        this.state = {
            date: new Date()
        }
        this.setDate = this.setDate.bind(this);
    }
    setDate(event){
        this.setState({ date: new Date() });
    }
    componentDidMount() {
        this.interval = setInterval(() => this.setDate());
      }
    componentWillUnmount() {
        clearInterval(this.interval);
    }
      

    render() {
        return (
            <div>
                <h1>Clock</h1>
                <div className={"componentContainer bg-primary"}>
                    <h3 className={"title"}>Date: </h3>
                    <p className={"info"}>{this.state.date.getMonth()} / {this.state.date.getDate()} / {this.state.date.getFullYear()}</p>
                    <div className={"sized-box"}></div>

                    <h3 className={"title"}>Time: </h3>
                    <p className={"info"}>{this.state.date.getHours()}: {this.state.date.getMinutes()}: {this.state.date.getSeconds() < 10 ? "0" + this.state.date.getSeconds().toString() : this.state.date.getSeconds()}</p>
                </div>
            </div>
        )
    }
}
